CREATE DATABASE POLLOS_COPACABANA;
USE POLLOS_COPACABANA;

CREATE TABLE cliente(
    id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    edad int,
    domicilio VARCHAR(100)
);

INSERT INTO cliente(fullname, lastname, edad, domicilio)
VALUES  ('Giselle','Garcia',22,'Zona Sur'),
        ('Fernando','Mamani',20,'El Alto'),
        ('Rosa','Lopez',19,'Villa Fátima'),
        ('Pablo','Chavez',21,'Villa Copacabana'),
        ('Lucia','Perez',25,'Obrajes');



CREATE TABLE detalle_pedido(
    id_detalle_pedido INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    id_cliente INT,
    id_pedido INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

INSERT INTO detalle_pedido(id_cliente, id_pedido)
 VALUES (1,1),
        (2,2),
        (3,3),
        (4,4),
        (5,5);

CREATE TABLE pedido(
    id_pedido INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    articulo VARCHAR(100),
    costo FLOAT,
    fecha datetime
);

INSERT INTO pedido(articulo, costo, fecha)
VALUES ('Combo Feliz',23.60,12/12/2033);
INSERT INTO pedido(articulo, costo, fecha)
VALUES ('Combo Simple',17.70,23/12/2033),
       ('Combo MAX',43.10,23/12/2033),
       ('Combo Alitas',40.70,23/12/2033),
       ('Postres',14.70,23/12/2033);

SELECT * FROM cliente;
SELECT * FROM detalle_pedido;
SELECT  * FROM pedido;

SELECT cl.fullname,cl.lastname,id_detalle_pedido,ask.articulo
    FROM pedido as ask
INNER JOIN detalle_pedido as d_p on ask.id_pedido = d_p.id_pedido
INNER JOIN cliente as cl on d_p.id_cliente = cl.id_cliente
WHERE cl.fullname = 'Douglas' AND ask.articulo