CREATE DATABASE hito2_v2;
Use hito2_v2;
CREATE TABLE USUARIOS
(
    id_usuario INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    edad INTEGER NOT NULL,
    email VARCHAR(100) NOT NULL
);
INSERT INTO USUARIOS(nombres, apellidos, edad, email)
VALUES ('wilmer','cori',20,'wilmercori@gmail.com'),
       ('Marcos','limachi',31,'fshkdsjgh@gmail.com'),
       ('Luis','cordova',40,'klafjdjosgi@gmail.com'),
       ('Paco','lopez',23,'dahdfgiuosdh@gmail.com');
select *
from usuarios WHERE edad > 30;
#mostrar usuarios mayores a 30


CREATE VIEW mayores_a_30 AS  #CREAR UNA VISTA (Tabla de view)

SELECT us.*
FROM usuarios AS us
WHERE us.edad >30;



SELECT *
FROM mayores_a_30;

ALTER VIEW mayores_a_30 AS
    SELECT us.nombres,
           us.apellidos,
           us.edad,
           us.email
FROM usuarios AS us
WHERE us.edad>30;

SELECT m30.*
FROM mayores_a_30 AS m30;

ALTER VIEW mayores_a_30 AS
SELECT CONCAT(us.nombres,'',us.apellidos) AS FULLNAME,
    us.edad AS EDAD_USUARIO,
    us.email AS EMAIL_USUARIO
FROM usuarios AS us
WHERE us.edad>30;

#a la vista mostrada anteriormente mostrar usuarios cuyo apellido tenga el 3
SELECT ma.FULLNAME,
       ma.EDAD_USUARIO,
       ma.EMAIL_USUARIO
FROM mayores_a_30 AS ma         #tener en cuenta que en from ya renombreamos como ma, no podemos cambiarlo la inicio por sintaxys
WHERE ma.FULLNAME LIKE '%3%';