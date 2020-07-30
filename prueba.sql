PRUEBA

Descripción
En el siguiente caso, se deberá modelar la siguiente problematica, revisar que el modelo haya
quedado en 3FN, para luego pasar a crear el modelo en la base de datos, poblar la base de datos y
finalmente realizar consultas sobre la misma. Para realizar los diagramas se recomienda utilizar http://
draw.io


Parte 1: Crear modelo lógico para el siguiente caso.
Una Factura pertenece a un cliente
El cliente tiene id, nombre, rut y dirección
Una factura tiene numero de factura, fecha de la factura, subtotal, iva y precio total
Una factura tiene un listado de productos, con su precio unitario, cantidad, y valor total por
producto.
Para la factura se deberá almacenar el subtotal de la factura, que corresponde a la suma de
todos los valores unitarios multiplicado por la cantidad respectiva.
Cada producto tiene un id, un nombre, descripción y un valor unitario
Cada producto pertenece a una categoría, la cual tiene un id, el nombre de la categoría y una
descripción.


eva=> CREATE DATABASE prueba;
CREATE DATABASE
eva=> \c prueba;
You are now connected to database "prueba" as user "eva".

prueba=> CREATE TABLE cliente(
prueba(> id_cliente SERIAL,
prueba(> rut VARCHAR,
prueba(> nombre VARCHAR,
prueba(> direccion VARCHAR,
prueba(> PRIMARY KEY (id_cliente));
CREATE TABLE
prueba=> SELECT * FROM cliente;
 id_cliente | rut | nombre | direccion 
------------+-----+--------+-----------
(0 rows)

prueba=> ALTER TABLE cliente ADD total_a_pagar INT;
ALTER TABLE
prueba=> SELECT * FROM cliente;
 id_cliente | rut | nombre | direccion | total_a_pagar 
------------+-----+--------+-----------+---------------
(0 rows)

prueba=> CREATE TABLE factura(
prueba(> numero_factura INT,
prueba(> id_cliente INT,
prueba(> fecha_factura DATE,
prueba(> codigo_producto INT,
prueba(> descripcion_producto VARCHAR,
prueba(> cantidad_producto INT,
prueba(> valor_unitario INT,
prueba(> sub_total INT,
prueba(> iva FLOAT,
prueba(> precio_total INT,
prueba(> FOREIGN KEY(numero_factura) REFERENCES cliente(id_cliente),
prueba(> PRIMARY KEY(id_cliente));
CREATE TABLE

numero_factura | id_cliente | fecha_factura | codigo_producto | descripcion_producto | cantidad_producto | valor_unitario | sub_total | iva | precio_total 
----------------+------------+---------------+-----------------+----------------------+-------------------+----------------+-----------+-----+--------------
(0 rows)


prueba=> CREATE TABLE producto(
prueba(> codigo_producto INT,
prueba(> descripcion_producto VARCHAR,
prueba(> valor_unitario INT,
prueba(> PRIMARY KEY (codigo_producto));
CREATE TABLE

prueba=> SELECT * FROM producto;
 codigo_producto | descripcion_producto | valor_unitario 
-----------------+----------------------+----------------
(0 rows)


prueba=> CREATE TABLE categoria(
prueba(> id_producto INT,
prueba(> nombre_categoria VARCHAR,
prueba(> id_categoria INT,
prueba(> FOREIGN KEY(id_producto) REFERENCES productoe(codigo_producto),
prueba(> FOREIGN KEY(id_producto) REFERENCES producto(codigo_producto),
prueba(> PRIMARY KEY(codigo_producto));
ERROR:  column "codigo_producto" named in key does not exist
LINE 7: PRIMARY KEY(codigo_producto));
        ^
prueba=> CREATE TABLE categoria(
prueba(> codigo_producto INT,
prueba(> nombre_categoria VARCHAR,
prueba(> id_categoria INT,
prueba(> FOREIGN KEY(codigo_producto) REFERENCES producto(codigo_producto),
prueba(> PRIMARY KEY(codigo_producto));
CREATE TABLE

prueba=> SELECT * FROM categoria;
 codigo_producto | nombre_categoria | id_categoria 
-----------------+------------------+--------------
(0 rows)

Parte 2: Creando el modelo en la base de datos
Se debe crear el modelo en la base de datos, en una base de datos llamada prueba , e insertar los
siguientes registros:
5 clientes
8 productos
3 categorias
10 facturas
2 para el cliente 1, con 2 y 3 productos
3 para el cliente 2, con 3, 2 y 3 productos
1 para el cliente 3, con 1 producto
4 para el cliente 4, con 2, 3, 4 y 1 producto.



