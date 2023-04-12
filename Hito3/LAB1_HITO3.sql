CREATE DATABASE hito3_2023;
USE hito3_2023;

#cada usuario puede crear sus propias variables
SET @usuario = 'ADMIN'
SET @locacioin='EL ALTO'
#para ver la variable
SELECT @usuario;
SELECT @locacioin;

CREATE OR REPLACE FUNCTION variable()
    RETURNS TEXT
    BEGIN
        RETURN @usuario;
    end;
SELECT variable();

#si necesito cambiar el dato que guarda la variable solo cambio loq ue la variable guarda sin create or replace. solo cambiamos el set y lo corremos

SET @HITO_3 = 'ADMIN';

CREATE FUNCTION verificar_usuario()
RETURNS TEXT
BEGIN
    IF @HITO_3 = 'ADMIN' THEN
        RETURN 'Usuario ADMIN';
    ELSE
        RETURN 'Usuario Invitado';
    END IF;
END;

SELECT verificar_usuario();

#con case
#cuando usamos text o var char(), cuando usamos varchar sabemos cantidad de caracteres
CREATE or replace FUNCTION verificar_usuario2()
    RETURNS VARCHAR(100)
    BEGIN
        DECLARE mensaje VARCHAR(100);

        CASE @HITO_3
            WHEN 'ADMIN' THEN SET mensaje = 'Usuario ADMIN';
            ELSE SET mensaje = 'Usuario Invitado';
        END case;
        RETURN mensaje;
    END;
SELECT verificar_usuario2();

#EMPEZAMOS CON BUCLES
#GENERAR LOS PRIMEOS 10 numeros enteros

CREATE FUNCTION numeros_naturales(limite int)
    RETURNS TEXT
    BEGIN
        DECLARE cont int default 1;       #el valor es 1 de inicio
        DECLARE respuesta TEXT DEFAULT''; #declara carateres a llenar
        WHILE cont <= limite do
            SET respuesta = CONCAT(respuesta, cont, ', ');#si no pungo respuesta dentro del contact solo imprime el numeor final, y no deja uno por uno
            SET cont= cont + 1;
        END WHILE;

        RETURN respuesta;
    end;
SELECT numeros_naturales(10);


# 2, 1, 4, 3, 6, 5, 8, 7

CREATE OR REPLACE FUNCTION serie()
    RETURNS TEXT
    BEGIN
        DECLARE cont int default 1;
        DECLARE respuesta TEXT DEFAULT'';
        WHILE cont <= 8 do
            IF cont % 2 = 1 THEN
                SET respuesta = CONCAT(respuesta, cont + 1, ', ', cont, ', ');
            ELSE
                SET respuesta = CONCAT(respuesta, cont, ', ', cont - 1, ', ');
            END IF;
            SET cont= cont + 2;
        END WHILE;
        SET respuesta = CONCAT(respuesta, ' ');

        RETURN respuesta;
    end;

SELECT serie();

