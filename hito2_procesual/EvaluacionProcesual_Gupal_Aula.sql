CREATE DATABASE defensa_hito2;
USE defensa_hito2;

#AREA DE LAS TABLAS

CREATE TABLE autor
(
    id_autor    INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name        VARCHAR(100),
    nacionality VARCHAR(50)
);

CREATE TABLE book
(
    id_book   INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    codigo    VARCHAR(25)                        NOT NULL,
    isbn      VARCHAR(50),
    title     VARCHAR(100),
    editorial VARCHAR(50),
    pages     INTEGER,
    id_autor  INTEGER,
    FOREIGN KEY (id_autor) REFERENCES autor (id_autor)
);

CREATE TABLE category
(
    id_cat  INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    type    VARCHAR(50),
    id_book INTEGER,
    FOREIGN KEY (id_book) REFERENCES book (id_book)
);

CREATE TABLE users
(
    id_user  INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ci       VARCHAR(15)                        NOT NULL,
    fullname VARCHAR(100),
    lastname VARCHAR(100),
    address  VARCHAR(150),
    phone    INTEGER
);

CREATE TABLE prestamos
(
    id_prestamo    INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_book        INTEGER,
    id_user        INTEGER,
    fec_prestamo   DATE,
    fec_devolucion DATE,
    FOREIGN KEY (id_book) REFERENCES book (id_book),
    FOREIGN KEY (id_user) REFERENCES users (id_user)
);
#mostrar el tirulo del libro, los nombres y apellidos y la categoria
#de los usuarios que se prestaron libros donde la categoria sea
#COMEDIA O MANGA

CREATE VIEW libro_prest as
SELECT CONCAT(us.fullname,us.lastname)as NOMBRE_COMPLETO,
b.title AS CI_USER,cat.type AS LIBRO_PRESTADO
    FROM book as b

INNER JOIN category as cat on cat.id_book = b.id_book
INNER JOIN prestamos as pre on b.id_book = pre.id_book
INNER JOIN users as us on pre.id_book = us.id_user

WHERE cat.type = 'COMEDIA' OR cat.type = 'MANGA';


SELECT COUNT(b.pages) as IBRANI_90
    FROM users as us
INNER JOIN prestamos as prest on prest.id_user = us.id_user
INNER JOIN book as b on b.id_book = prest.id_book
WHERE b.editorial = 'IBRANI' AND b.pages > 90;

CREATE OR REPLACE FUNCTION ret(editorial VARCHAR(30),cant_pag VARCHAR(40))
    RETURNS VARCHAR(200)
    BEGIN
        DECLARE a,b varchar(40);
    SET a = (SELECT CONCAT(b.pages) as IBRANI_90
    FROM users as us
    INNER JOIN prestamos as prest on prest.id_user = us.id_user
    INNER JOIN book as b on b.id_book = prest.id_book
    WHERE b.editorial = 'IBRANI' AND b.pages > 90);
        return a;
    end;

SELECT ret('IBRANI','90');

SELECT CONCAT('EDITORIAL: ',b.editorial, ' CATEGORIA: ',cat.type) as DESCRIPTION
    FROM book as b

INNER JOIN category as cat on cat.id_book = b.id_book
INNER JOIN prestamos as pre on b.id_book = pre.id_book
INNER JOIN users as us on pre.id_book = us.id_user

WHERE cat.type = 'MANGA' AND b.editorial = 'IBRANI';

CREATE OR REPLACE FUNCTION concatenador()
    RETURNS VARCHAR(200)
    BEGIN
        DECLARE resp VARCHAR(50);
        SET resp = (SELECT CONCAT('EDITORIAL: ',b.editorial, ' CATEGORIA: ',cat.type) as DESCRIPTION
    FROM book as b
INNER JOIN category as cat on cat.id_book = b.id_book
INNER JOIN prestamos as pre on b.id_book = pre.id_book
INNER JOIN users as us on pre.id_book = us.id_user
WHERE cat.type = 'MANGA' AND b.editorial = 'IBRANI');
        RETURN resp;
    end;

SELECT concatenador();

CREATE FUNCTION ParImparTexto (numero INTEGER)
RETURNS VARCHAR(200)
BEGIN
  DECLARE resultado VARCHAR(200);
  IF MOD(numero, 2) = 0 THEN
    SET resultado = CONCAT('Par (', numero, ' páginas)');
  ELSE
    SET resultado = CONCAT('Impar (', numero, ' páginas)');
  END IF;
  RETURN resultado;

END;

SELECT ParImparTexto(73);

SELECT CONCAT('EDITORIAL: ', b.editorial, ', LIBRO: ', b.title) AS DESCRIPTION,
       IF(MOD(b.pages, 2) = 0, CONCAT('PAR (', b.pages, ' páginas)'), CONCAT('IMPAR (', b.pages, ' páginas)')) AS PAGES
