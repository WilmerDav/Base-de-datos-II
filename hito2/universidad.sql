SHOW DATABASES;

CREATE DATABASE hito_2;
USE hito_2;
CREATE TABLE students(
    nombre VARCHAR(50) NOT NULL,
    codigo VARCHAR(50)NOT NULL,
    Titulo VARCHAR(20)NOT NULL
);

insert into students values('Wilmer Cori','SIS8434801','SISTEMAS');
SELECT * FROM students;

DROP DATABASE hito_2;


CREATE DATABASE universidad;
USE universidad;

CREATE TABLE estudiantes(
  id_est INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nombres VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  edad INT NOT NULL,
  phone INT NOT NULL,
  email VARCHAR(100) NOT NULL
);

DESCRIBE estudiantes;

INSERT INTO estudiantes(nombres,apellidos,edad,phone,email)
VALUES('Nombre1','Apellido1',10,111111,'usu1@gmail.com'),
      ('Nombre2','Apellido2',20,111111,'usu2@gmail.com'),
      ('Nombre3','Apellido3',10,111111,'usu3@gmail.com');

SELECT * FROM estudiantes;

ALTER TABLE estudiantes ADD COLUMN direccion VARCHAR(200)
    NOT NULL DEFAULT 'El Alto';

ALTER TABLE estudiantes DROP COLUMN direccion;

Describe estudiantes;

SELECT * FROM estudiantes;
#para modificar datos dentro de laa tabla podemos corer el select y cambiarlo desde la interfaz grafica y darle a la flecha submit y un click al vacio

Alter table estudiantes                #Alterar o modificar dicha tabla
    add column fax VARCHAR(10),     #anade columnas a la tabla
    ADD COLUMN genero VARCHAR(10);

ALTER TABLE estudiantes
    DROP COLUMN fax;                #elimina la columna agregada fax

DESCRIBE estudiantes;

SELECT *
FROM estudiantes AS est
WHERE est.nombres = 'Nombre1';

#mostrar los registros cuyo id sea par o impar
SELECT est.*
FROM estudiantes AS est
WHERE est.id_est mod 2=1;



DROP TABLE estudiantes;
DROP TABLE materias;

CREATE TABLE estudiantes2
    (
        id_est INTEGER AUTO_INCREMENT PRIMARY KEY  NOT NULL,
        nombres VARCHAR(100) NOT NULL,
        apellidos VARCHAR(100) NOT NULL,
        edad INTEGER NOT NULL,
        fono INTEGER NOT NULL,
        email VARCHAR(100)NOT NULL
    );
CREATE TABLE materias
    (
        id_materia INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
        nombre_materia VARCHAR(100) NOT NULL ,
        cod_materia VARCHAR (100) NOT NULL
);
CREATE TABLE inscripcion
    (
        in_ins INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
        id_est INTEGER NOT NULL,
        id_mat INTEGER NOT NULL,
        FOREIGN KEY (id_est) REFERENCES estudiantes2(id_est),
        FOREIGN KEY (id_mat) REFERENCES materias(id_materia)
        #tabla INTEGER NOT NULL FOREING KEY REFERENCE[lo que hace el enlace]students[es la tabla](id_est)[id_est es la llave primaria de la tabla ]
);
select*
from estudiantes2, materias, inscripcion;
