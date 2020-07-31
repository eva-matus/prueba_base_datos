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


Parte 1: Crear modelo lógico para el siguiente caso.
eva=> DROP DATABASE prueba;
DROP DATABASE
eva=> CREATE DATABASE prueba;
CREATE DATABASE
eva=> \c prueba;
You are now connected to database "prueba" as user "eva".

prueba=> CREATE TABLE factura(
prueba(> num_factura INT,
prueba(> fecha_factura DATE,
prueba(> id_cliente INT,
prueba(> iva INT,
prueba(> total_factura INT,
prueba(> PRIMARY KEY (num_factura));
CREATE TABLE
prueba=> SELECT * FROM factura;
 num_factura | fecha_factura | id_cliente | iva | total_factura 
-------------+---------------+------------+-----+---------------
(0 rows)

prueba=> CREATE TABLE cliente(
prueba(> id_cliente INT,
prueba(> rut VARCHAR,
prueba(> nombre VARCHAR,
prueba(> direccion VARCHAR,
prueba(> cant_productos INT,
prueba(> total INT,
prueba(> PRIMARY KEY (rut));
CREATE TABLE
prueba=> SELECT * FROM cliente;
 id_cliente | rut | nombre | direccion | cant_productos | total 
------------+-----+--------+-----------+----------------+-------
(0 rows)

prueba=> CREATE TABLE productos(
prueba(> cod_producto INT,
prueba(> nombre_producto VARCHAR,
prueba(> precio_producto INT,
prueba(> PRIMARY KEY (cod_producto));
CREATE TABLE
prueba=> SELECT * FROM productos;
 cod_producto | nombre_producto | precio_producto 
--------------+-----------------+-----------------
(0 rows)

prueba=> CREATE TABLE venta(
prueba(> num_factura INT,
prueba(> rut VARCHAR,
prueba(> nombre_producto VARCHAR,
prueba(> cant_productos INT,
prueba(> precio_producto INT,
prueba(> total INT,
prueba(> FOREIGN KEY (num_factura) REFERENCES factura (num_factura),
prueba(> FOREIGN KEY (rut) REFERENCES cliente (rut));
CREATE TABLE
prueba=> SELECT * FROM venta;
 num_factura | rut | nombre_producto | cant_productos | precio_producto | total 
-------------+-----+-----------------+----------------+-----------------+-------
(0 rows)

prueba=> CREATE TABLE categoria(
prueba(> cod_categoria INT,
prueba(> nombre_categoria VARCHAR,
prueba(> cod_producto INT,
prueba(> FOREIGN KEY (cod_categoria) REFERENCES productos (cod_producto));
CREATE TABLE
prueba=> SELECT * FROM categoria;
 cod_categoria | nombre_categoria | cod_producto 
---------------+------------------+--------------
(0 rows)

prueba=> INSERT INTO factura(num_factura, fecha_factura, id_cliente, iva, total_factura) VALUES ('1234', '2020-10-02', '001', '12', '72');
INSERT 0 1
prueba=> INSERT INTO factura(num_factura, fecha_factura, id_cliente, iva, total_factura) VALUES ('1320','2020-07-10', '001', '11', '66');
INSERT 0 1
prueba=> INSERT INTO factura(num_factura, fecha_factura, id_cliente, iva, total_factura) VALUES ('15253', '2020-03-15', '002', '23', '138');
INSERT 0 1
prueba=> INSERT INTO factura(num_factura, fecha_factura, id_cliente, iva, total_factura) VALUES ('11620', '2020-02-10', '002', '11', '65');
INSERT 0 1
prueba=> INSERT INTO factura(num_factura, fecha_factura, id_cliente, iva, total_factura) VALUES ('203015', '2019-02-18', '002', '36', '228');
INSERT 0 1
prueba=> INSERT INTO factura(num_factura, fecha_factura, id_cliente, iva, total_factura) VALUES ('121096', '2020-01-01', '003', '10', '60');
INSERT 0 1
prueba=> INSERT INTO factura(num_factura, fecha_factura, id_cliente, iva, total_factura) VALUES ('75621', '2020-01-25', '004', '9', '54');
INSERT 0 1
prueba=> INSERT INTO factura(num_factura, fecha_factura, id_cliente, iva, total_factura) VALUES ('76622', '2020-06-06', '004', '9', '54');
INSERT 0 1
prueba=> INSERT INTO factura(num_factura, fecha_factura, id_cliente, iva, total_factura) VALUES ('78520', '2020-04-15', '004', '19', '114');
INSERT 0 1
prueba=> INSERT INTO factura(num_factura, fecha_factura, id_cliente, iva, total_factura) VALUES ('77020', '2020-03-04', '004', '10', '60');
INSERT 0 1


prueba=> SELECT * FROM factura;
 num_factura | fecha_factura | id_cliente | iva | total_factura 
-------------+---------------+------------+-----+---------------
        1234 | 2020-10-02    |          1 |  12 |            72
        1320 | 2020-07-10    |          1 |  11 |            66
       15253 | 2020-03-15    |          2 |  23 |           138
       11620 | 2020-02-10    |          2 |  11 |            65
      203015 | 2019-02-18    |          2 |  36 |           228
      121096 | 2020-01-01    |          3 |  10 |            60
       75621 | 2020-01-25    |          4 |   9 |            54
       76622 | 2020-06-06    |          4 |   9 |            54
       78520 | 2020-04-15    |          4 |  19 |           114
       77020 | 2020-03-04    |          4 |  10 |            60
(10 rows)


prueba=> INSERT INTO cliente(id_cliente, rut, nombre, direccion, cant_productos, total) VALUES ('001', '15.612.000.1', 'ana solis', 'teatinos 12', '5', '138');
INSERT 0 1
prueba=> INSERT INTO cliente(id_cliente, rut, nombre, direccion, cant_productos, total) VALUES ('002', '16.908.601-2', 'carlos veliz', 'providencia 228', '12', '431');
INSERT 0 1
prueba=> INSERT INTO cliente(id_cliente, rut, nombre, direccion, cant_productos, total) VALUES ('003', '13.061.415-k', 'marta poblete', 'los leones 1240', '1', '60');
INSERT 0 1
prueba=> INSERT INTO cliente(id_cliente, rut, nombre, direccion, cant_productos, total) VALUES ('004', '12.080.090-1', 'ema tapia', 'valdivia 1450', '10', '282');
INSERT 0 1
prueba=> INSERT INTO cliente(id_cliente, rut, nombre, direccion, cant_productos, total) VALUES ('005', '10.060.225.4', 'lorena cruz', 'los olmos 4015', '0', '0');
INSERT 0 1

prueba=> SELECT * FROM cliente;
 id_cliente |     rut      |    nombre     |    direccion    | cant_productos | total 
------------+--------------+---------------+-----------------+----------------+-------
          1 | 15.612.000.1 | ana solis     | teatinos 12     |              5 |   138
          2 | 16.908.601-2 | carlos veliz  | providencia 228 |             12 |   431
          3 | 13.061.415-k | marta poblete | los leones 1240 |              1 |    60
          4 | 12.080.090-1 | ema tapia     | valdivia 1450   |             10 |   282
          5 | 10.060.225.4 | lorena cruz   | los olmos 4015  |              0 |     0
(5 rows)

prueba=> INSERT INTO productos(cod_producto, nombre_producto, precio_producto) VALUES ('1', 'carne', '40');
INSERT 0 1
prueba=> INSERT INTO productos(cod_producto, nombre_producto, precio_producto) VALUES ('2', 'carne molida', '12');
INSERT 0 1
prueba=> INSERT INTO productos(cod_producto, nombre_producto, precio_producto) VALUES ('3', 'lomo vetado', '50');
INSERT 0 1
prueba=> INSERT INTO productos(cod_producto, nombre_producto, precio_producto) VALUES ('4', 'arroz', '20');
INSERT 0 1
prueba=> INSERT INTO productos(cod_producto, nombre_producto, precio_producto) VALUES ('5', 'pure', '10');
INSERT 0 1
prueba=> INSERT INTO productos(cod_producto, nombre_producto, precio_producto) VALUES ('6', 'tallarines', '15');
INSERT 0 1
prueba=> INSERT INTO productos(cod_producto, nombre_producto, precio_producto) VALUES ('7', 'apio', '20');
INSERT 0 1
prueba=> INSERT INTO productos(cod_producto, nombre_producto, precio_producto) VALUES ('8', 'zanahoria', '25');
INSERT 0 1

prueba=> SELECT * FROM productos;
 cod_producto | nombre_producto | precio_producto 
--------------+-----------------+-----------------
            1 | carne           |              40
            2 | carne molida    |              12
            3 | lomo vetado     |              50
            4 | arroz           |              20
            5 | pure            |              10
            6 | tallarines      |              15
            7 | apio            |              20
            8 | zanahoria       |              25
(8 rows)

prueba=> INSERT INTO venta(num_factura, nombre_producto, cant_productos, precio_producto, total) VALUES ('15253', 'lomo vetado-zanahoria-carne', '3', '115', '138');
INSERT 0 1
prueba=> INSERT INTO venta(num_factura, nombre_producto, cant_productos, precio_producto, total) VALUES ('11620', 'tallarines-carne molida', '4', '54', '65');
INSERT 0 1
prueba=> INSERT INTO venta(num_factura, nombre_producto, cant_productos, precio_producto, total) VALUES ('203015', 'carne-carne molida-lomo vetado', '5', '192', '228');
INSERT 0 1
prueba=> INSERT INTO venta(num_factura, nombre_producto, cant_productos, precio_producto, total) VALUES ('121096', 'lomo vetado', '1', '50', '60');
INSERT 0 1
prueba=> INSERT INTO venta(num_factura, nombre_producto, cant_productos, precio_producto, total) VALUES ('75621', 'apio-zanahoria', '2', '45', '54');
INSERT 0 1
prueba=> INSERT INTO venta(num_factura, nombre_producto, cant_productos, precio_producto, total) VALUES ('76622', 'arroz-pure-tallarines', '3', '45', '54');
INSERT 0 1
prueba=> INSERT INTO venta(num_factura, nombre_producto, cant_productos, precio_producto, total) VALUES ('78520', 'carne-arroz-zanahoria-pure', '4', '95', '114');
INSERT 0 1
prueba=> INSERT INTO venta(num_factura, nombre_producto, cant_productos, precio_producto, total) VALUES ('77020', 'lomo vetado', '1', '50', '60');
INSERT 0 1

num_factura |        nombre_producto         | cant_productos | precio_producto | total 
-------------+--------------------------------+----------------+-----------------+-------
        1234 | arroz- carne                   |              2 |              60 |    72
        1320 | apio-zanahoria-pure            |              3 |              55 |    66
       15253 | lomo vetado-zanahoria-carne    |              3 |             115 |   138
       11620 | tallarines-carne molida        |              4 |              54 |    65
      203015 | carne-carne molida-lomo vetado |              5 |             192 |   228
      121096 | lomo vetado                    |              1 |              50 |    60
       75621 | apio-zanahoria                 |              2 |              45 |    54
       76622 | arroz-pure-tallarines          |              3 |              45 |    54
       78520 | carne-arroz-zanahoria-pure     |              4 |              95 |   114
       77020 | lomo vetado                    |              1 |              50 |    60
(10 rows)

prueba=> INSERT INTO categoria(cod_categoria, nombre_categoria, cod_producto) VALUES ('1', 'abarrotes', '1');
INSERT 0 1
prueba=> INSERT INTO categoria(cod_categoria, nombre_categoria, cod_producto) VALUES ('2', 'vegetales', '2');
INSERT 0 1
prueba=> INSERT INTO categoria(cod_categoria, nombre_categoria, cod_producto) VALUES ('3', 'carnes', '3');
INSERT 0 1
prueba=> SELECT * FROM categoria;
                     prueba
 cod_categoria | nombre_categoria | cod_producto 
---------------+------------------+--------------
             1 | abarrotes        |            1
             2 | vegetales        |            2
             3 | carnes           |            3
(3 rows)



¿Que cliente realizó la compra más cara?

prueba=> SELECT MAX (total) FROM cliente;
prueba
 max 
-----
 431
(1 row)

¿Que cliente pagó sobre 100 de monto?

prueba=> SELECT nombre FROM cliente WHERE total > 100;
    prueba
    nombre    
--------------
 ana solis
 carlos veliz
 ema tapia
(3 rows)

¿Cuantos clientes han comprado el producto 6.

prueba=> SELECT * FROM productos WHERE (cod_producto = 6);
 cod_producto | nombre_producto | precio_producto 
--------------+-----------------+-----------------
            6 | tallarines      |              15
(1 row)
 prueba
 cant   
--------------
 2
 (1 row)
 
 
 
 