FROM book b;


#Modulo = CASE WHEN Count(*) % 2 = 0 THEN 'Par' ELSE 'Impar' END

CREATE OR REPLACE function concatenador_v2(editorial varchar(20),cat varchar(20))
returns varchar(40)
begin
declare respuesta varchar(40);
    select concat('EDITORIAL: ',editorial,', ',' ','CATEGORIA: ',cat) as DESCRIPTION into respuesta;
return respuesta;
end;


    SELECT concatenador_v2(b.editorial,c.type) AS DESCRIPTION,
           concat (b.pages,': ', ParImparTexto(b.pages)) AS PAGES
   FROM users as us
    INNER JOIN prestamos as pres on us.id_user = pres.id_user
    INNER JOIN book b on pres.id_book = b.id_book
    INNER JOIN category c on b.id_book = c.id_book
    WHERE b.editorial='IBRANI' and c.type='MANGA';

SELECT CONCAT('EDITORIAL: ', b.editorial, ', CATEGORIA: ', cat.type) as DESCRIPTION,
       CONCAT(IF(MOD(b.pages, 2) = 0, 'PAR', 'IMPAR'), ': ', b.pages) AS PAGES
FROM book as b
INNER JOIN category as cat on cat.id_book = b.id_book
INNER JOIN prestamos as pre on b.id_book = pre.id_book
INNER JOIN users as us on pre.id_user = us.id_user
WHERE cat.type = 'MANGA' AND b.editorial = 'IBRANI';

#CREAR UNA FUNCION
SELECT COUNT(prest.fec_prestamo)
    FROM book as b
INNER JOIN prestamos as prest on prest.id_book = b.id_book
WHERE prest.fec_prestamo = 2017-01-01 AND prest.fec_prestamo = 2018-12-30;

CREATE or replace FUNCTION UsuariosGEstion2017_2018()
RETURNS INTEGER
BEGIN
  DECLARE total_prestamos INTEGER;

  SELECT COUNT(*)
  INTO total_prestamos
  FROM prestamos AS pre
  INNER JOIN book AS b ON pre.id_book = b.id_book
  WHERE YEAR(pre.fec_prestamo) IN (2017, 2018);

  RETURN total_prestamos;
END;

SELECT UsuariosGEstion2017_2018() AS TotalLibrosPrestados;



SELECT * FROM autor;
SELECT * FROM book;
SELECT * FROM category;
SELECT *FROM users;
SELECT * FROM prestamos;


INSERT INTO autor (name, nacionality)
VALUES ('autor_name_1', 'Bolivia'),
       ('autor_name_2', 'Argentina'),
       ('autor_name_3', 'Mexico'),
       ('autor_name_4', 'Paraguay');

INSERT INTO book (codigo, isbn, title, editorial, pages, id_autor)
VALUES ('codigo_book_1', 'isbn_1', 'title_book_1', 'NOVA', 30, 1),
       ('codigo_book_2', 'isbn_2', 'title_book_2', 'NOVA II', 25, 1),
       ('codigo_book_3', 'isbn_3', 'title_book_3', 'NUEVA SENDA', 55, 2),
       ('codigo_book_4', 'isbn_4', 'title_book_4', 'IBRANI', 100, 3),
       ('codigo_book_5', 'isbn_5', 'title_book_5', 'IBRANI', 200, 4),
       ('codigo_book_6', 'isbn_6', 'title_book_6', 'IBRANI', 85, 4);

INSERT INTO category (type, id_book)
VALUES ('HISTORIA', 1),
       ('HISTORIA', 2),
       ('COMEDIA', 3),
       ('MANGA', 4),
       ('MANGA', 5),
       ('MANGA', 6);

INSERT INTO users (ci, fullname, lastname, address, phone)
VALUES ('111 cbba', 'user_1', 'lastanme_1', 'address_1', 111),
       ('222 cbba', 'user_2', 'lastanme_2', 'address_2', 222),
       ('333 cbba', 'user_3', 'lastanme_3', 'address_3', 333),
       ('444 lp', 'user_4', 'lastanme_4', 'address_4', 444),
       ('555 lp', 'user_5', 'lastanme_5', 'address_5', 555),
       ('666 sc', 'user_6', 'lastanme_6', 'address_6', 666),
       ('777 sc', 'user_7', 'lastanme_7', 'address_7', 777),
       ('888 or', 'user_8', 'lastanme_8', 'address_8', 888);


INSERT INTO prestamos (id_book, id_user, fec_prestamo, fec_devolucion)
VALUES (1, 1, '2017-10-20', '2017-10-25'),
       (2, 2, '2017-11-20', '2017-11-22'),
       (3, 3, '2018-10-22', '2018-10-27'),
       (4, 3, '2018-11-15', '2017-11-20'),
       (5, 4, '2018-12-20', '2018-12-25'),
       (6, 5, '2019-10-16', '2019-10-18');