-- Consulta 1 — Vista base del proyecto (INNER JOIN).
-- Propósito: Unir en una sola vista la información de las tablas ventas, clientes, productos, categorías y territorios para facilitar el análisis.
-- Hallazgo: La consulta permite relacionar cada venta con su cliente, segmento, producto, categoría y región. De esta manera podemos ver el panorama completo de la información comercial.
SELECT 
	v.fecha_venta,
	c.id_cliente,
	c.nombre AS nombre_cliente,
	c.segmento,
	p.nombre_producto AS producto,
	p.descripcion_producto,
	cat.nombre_categoria AS categoria,
	v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta,
    t.region
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN productos p ON v.id_producto = p.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
INNER JOIN territorios t ON c.id_territorio = t.id_territorio
;


-- Consulta 2 — Clientes sin ventas (LEFT JOIN).
-- Propósito: Identificar los clientes que están registrados pero no tienen ninguna venta asociada.
-- Hallazgo: Se identificaron 2 clientes sin ventas registradas: Sofía Martínez (id_cliente 6) y Sara Torino (id_cliente 7).
SELECT
	c.nombre AS cliente,
	c.email,
	c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL
;

--Consulta 3 — Productos sin ventas (LEFT JOIN).
-- Propósito: Identificar los productos del catálogo que no tienen ninguna venta registrada.
-- Hallazgo: Se identificaron 3 productos sin ventas registradas: Webcam HD, Parlante Bluetooth y Memoria USB 128GB.
SELECT
	p.id_producto,
	p.nombre_producto,
	p.precio,
	cat.nombre_categoria AS categoria
FROM productos p
LEFT JOIN ventas v ON p.id_producto = v.id_producto
LEFT JOIN categorias cat ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL
;

--Consulta 4 — Consolidado por canal (UNION ALL)
-- Propósito: Combinar las ventas de marzo y abril, identificándolas como Online y Presencial respectivamente, y calcular el total facturado por canal.
-- Hallazgo: El canal Online registró $6.444, correspondiente a las ventas de marzo, mientras que el canal Presencial registró $4.880, correspondiente a las ventas de abril.
SELECT
canal,
    SUM(total_venta) AS total_facturado
FROM (
SELECT
	cantidad * precio_unitario AS total_venta,
	'Online' AS canal
FROM ventas 
WHERE MONTH(fecha_venta) = 3

UNION ALL 

SELECT
	cantidad * precio_unitario AS total_venta,
	'Presencial' AS canal
FROM ventas v
WHERE MONTH(fecha_venta) = 4
) AS ventas_por_canal
GROUP BY canal
;