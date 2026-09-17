
DROP DATABASE IF EXISTS Ventas_Tech_DB;
--DDL --
--Creación de base de datos
CREATE DATABASE Ventas_Tech_DB;
USE Ventas_Tech_DB;

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

--Creación de tablas 
CREATE TABLE categorias (
id_categoria	 INT PRIMARY KEY,
nombre_categoria VARCHAR(50) NOT NULL,
descripcion		 VARCHAR (200)
);

CREATE TABLE clientes (
id_cliente		 INT			 PRIMARY KEY,
nombre			 VARCHAR(100)	 NOT NULL,
email			 VARCHAR(100)	 UNIQUE,
ciudad			 VARCHAR(50),
fecha_registro   DATE			 NOT NULL
);

CREATE TABLE productos (
id_producto	INT			  PRIMARY KEY,
nombre_producto VARCHAR(100)  NOT NULL,
id_categoria	INT,
precio			DECIMAL(10,2) NOT NULL,
stock			INT			  DEFAULT 0,
activo			TINYINT	  DEFAULT 1,
FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE ventas (
id_venta INT PRIMARY KEY,
id_cliente INT,
id_producto INT,
cantidad INT NOT NULL,
precio_unitario DECIMAL(10,2) NOT NULL,
fecha_venta DATE NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

--DML
--Insertar datos en las tablas

INSERT INTO categorias VALUES (1, 'Computación', 'Laptops, PCs y monitores');
INSERT INTO categorias VALUES (2, 'Accesorios', 'Periféricos y complementos');
INSERT INTO categorias VALUES (3, 'Audio', 'Auriculares y parlantes');
INSERT INTO categorias VALUES (4, 'Almacenamiento', 'Discos y memorias');

INSERT INTO clientes VALUES (1, 'María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05');
INSERT INTO clientes VALUES (2, 'Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10');
INSERT INTO clientes VALUES (3, 'Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01');
INSERT INTO clientes VALUES (4, 'Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15');
INSERT INTO clientes VALUES (5, 'Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');

INSERT INTO productos VALUES (1, 'Laptop Pro 15',       1, 1200.00, 15, 1);
INSERT INTO productos VALUES (2, 'Mouse Inalámbrico',   2,   28.00, 80, 1);
INSERT INTO productos VALUES (3, 'Monitor 4K 27"',      1,  450.00, 12, 1);
INSERT INTO productos VALUES (4, 'Auriculares BT Pro',  3,  120.00, 35, 1);
INSERT INTO productos VALUES (5, 'SSD Externo 1TB',     4,  130.00, 18, 1);
INSERT INTO productos VALUES (6, 'Teclado Mecánico',    2,   95.00, 40, 1);

INSERT INTO ventas VALUES (1,  1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO ventas VALUES (2,  2, 2, 5,   28.00, '2024-03-06');
INSERT INTO ventas VALUES (3,  3, 3, 1,  450.00, '2024-03-07');
INSERT INTO ventas VALUES (4,  1, 4, 2,  120.00, '2024-03-08');
INSERT INTO ventas VALUES (5,  4, 5, 3,  130.00, '2024-03-10');
INSERT INTO ventas VALUES (6,  2, 6, 4,   95.00, '2024-03-11');
INSERT INTO ventas VALUES (7,  5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO ventas VALUES (8,  3, 2, 8,   28.00, '2024-03-13');
INSERT INTO ventas VALUES (9,  4, 4, 1,  120.00, '2024-03-14');
INSERT INTO ventas VALUES (10, 5, 3, 2,  450.00, '2024-03-15');

-- Confirma que cada tabla se cargó correctamente
SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;

--Insertar nuevas entradas a la tabla de ventas con diferentes fechas

-- ELIMINAR LAS VENTAS AGREGADAS ANTERIORMENTE
DELETE FROM ventas
WHERE id_venta BETWEEN 11 AND 38;


-- ABRIL: 8 ventas
INSERT INTO ventas VALUES (11, 1, 1, 1, 1200.00, '2024-04-05');
INSERT INTO ventas VALUES (12, 2, 2, 8, 28.00, '2024-04-08');
INSERT INTO ventas VALUES (13, 3, 3, 2, 450.00, '2024-04-11');
INSERT INTO ventas VALUES (14, 4, 4, 5, 120.00, '2024-04-15');
INSERT INTO ventas VALUES (15, 5, 5, 4, 130.00, '2024-04-18');
INSERT INTO ventas VALUES (16, 1, 6, 8, 95.00, '2024-04-21');
INSERT INTO ventas VALUES (17, 2, 4, 4, 120.00, '2024-04-24');
INSERT INTO ventas VALUES (18, 3, 2, 7, 28.00, '2024-04-27');


-- MAYO: 11 ventas
INSERT INTO ventas VALUES (19, 4, 1, 1, 1200.00, '2024-05-03');
INSERT INTO ventas VALUES (20, 5, 2, 10, 28.00, '2024-05-06');
INSERT INTO ventas VALUES (21, 1, 3, 2, 450.00, '2024-05-09');
INSERT INTO ventas VALUES (22, 2, 4, 5, 120.00, '2024-05-12');
INSERT INTO ventas VALUES (23, 3, 5, 5, 130.00, '2024-05-15');
INSERT INTO ventas VALUES (24, 4, 6, 8, 95.00, '2024-05-18');
INSERT INTO ventas VALUES (25, 5, 3, 1, 450.00, '2024-05-21');
INSERT INTO ventas VALUES (26, 1, 4, 4, 120.00, '2024-05-24');
INSERT INTO ventas VALUES (27, 2, 2, 10, 28.00, '2024-05-26');
INSERT INTO ventas VALUES (28, 3, 6, 4, 95.00, '2024-05-28');
INSERT INTO ventas VALUES (29, 4, 5, 1, 130.00, '2024-05-30');



-- CREACIÓN DE LA TABLA TERRITORIOS
CREATE TABLE territorios (
    id_territorio INT PRIMARY KEY,
    region VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    zona VARCHAR(50),
    barrio VARCHAR(50),
    punto_venta VARCHAR(100)
);

-- INSERTAR 5 REGISTROS
INSERT INTO territorios VALUES
(1, 'Centro', 'Argentina', 'Buenos Aires', 'Microcentro', 'San Nicolás', 'Sucursal Centro'),
(2, 'Centro', 'Argentina', 'Córdoba', 'Nueva Córdoba', 'Nueva Córdoba', 'Sucursal Córdoba'),
(3, 'Litoral', 'Argentina', 'Rosario', 'Centro', 'Centro', 'Sucursal Rosario'),
(4, 'Cuyo', 'Argentina', 'Mendoza', 'Capital', 'Centro', 'Sucursal Mendoza'),
(5, 'Noroeste', 'Argentina', 'Tucumán', 'San Miguel', 'Centro', 'Sucursal Tucumán');

-- VERIFICAR LA TABLA
SELECT * FROM clientes;

USE Ventas_Tech_DB;

-- Agregar la columna id_territorio a clientes
ALTER TABLE clientes
ADD id_territorio INT;

-- Asignar territorios
UPDATE clientes SET id_territorio = 1 WHERE id_cliente = 1;
UPDATE clientes SET id_territorio = 2 WHERE id_cliente = 2;
UPDATE clientes SET id_territorio = 3 WHERE id_cliente = 3;
UPDATE clientes SET id_territorio = 2 WHERE id_cliente = 4;
UPDATE clientes SET id_territorio = 5 WHERE id_cliente = 5;

-- Crear la relación con territorios
ALTER TABLE clientes
ADD FOREIGN KEY (id_territorio)
REFERENCES territorios(id_territorio);

-- Verificar
SELECT * FROM clientes;

--- Añadir cliente sin ventas
INSERT INTO clientes (
    id_cliente,
    nombre,
    email,
    ciudad,
    fecha_registro,
    id_territorio
)
VALUES (
    6,
    'Sofía Martínez',
    'sofia@mail.com',
    'Mendoza',
    '2024-04-01',
    4
);

INSERT INTO clientes (
    id_cliente,
    nombre,
    email,
    ciudad,
    fecha_registro,
    id_territorio
)
VALUES (
    7,
    'Sara Torino',
    'sarato@mail.com',
    'Buenos Aires',
    '2024-04-01',
    1
);

-- Crear productos sin ventas

INSERT INTO productos (
    id_producto,
    nombre_producto,
    id_categoria,
    precio,
    stock,
    activo
)
VALUES
(7, 'Webcam HD', 2, 75.00, 25, 1),
(8, 'Parlante Bluetooth', 3, 85.00, 20, 1),
(9, 'Memoria USB 128GB', 4, 25.00, 50, 1);


-- Agregar la columna segmento
ALTER TABLE clientes
ADD segmento VARCHAR(50);

-- Asignar segmento a cada cliente
UPDATE clientes SET segmento = 'Minorista' WHERE id_cliente = 1;
UPDATE clientes SET segmento = 'Mayorista' WHERE id_cliente = 2;
UPDATE clientes SET segmento = 'Corporativo' WHERE id_cliente = 3;
UPDATE clientes SET segmento = 'Mayorista' WHERE id_cliente = 4;
UPDATE clientes SET segmento = 'Minorista' WHERE id_cliente = 5;
UPDATE clientes SET segmento = 'Corporativo' WHERE id_cliente = 6;


-- Agregar columna de descripcion a la tabla productos
ALTER TABLE productos
ADD descripcion_producto VARCHAR(200);

-- Agregar descripción a cada producto
UPDATE productos SET descripcion_producto = 'Laptop profesional de 15 pulgadas' WHERE id_producto = 1;
UPDATE productos SET descripcion_producto = 'Mouse inalámbrico ergonómico' WHERE id_producto = 2;
UPDATE productos SET descripcion_producto = 'Monitor 4K de 27 pulgadas' WHERE id_producto = 3;
UPDATE productos SET descripcion_producto = 'Auriculares Bluetooth profesionales' WHERE id_producto = 4;
UPDATE productos SET descripcion_producto = 'Unidad SSD externa de 1 TB' WHERE id_producto = 5;
UPDATE productos SET descripcion_producto = 'Teclado mecánico para uso profesional' WHERE id_producto = 6;
UPDATE productos SET descripcion_producto = 'Cámara web HD para videollamadas' WHERE id_producto = 7;
UPDATE productos SET descripcion_producto = 'Parlante portátil con conexión Bluetooth' WHERE id_producto = 8;
UPDATE productos SET descripcion_producto = 'Memoria USB con capacidad de 128 GB' WHERE id_producto = 9;

