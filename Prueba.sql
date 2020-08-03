Parte 1:

 Crear modelo lógico para el siguiente caso.
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
prueba=> 
prueba=> CREATE TABLE cliente(
prueba(> id SERIAL,
prueba(> nombre VARCHAR,
prueba(> rut VARCHAR,
prueba(> direccion VARCHAR,
prueba(> PRIMARY KEY (id));
CREATE TABLE
prueba=> SELECT * FROM cliente;
 id | nombre | rut | direccion 
----+--------+-----+-----------
(0 rows)

prueba=> INSERT INTO cliente(nombre, rut, direccion) VALUES('Ana', '15.612.000-1', 'Teatinos 12');
INSERT 0 1

prueba=> INSERT INTO cliente(nombre, rut, direccion) VALUES('Carlos', '16.908.601-2', 'providencia 228');
INSERT 0 1
prueba=> INSERT INTO cliente(nombre, rut, direccion) VALUES('Marta', '13.061.415-k', 'los leones 1240');
INSERT 0 1
prueba=> INSERT INTO cliente(nombre, rut, direccion) VALUES('Ema', '12.080.090-1', 'valdivia 1450');
INSERT 0 1
prueba=> INSERT INTO cliente(nombre, rut, direccion) VALUES('Lorena', '10.060.225.4', 'los olmos 4015');
INSERT 0 1

prueba=> SELECT * FROM cliente;
 id | nombre |     rut      |    direccion    
----+--------+--------------+-----------------
  1 | Ana    | 15.612.000-1 | Teatinos 12
  2 | Carlos | 16.908.601-2 | providencia 228
  3 | Marta  | 13.061.415-k | los leones 1240
  4 | Ema    | 12.080.090-1 | valdivia 1450
  5 | Lorena | 10.060.225.4 | los olmos 4015
(5 rows)


prueba=> CREATE TABLE factura(
prueba(> id SERIAL,
prueba(> numero_factura INT,
prueba(> fecha DATE,
prueba(> id_cliente INT,
prueba(> sub_total INT,
prueba(> PRIMARY KEY (id),
prueba(> FOREIGN KEY (id_cliente) REFERENCES cliente(id));
CREATE TABLE
prueba=> SELECT * FROM factura;
 id | numero_factura | fecha | id_cliente | sub_total 
----+----------------+-------+------------+-----------
(0 rows)

prueba=> CREATE TABLE categoria(
prueba(> id SERIAL,
prueba(> nombre VARCHAR,
prueba(> descripcion VARCHAR,
prueba(> PRIMARY KEY (id));
CREATE TABLE
prueba=> SELECT * FROM categoria;
 id | nombre | descripcion 
----+--------+-------------
(0 rows)


prueba=> INSERT INTO categoria(nombre, descripcion) VALUES ('carne', 'categoria v');
INSERT 0 1
prueba=> INSERT INTO categoria(nombre, descripcion) VALUES ('arroz', 'abarrotes');
INSERT 0 1
prueba=> INSERT INTO categoria(nombre, descripcion) VALUES ('apio', 'vegetales');
INSERT 0 1

prueba=> SELECT * FROM categoria;
 id | nombre | descripcion 
----+--------+-------------
  1 | carne  | categoria v
  2 | arroz  | abarrotes
  3 | apio   | vegetales
(3 rows)



prueba=> CREATE TABLE producto(
prueba(> id SERIAL,
prueba(> nombre VARCHAR,
prueba(> precio_unitario INT,
prueba(> descripcion VARCHAR,
prueba(> id_categoria INT,
prueba(> PRIMARY KEY (id),
prueba(> FOREIGN KEY (id_categoria) REFERENCES categoria(id));
CREATE TABLE
prueba=> SELECT * FROM producto;
 id | nombre | precio_unitario | descripcion | id_categoria 
----+--------+-----------------+-------------+--------------
(0 rows)

prueba=> INSERT INTO producto(nombre, precio_unitario, descripcion, id_categoria) VALUES('carne', '5', 'categoria v', '1');
INSERT 0 1
prueba=> INSERT INTO producto(nombre, precio_unitario, descripcion, id_categoria) VALUES('lomo', '4','categoria v', '1'); 
INSERT 0 1
prueba=> INSERT INTO producto(nombre, precio_unitario, descripcion, id_categoria) VALUES('carne molida', '6', 'categoria v', '1'); 
INSERT 0 1
prueba=> INSERT INTO producto(nombre, precio_unitario, descripcion, id_categoria) VALUES('arroz', '5', 'abarrotes', '2');
INSERT 0 1
prueba=> INSERT INTO producto(nombre, precio_unitario, descripcion, id_categoria) VALUES('tallarines', '4', 'abarrotes', '2');
INSERT 0 1
prueba=> INSERT INTO producto(nombre, precio_unitario, descripcion, id_categoria) VALUES('puré', '7', 'abarrotes', '2');
INSERT 0 1
prueba=> INSERT INTO producto(nombre, precio_unitario, descripcion, id_categoria) VALUES('apio', '6','vegetales', '3');
INSERT 0 1
prueba=> INSERT INTO producto(nombre, precio_unitario, descripcion, id_categoria) VALUES('zanahoria', '5','vegetales', '3');
INSERT 0 1

prueba=> SELECT * FROM producto;
 id |    nombre    | precio_unitario | descripcion | id_categoria 
----+--------------+-----------------+-------------+--------------
  1 | carne        |               5 | categoria v |            1
  2 | lomo         |               4 | categoria v |            1
  3 | carne molida |               6 | categoria v |            1
  4 | arroz        |               5 | abarrotes   |            2
  5 | tallarines   |               4 | abarrotes   |            2
  6 | puré         |               7 | abarrotes   |            2
  7 | apio         |               6 | vegetales   |            3
  8 | zanahoria    |               5 | vegetales   |            3
(8 rows)



prueba=> CREATE TABLE producto_factura(
prueba(> id_producto INT,
prueba(> cantidad INT,
prueba(> id_factura INT,
prueba(> FOREIGN KEY (id_producto) REFERENCES producto(id),
prueba(> FOREIGN KEY (id_factura) REFERENCES factura (id));
CREATE TABLE
prueba=> SELECT * FROM producto_factura;
 id_producto | cantidad | id_factura 
-------------+----------+------------
(0 rows)

cliente 1 con 2 facturas:

prueba=> INSERT INTO factura(numero_factura, fecha, id_cliente, sub_total) VALUES('1', '2020-10-02', '1', '9');
INSERT 0 1
prueba=> INSERT INTO factura(numero_factura, fecha, id_cliente, sub_total) VALUES('2', '2020-04-09', '1', '11');
INSERT 0 1

prueba=> INSERT INTO factura(numero_factura, fecha, id_cliente, sub_total) VALUES('1', '2020-10-02', '1', '9');
INSERT 0 1
prueba=> INSERT INTO factura(numero_factura, fecha, id_cliente, sub_total) VALUES('2', '2020-04-09', '1', '11');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('3', '2', '1');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('4', '1', '1');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('4', '1', '2');
INSERT 0 1

prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('5', '1', '2');
INSERT 0 1

prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('7', '1', '2');
INSERT 0 1

prueba=> SELECT * FROM producto_factura;
 id_producto | cantidad | id_factura 
-------------+----------+------------
           3 |        2 |          1
           4 |        1 |          2
           5 |        1 |          2
           7 |        1 |          2
           4 |        1 |          1
(5 rows)

prueba=> SELECT * FROM factura;
 id | numero_factura |   fecha    | id_cliente | sub_total 
----+----------------+------------+------------+-----------
  1 |              1 | 2020-10-02 |          1 |         9
  2 |              2 | 2020-04-09 |          1 |        11
(2 rows)

CLIENTE 2 CON 3 FACTURAS:

prueba=> INSERT INTO factura(numero_factura, fecha, id_cliente, sub_total) VALUES ('3', '2020-08-10', '2', '15');
INSERT 0 1

prueba=> INSERT INTO factura(numero_factura, fecha, id_cliente, sub_total) VALUES ('4', '2020-06-11', '2', '9');
INSERT 0 1

prueba=> INSERT INTO factura(numero_factura, fecha, id_cliente, sub_total) VALUES ('5', '2020-06-01', '2', '15');
INSERT 0 1

prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('1', '1', '3');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('2', '1', '3');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('3', '1', '3');
INSERT 0 1

prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('4', '1', '4');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('5', '1', '4');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('5', '1', '5');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('8', '1', '5');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('7', '1', '5');
INSERT 0 1

prueba=> SELECT * FROM producto_factura;
 id_producto | cantidad | id_factura 
-------------+----------+------------
           3 |        2 |          1
           4 |        1 |          2
           5 |        1 |          2
           7 |        1 |          2
           4 |        1 |          1
           1 |        1 |          3
           2 |        1 |          3
           3 |        1 |          3
           4 |        1 |          4
           5 |        1 |          4
           5 |        1 |          5
           8 |        1 |          5
           7 |        1 |          5
(13 rows)

prueba=> SELECT * FROM factura;
 id | numero_factura |   fecha    | id_cliente | sub_total 
----+----------------+------------+------------+-----------
  1 |              1 | 2020-10-02 |          1 |         9
  2 |              2 | 2020-04-09 |          1 |        11
  3 |              3 | 2020-08-10 |          2 |        15
  4 |              4 | 2020-06-11 |          2 |         9
  5 |              5 | 2020-06-01 |          2 |        15
(5 rows)


CLIENTE 3 CON UNA FACTURA:

prueba=> INSERT INTO factura(numero_factura, fecha, id_cliente, sub_total) VALUES ('6', '2020-07-15', '3', '7');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('6', '1', '6');
INSERT 0 1

cliente 4 con 4 facturas:

prueba=> INSERT INTO factura(numero_factura, fecha, id_cliente, sub_total) VALUES ('7', '2020-02-25', '4', '11');
INSERT 0 1

prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('7', '1', '7');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('8', '1', '7');
INSERT 0 1

prueba=> INSERT INTO factura(numero_factura, fecha, id_cliente, sub_total) VALUES('8',' 2020-06-14', '4' , '17');
INSERT 0 1

prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('5', '1', '8');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('6', '1', '8');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('7', '1', '8');
INSERT 0 1

prueba=> INSERT INTO factura(numero_factura, fecha, id_cliente, sub_total) VALUES('9', '2020-03-18', '4', '20');
INSERT 0 1

prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('1', '1', '9');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('2', '1', '9');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('3', '1', '9');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('4', '1', '9');
INSERT 0 1
 id_producto | cantidad | id_factura 
-------------+----------+------------
           3 |        2 |          1
           4 |        1 |          2
           5 |        1 |          2
           7 |        1 |          2
           4 |        1 |          1
           1 |        1 |          3
           2 |        1 |          3
           3 |        1 |          3
           4 |        1 |          4
           5 |        1 |          4
           5 |        1 |          5
           8 |        1 |          5
           7 |        1 |          5
           6 |        1 |          6
           7 |        1 |          7
           8 |        1 |          7
           5 |        1 |          8
           6 |        1 |          8
           7 |        1 |          8
           1 |        1 |          9
           2 |        1 |          9
           3 |        1 |          9
           4 |        1 |          9
(23 rows)

prueba=> SELECT * FROM factura;
 id | numero_factura |   fecha    | id_cliente | sub_total 
----+----------------+------------+------------+-----------
  1 |              1 | 2020-10-02 |          1 |         9
  2 |              2 | 2020-04-09 |          1 |        11
  3 |              3 | 2020-08-10 |          2 |        15
  4 |              4 | 2020-06-11 |          2 |         9
  5 |              5 | 2020-06-01 |          2 |        15
  6 |              6 | 2020-07-15 |          3 |         7
  7 |              7 | 2020-02-25 |          4 |        11
  8 |              8 | 2020-06-14 |          4 |        17
  9 |              9 | 2020-03-18 |          4 |        20
(9 rows)

prueba=> INSERT INTO factura(numero_factura, fecha, id_cliente, sub_total) VALUES('10', '2020-03-19', '4', '6');
INSERT 0 1
prueba=> INSERT INTO producto_factura(id_producto, cantidad, id_factura) VALUES('7', '1', '10');
INSERT 0 1

prueba=> SELECT * FROM factura;
 id | numero_factura |   fecha    | id_cliente | sub_total 
----+----------------+------------+------------+-----------
  1 |              1 | 2020-10-02 |          1 |         9
  2 |              2 | 2020-04-09 |          1 |        11
  3 |              3 | 2020-08-10 |          2 |        15
  4 |              4 | 2020-06-11 |          2 |         9
  5 |              5 | 2020-06-01 |          2 |        15
  6 |              6 | 2020-07-15 |          3 |         7
  7 |              7 | 2020-02-25 |          4 |        11
  8 |              8 | 2020-06-14 |          4 |        17
  9 |              9 | 2020-03-18 |          4 |        20
 10 |             10 | 2020-03-19 |          4 |         6
(10 rows)

 id_producto | cantidad | id_factura 
-------------+----------+------------
           3 |        2 |          1
           4 |        1 |          2
           5 |        1 |          2
           7 |        1 |          2
           4 |        1 |          1
           1 |        1 |          3
           2 |        1 |          3
           3 |        1 |          3
           4 |        1 |          4
           5 |        1 |          4
           5 |        1 |          5
           8 |        1 |          5
           7 |        1 |          5
           6 |        1 |          6
           7 |        1 |          7
           8 |        1 |          7
           5 |        1 |          8
           6 |        1 |          8
           7 |        1 |          8
           1 |        1 |          9
           2 |        1 |          9
           3 |        1 |          9
           4 |        1 |          9
           7 |        1 |         10
(24 rows)

Parte 3: Consultas
Realizar las siguientes consultas:

¿Que cliente realizó la compra más cara?

SELECT factura.cliente_id, MAX( factura.sub_total ) ON factura GROUP BY  factura.cliente_id , factura.sub_total ORDER BY factura.sub_total DESC LIMIT 1;
RETURN=> cliente_id | max 
          - ---------- + -----
                  4 |      44
(1 rows)          

¿Que cliente pagó sobre 100 de monto?

SELECT id, cliente_id FROM factura WHERE sub_total >  100 ;

ERROR: ...

¿Cuantos clientes han comprado el producto 6.

VOLVER   cliente_id | id_producto
       - ---------- + -------------
                   3|            6
                   4|            6
      
(2 rows)


