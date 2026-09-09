USE Ventas_Tech_DB;

--CONSULTA 1
--El temario indica que se debe agrupar por mes con EXTRACT(MONTH FROM fecha_venta). Sin embargo, esa función no funciona en SQL Server. Investigué la forma de hacerlo y encontré que se debe usar la función MONTH().

SELECT
	MONTH(fecha_venta) AS mes,
	SUM(cantidad * precio_unitario) AS total_facturado,
	COUNT(id_venta) AS cantidad_pedidos,
	AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes ASC
;

--CONSULTA 2
-- Uso TOP y no LIMIT como se indica en el temario, porque este no funciona en SQL Server

SELECT
TOP 5
	id_producto,
	SUM(cantidad) AS unidades_vendidas,
	SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC
;


-- CONSULTA 3

SELECT
	id_cliente,
	COUNT(*) AS cantidad_pedidos,
	SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
;

-- CONSULTA 4
-- Calculé el total facturado por mes mediante SUM y utilicé una subconsulta dentro del CASE WHEN para obtener el promedio de los totales mensuales y comparar cada mes con ese promedio

SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE 
        WHEN SUM(cantidad * precio_unitario) >= (
            SELECT AVG(total_mensual)
            FROM (SELECT 
                SUM(cantidad * precio_unitario) AS total_mensual
            FROM ventas
            GROUP BY MONTH(fecha_venta)
            ) AS meses
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY total_facturado DESC;


-- HALLAZGOS
-- 1. Marzo fue el mes con mayor facturación y mayor ticket promedio. Por el contrario, Abril presentó la menor facturación total, aunque su ticket promedio fue mayor que el de mayo.
-- 2. El cliente con id #1 tuvo el mayor valor en compras en los últimos meses respecto a los demás clientes.
-- 3. El producto con id #1 es el que ha generado mayor facturación, aunque cuenta con pocas unidades de venta. Esto indica que, probablemente, su alta facturación se debe a su precio unitario.