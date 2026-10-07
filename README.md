# RetailPro: Análisis de la disminución de ventas del último trimestre
Proyecto académico de Data Analytics que analiza el comportamiento de las ventas del proyecto RetailPro e identifica los productos u otros factores comerciales que pueden estar relacionados con su disminución en ventas durante el último trimestre.
## Tabla de contenido
1.	Descripción del proyecto
2.	Objetivos
3.	Preguntas de análisis
4.	Herramientas utilizadas
5.	Estructura del repositorio
6.	Modelo de datos
7.	Descripción de los scripts SQL
8.	Instrucciones de ejecución
9.	Transformación en Power Query
10.	Modelado y visualización en Power BI
11.	Resultados y entregables

## Descripción del proyecto
RetailPro es una empresa del sector retail que registró una caída en sus ventas durante el último trimestre. El proyecto enfocado en analizar dicha disminución e identificar los factores relacionados con este comportamiento. El proyecto incluye la creación de una base de datos, la elaboración de consultas SQL y el uso de herramientas para preparar, modelar y visualizar los datos.
Pregunta principal del proyecto:
¿Por qué las ventas totales de RetailPro disminuyeron durante el último trimestre y qué productos contribuyeron principalmente a esta disminución?

### Objetivos
**Objetivo general**


Analizar la disminución de las ventas durante el último trimestre e identificar los productos que contribuyeron principalmente a esta variación.


**Objetivos específicos**


•	Diseñar un modelo de datos relacional con sus tablas y relaciones.

•	Analizar la evolución de las ventas mensuales y compararla con el promedio.

•	Identificar los productos con mayor facturación.

•	Reconocer clientes recurrentes.

•	Explorar otros factores que puedan estar relacionados con la variación de las ventas, según la información disponible.

•	Preparar y limpiar los datos con Power Query.

•	Construir visualizaciones y medidas con DAX en Power BI.


### Preguntas de análisis


•	¿Cuál es el porcentaje de disminución de ventas totales de RetailPro durante el último trimestre en comparación con los anteriores?

•	¿Qué productos presentaron la mayor disminución en ventas en el último trimestre?

•	¿Qué segmentos de producto tuvieron la mayor disminución de ventas en el último trimestre?

•	¿En qué ciudades, barrios y puntos de venta se concentran las mayores disminuciones?

•	¿Qué vendedores presentan las mayores disminuciones en ventas y qué productos contribuyen a su menor desempeño?

•	¿Existe una disminución en el número de clientes totales del último trimestre? 

## Herramientas utilizadas

### Herramienta	Uso en el proyecto
SQL Server	Creación de la base de datos y las tablas, definición de relaciones y consultas para responder preguntas de negocio (JOIN, UNION, funciones de agregación).

Power Query	Preparación, limpieza y transformación de datos: tratamiento de valores nulos y duplicados, revisión de tipos de datos y combinación de información.

Power BI	Modelado de datos, medidas DAX, validación de resultados y diseño de visualizaciones para el análisis comercial.
GitHub	Almacenamiento, versionado y documentación de scripts SQL, archivos de análisis y entregables.

## Estructura del repositorio
La estructura del repositorio es la siguiente:
RetailPro/

├── ventas_tech_db.sql

├── m4_consultas_negocio.sql

├── m5_consultas_joins.sql

└── README.md

## Modelo de datos
La base de datos Ventas_Tech_DB contiene las tablas categorias, clientes, productos y ventas. Durante el desarrollo también se incorporó la tabla territorios y se realizaron ajustes en algunas tablas para ampliar la información disponible para las consultas.Las tablas se relacionan mediante claves primarias y foráneas. Estas relaciones permiten combinar la información para realizar consultas sobre ventas, clientes, productos, categorías y territorios.

## Descripción de los scripts SQL
**ventas_tech_db.sql**
Contiene las instrucciones para crear la base de datos Ventas_Tech_DB, definir las tablas y establecer sus relaciones. También incluye datos para trabajar con las consultas del proyecto.Importante: el script incluye una instrucción DROP DATABASE IF EXISTS, que elimina la base de datos si ya existe. Antes de ejecutarlo, revisa su contenido y asegúrate de no necesitar conservar los datos almacenados.

**m4_consultas_negocio.sql**
Incluye cuatro consultas para analizar el comportamiento comercial:

•	Calcular las ventas mensuales, el número de pedidos y el ticket promedio.

•	Identificar los cinco productos con mayor facturación.

•	Identificar clientes recurrentes mediante el número de compras.

•	Comparar las ventas mensuales con el promedio del período analizado.


**m5_consultas_joins.sql**
Contiene consultas que utilizan INNER JOIN, LEFT JOIN y UNION ALL para combinar información de diferentes tablas. Permite consultar información de ventas, clientes, productos, categorías y territorios, así como identificar clientes y productos que no registran ventas en los datos consultados. También incluye una consulta de resumen por canal en la que las etiquetas se asignan dentro de la consulta. Estas etiquetas no representan necesariamente canales almacenados en la tabla de ventas.

## Instrucciones de ejecución

### Requisitos previos
•	SQL Server. 

•	SQL Server Management Studio (SSMS).

•	Power BI Desktop (para abrir el archivo .pbix).

•	Los scripts SQL del repositorio.


### Pasos de ejecución
1.	Abre SQL Server Management Studio y conéctate a tu instancia de SQL Server.
2.	Abre ventas_tech_db.sql y revisa las instrucciones antes de ejecutarlo.
3.	Ejecuta el script para crear y preparar la base de datos.
4.	Abre m4_consultas_negocio.sql y ejecuta las consultas de análisis comercial.
5.	Abre m5_consultas_joins.sql y ejecuta las consultas de combinación y exploración de datos.
Los scripts de los módulos 4 y 5 deben ejecutarse después de crear y cargar las tablas necesarias. 

### Transformación en Power Query
Power Query se utilizó para preparar y transformar los datos antes de su análisis. Entre las actividades realizadas se encuentran la revisión de tipos de datos, el tratamiento de valores nulos, la eliminación de duplicados y la combinación de información para preparar los datos utilizados en Power BI.
Modelado y visualización en Power BI
Power BI se utilizó para modelar los datos, establecer relaciones entre las tablas, crear medidas con DAX y elaborar visualizaciones para analizar el comportamiento de las ventas. También se trabajó en la validación de los resultados frente a las consultas SQL.

## Resultados y entregables
Las consultas SQL permiten explorar las ventas mensuales, los productos con mayor facturación, los clientes recurrentes y las diferencias entre las ventas mensuales y el promedio del período. Estos resultados sirven como punto de partida para profundizar en las causas de la disminución de las ventas. Las conclusiones sobre productos, segmentos y territorios deben sustentarse en los datos y las consultas correspondientes. Las preguntas que no se resuelven con los scripts actuales requieren análisis adicionales.
