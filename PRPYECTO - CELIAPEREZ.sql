--BORRADO DE TABLAS
DROP TABLE INGRESO;
DROP TABLE ENFERMEDAD;
DROP TABLE CONSULTA;
DROP TABLE PACIENTE;
DROP TABLE CITA;
DROP TABLE MEDICO;
DROP TABLE AUDITORIA_PACIENTE;
DROP TABLE AUDITORIA_CITA;
DROP TABLE AUDITORIA_CONSULTA;
DROP TABLE AUDITORIA_ENFERMEDAD;
DROP TABLE AUDITORIA_INGRESO;
DROP TABLE AUDITORIA_MEDICO;

--CREACION DE TABLAS
CREATE TABLE MEDICO (
    cod_medico CHAR(2) CONSTRAINT COD_MED_PK PRIMARY KEY,
    nombre VARCHAR2(10) NOT NULL,
    apellido VARCHAR2(15) NOT NULL,
    especialidad VARCHAR2(15) NOT NULL
);

CREATE TABLE CITA (
    cod_cita CHAR(5) CONSTRAINT COD_CIT_PK PRIMARY KEY,
    fecha_hora TIMESTAMP
);

CREATE TABLE PACIENTE (
    Cod_paciente CHAR(5) CONSTRAINT COD_PAC_PK PRIMARY KEY,
    cod_cita CHAR(5) CONSTRAINT CIT_PAC_FK REFERENCES CITA,
    nombre VARCHAR2(10) NOT NULL,
    apellido VARCHAR2(15),
    direccion VARCHAR2(30),
    telefono NUMBER(9) NOT NULL
);

CREATE TABLE CONSULTA (
    cod_consulta CHAR(3) CONSTRAINT COD_CON_PK PRIMARY KEY,
    cod_cita CHAR(5) CONSTRAINT CIT_CON_FK REFERENCES CITA,
    cod_medico CHAR(2) CONSTRAINT MED_CON_FK REFERENCES MEDICO
);

CREATE TABLE ENFERMEDAD (
    cod_enfermedad CHAR(2) CONSTRAINT COD_ENF_PK PRIMARY KEY,
    nombre VARCHAR2(30),
    sintomas VARCHAR2(100)
);

CREATE TABLE INGRESO (
    cod_ingreso CHAR(2) CONSTRAINT COD_ING_PK PRIMARY KEY,
    cod_paciente CHAR(5) CONSTRAINT PAC_ING_FK REFERENCES PACIENTE,
    cod_enfermedad CHAR(2) CONSTRAINT ENF_ING_FK REFERENCES ENFERMEDAD,
    fecha_ingreso DATE,
    fecha_alta DATE,
    num_habitacion NUMBER(3) NOT NULL
);

--TABLAS DE AUDITORIA
CREATE TABLE auditoria_paciente (
    descripcion VARCHAR2(70)
);


CREATE TABLE auditoria_cita (
    descripcion VARCHAR2(70)
);

CREATE TABLE auditoria_consulta (
    descripcion VARCHAR2(70)
);

CREATE TABLE auditoria_enfermedad (
    descripcion VARCHAR2(70)
);

CREATE TABLE auditoria_medico (
    descripcion VARCHAR2(70)
);

CREATE TABLE auditoria_ingreso (
    descripcion VARCHAR2(70)
);

--INSERCCION DE DATOS
INSERT INTO MEDICO VALUES (1, 'Juan', 'Mendez', 'Cardiologia');
INSERT INTO MEDICO VALUES (2, 'Rosario', 'Barrera', 'Pediatria');
INSERT INTO MEDICO VALUES (3, 'Remedios', 'Santos', 'Oncología');
INSERT INTO MEDICO VALUES (4, 'Pablo', 'Perez', 'Cardiologia');
INSERT INTO MEDICO VALUES (5, 'Maria', 'Soto', 'Neumologia');
INSERT INTO MEDICO VALUES (6, 'Maria', 'Guerrero', 'Neurologia');
INSERT INTO MEDICO VALUES (7, 'Teresa', 'Correa', 'Oncología');
INSERT INTO MEDICO VALUES (8, 'Jorge', 'Vargas', 'Pediatria');
INSERT INTO MEDICO VALUES (9, 'Maite', 'Castillo', 'Neurologia');
INSERT INTO MEDICO VALUES (10, 'Pilar', 'Perez', 'Hematología');
--SELECT * FROM MEDICO;

INSERT INTO CITA VALUES ('CIT1', TO_TIMESTAMP('14/04/2021 14:00', 'DD/MM/YYYY HH24:MI'));
INSERT INTO CITA VALUES ('CIT2', TO_TIMESTAMP('12/04/2021 11:35', 'DD/MM/YYYY HH24:MI'));
INSERT INTO CITA VALUES ('CIT3', TO_TIMESTAMP('14/04/2021 14:00', 'DD/MM/YYYY HH24:MI'));
INSERT INTO CITA VALUES ('CIT4', TO_TIMESTAMP('13/04/2021 16:15', 'DD/MM/YYYY HH24:MI'));
INSERT INTO CITA VALUES ('CIT5', TO_TIMESTAMP('14/04/2021 14:55', 'DD/MM/YYYY HH24:MI'));
INSERT INTO CITA VALUES ('CIT6', TO_TIMESTAMP('17/04/2021 18:10', 'DD/MM/YYYY HH24:MI'));
INSERT INTO CITA VALUES ('CIT7', TO_TIMESTAMP('14/04/2021 12:00', 'DD/MM/YYYY HH24:MI'));
INSERT INTO CITA VALUES ('CIT8', TO_TIMESTAMP('19/04/2021 10:30', 'DD/MM/YYYY HH24:MI'));
INSERT INTO CITA VALUES ('CIT9', TO_TIMESTAMP('14/04/2021 08:45', 'DD/MM/YYYY HH24:MI'));
--SELECT * FROM CITA;

INSERT INTO PACIENTE VALUES ('MARGA', 'CIT1', 'Mario', 'Garcia', 'C/ Sol Nº45', 604985324);
INSERT INTO PACIENTE VALUES ('MANGO', 'CIT2', 'Manuel', 'González', 'C/San Patricio', 614856478);
INSERT INTO PACIENTE VALUES ('SARRO', 'CIT3', 'Sara', 'Rodriguez', 'C/Betania Nº45', 603564789);
INSERT INTO PACIENTE VALUES ('ROIES', 'CIT4', 'Roi', 'Espejo', 'C/Samaniego Nº2', 914052845);
INSERT INTO PACIENTE VALUES ('ANARO', 'CIT5', 'Ana', 'Ropero', 'C/Maria Laffitte', 678965132);
INSERT INTO PACIENTE VALUES ('JESMA', 'CIT6', 'Jesus', 'Martos', 'C/Los romeros Nº24', 645898521);
INSERT INTO PACIENTE VALUES ('PILCA', 'CIT7', 'Pilar', 'Candil', 'C/Anden Nº98', 965212456);
INSERT INTO PACIENTE VALUES ('VICLU', 'CIT8', 'Victoria', 'Lugo', 'C/San Jeronimo Nº102', 615487521);
INSERT INTO PACIENTE VALUES ('DIEMA', 'CIT9', 'Diego', 'Martinez', 'C/Congrio Nº34', 621545854);
--SELECT * FROM PACIENTE;

INSERT INTO CONSULTA VALUES (001, 'CIT1', 3);
INSERT INTO CONSULTA VALUES (002, 'CIT2', 3);
INSERT INTO CONSULTA VALUES (003, 'CIT3', 3);
INSERT INTO CONSULTA VALUES (004, 'CIT4', 2);
INSERT INTO CONSULTA VALUES (005, 'CIT5', 5);
INSERT INTO CONSULTA VALUES (006, 'CIT6', 8);
INSERT INTO CONSULTA VALUES (007, 'CIT7', 9);
INSERT INTO CONSULTA VALUES (008, 'CIT8', 7);
INSERT INTO CONSULTA VALUES (009, 'CIT9', 1);
--SELECT * FROM CONSULTA;

INSERT INTO ENFERMEDAD VALUES (1, 'Hipertension arterial','Dolor de cabeza, nauseas, confusion, sangrado nasal');
INSERT INTO ENFERMEDAD VALUES (2, 'Enfermedad cerebrovascular','Confusion, vomitos, dolor de cabeza, entumecimiento');
INSERT INTO ENFERMEDAD VALUES (3, 'Insuficiencia cardiaca','Falta de aire, fatiga, tos, debilidad, aumento de peso');
INSERT INTO ENFERMEDAD VALUES (4, 'Varicela','Bultos rojos, fiebre, perdida de apetito, cansancio');
INSERT INTO ENFERMEDAD VALUES (5, 'Sarampion','Fiebre alta, tos, mocos, ojos enrojecidos');
INSERT INTO ENFERMEDAD VALUES (6, 'Parotiditis','Dolor facial, fiebre, dolor de garganta, inflamacion glandulas parotidas');
INSERT INTO ENFERMEDAD VALUES (7, 'Amigdalitis','Amigdalas rojas, dolor de garganta, dificultad para tragar, fiebre');
INSERT INTO ENFERMEDAD VALUES (8, 'Cancer','Hemorragias, problemas al comer, cansancio grave, fiebre, piel roja');
INSERT INTO ENFERMEDAD VALUES (9, 'Amiloidosis','Hinchazon de piernas, fatiga, falta de aire, perdida de peso');
INSERT INTO ENFERMEDAD VALUES (10, 'Asma bronquial','Tos, dificultad para respirar, silbidos, dificultad para dormir');
INSERT INTO ENFERMEDAD VALUES (11, 'Neumonia','Dolor de pecho, desorientacion, tos, fatiga, fiebre, falta de aire');
INSERT INTO ENFERMEDAD VALUES (12, 'Hipertension pulmonar','Falta de aire, fatiga, mareos, dolor de pecho');
INSERT INTO ENFERMEDAD VALUES (13, 'Migraña','Dolor de cabeza, sensibilidad a la luz, vomitos');
INSERT INTO ENFERMEDAD VALUES (14, 'Epilepsia','Confusion temporal, movimientos espasmodicos, perdida del conocimiento, ansiedad');
INSERT INTO ENFERMEDAD VALUES (15, 'Mastocitosis','Enrojecimiento, dolor abdominal, anemia, dolor oseo');
--SELECT * FROM ENFERMEDAD;

INSERT INTO INGRESO VALUES (1, 'DIEMA',3, '15/04/2021', null, 1);
INSERT INTO INGRESO VALUES (2, 'JESMA',8, '15/04/2021', null, 2);
INSERT INTO INGRESO VALUES (3, 'PILCA',11, '15/04/2021', '17/04/2021', 3);
INSERT INTO INGRESO VALUES (4, 'MARGA',1, '14/04/2021', '21/07/2021', 4);
INSERT INTO INGRESO VALUES (5, 'ROIES',9, '15/04/2021', null, 5);
--SELECT * FROM INGRESO;


--BLOQUE ANONIMO CON EL QUE LLAMAR A LOS DISTINTOS ELEMENTOS
DECLARE
    elemento NUMBER;
    --Variables de la funcion habitacion_libre
    numero NUMBER;
    v_Return1 VARCHAR2(200);
    --Variables de la funcion citas_libres
    FECHA TIMESTAMP;
    MEDICO CHAR(200);
    v_Return2 VARCHAR2(200);
BEGIN
    elemento := 1;
    CASE elemento
        WHEN 1 THEN 
            enf_ingreso('Hipertension arterial');
        WHEN 2 THEN
            enfermedad_sintomas;
        WHEN 3 THEN
            listadoHospital;
        WHEN 4 THEN
            numero:=3;
            v_Return1 := HABITACION_LIBRE(
                NUMERO => NUMERO
            );
            dbms_output.put_line(v_return1);
        WHEN 5 THEN
            FECHA := TO_TIMESTAMP('14/04/2021 12:45', 'DD/MM/YYYY HH24:MI');
            MEDICO := 2;

            v_Return2 := CITAS_LIBRES(
                FECHA => FECHA,
                MEDICO => MEDICO
            );
            dbms_output.put_line(v_return2);
    END CASE;
END;
/


--PROCEDIMIENTOS
--1
--Dada una enfermedad, necesita el ingreso o no
CREATE OR REPLACE PROCEDURE enf_ingreso (nombre VARCHAR2) IS
BEGIN
    IF nombre IN ('Hipertension arterial', 'Enfermedad cerebrovascular', 'Cancer', 'Neumonia', 'Hipertension pulmonar') THEN
        DBMS_OUTPUT.PUT_LINE('Necesita ingreso');
    ELSIF nombre IN ('Insuficiencia cardiaca','Varicela','Sarampion','Parotiditis','Amigdalitis','Amiloidosis','Asma bronquial','Epilepsia','Mastocitosis') THEN
        DBMS_OUTPUT.PUT_LINE('No necesita ingreso');
    ELSE
        RAISE_APPLICATION_ERROR (-20002, 'Por favor, la enfermedad que se ha introducido no es valida');
    END IF;
--Hacemos control de excepciones
EXCEPTION 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Ocurrió el error ' || SQLCODE ||' Mensaje: ' || SQLERRM);
END enf_ingreso;
/



--2
--Procedimiento con el que dada una enfermedad muestra los sintomas que tiene
CREATE OR REPLACE PROCEDURE enfermedad_sintomas IS
--Cursor con el que obtendremos los nombres de las enfermedades
    CURSOR c_enfermedad IS
        SELECT nombre, sintomas FROM enfermedad;
        v_enfermedad c_enfermedad%ROWTYPE;
BEGIN
    --Abrimos el cursor con el que obtendremos sintomas y enfermedades
    OPEN c_enfermedad;
    LOOP
        FETCH c_enfermedad INTO v_enfermedad;
        EXIT WHEN c_enfermedad%NOTFOUND;
    --Mostramos por pantalla los resultados
            DBMS_OUTPUT.PUT_LINE('Enfermedad: ' ||' '||  v_enfermedad.nombre);
            DBMS_OUTPUT.PUT_LINE(CHR(9) || 'Sintomas: ' ||' '||  v_enfermedad.sintomas);
    END LOOP;
    CLOSE c_enfermedad;
--Hacemos control de excepciones
EXCEPTION 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Ocurrió el error ' || SQLCODE ||'mensaje: ' || SQLERRM);
END;
/


--3    
CREATE OR REPLACE PROCEDURE listadoHospital IS
--Cursor para obtener los medicos que tenemos en el hospital
	CURSOR c_medico IS
		SELECT m.cod_medico, m.nombre || ' ' || m.apellido as nombre_medico
            FROM medico m;	
	v_medico c_medico%ROWTYPE;

--Cursor para obtener los pacientes que trata cada medico
    CURSOR c_paciente (codigo_medico CHAR) IS
        SELECT p.cod_paciente, p.nombre || ' ' || p.apellido as nombre_paciente, p.cod_cita, to_char(ci.fecha_hora, 'HH24:MI') AS HORA
            FROM paciente p, medico m, consulta c, cita ci
            WHERE c.cod_medico=m.cod_medico
                AND c.cod_cita=p.cod_cita AND ci.cod_cita=p.cod_cita
                AND c.cod_medico=codigo_medico;
    v_paciente c_paciente%ROWTYPE;
    s_paciente BOOLEAN := FALSE;
  
BEGIN
--Abrimos el primer cursor donde mostraremos los hospitales que tenemos
	OPEN c_medico;
	LOOP
		FETCH c_medico INTO v_medico;
		EXIT WHEN c_medico%NOTFOUND;
--Trabajamos con el segundo cursor donde veremos los medicos de cada hospital	
			DBMS_OUTPUT.PUT_LINE( CHR(9) || 'MEDICO: ' || v_medico.cod_medico || ' ' || v_medico.nombre_medico);
-- Con el tercer cursor veremos los pacientes que tiene cada medico y el horario de sus citas        
            FOR v_paciente IN c_paciente (v_medico.cod_medico) LOOP
                DBMS_OUTPUT.PUT_LINE(CHR(9) || CHR(9) || 'PACIENTE: ' || v_paciente.cod_paciente || ' ' || v_paciente.nombre_paciente || ' --- ' || v_paciente.cod_cita || ' --> ' || v_paciente.hora);
                s_paciente := TRUE;
            END LOOP;
-- En caso de no tener ningun paciente se indicara
            IF s_paciente = FALSE THEN
                DBMS_OUTPUT.PUT_LINE(CHR(9) || CHR(9) || 'PACIENTE: No tiene pacientes');
            END IF;
            s_paciente := FALSE;
  
	END LOOP;
	CLOSE c_medico;
--Hacemos control de excepciones
EXCEPTION 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Ocurrió el error ' || SQLCODE ||'mensaje: ' || SQLERRM);
END;
/


--FUNCIONES
--4
--Funcion que indica sin una habitacion esta libre u ocupada e indique el nombre del ocupante
--NOTA: En el hospital hay 25 habitaciones en total
CREATE OR REPLACE FUNCTION habitacion_libre (numero NUMBER)
    RETURN VARCHAR2 IS
    v_fecha_alta ingreso.fecha_alta%TYPE;
--Cursor para obtener numero de habitacion y datos del paciente que la ocupa
    CURSOR c_ingreso IS
        SELECT i.num_habitacion, i.cod_paciente, p.nombre ||' '|| p.apellido as nombre_paciente 
            FROM ingreso i, paciente p
            WHERE i.cod_paciente=p.cod_paciente AND numero=i.num_habitacion;
    v_ingreso c_ingreso%ROWTYPE;
BEGIN
    --Con este cursor introducimos la fecha de alta cuando el numero que indicamos coincide con el num_habitacion
    SELECT fecha_alta INTO v_fecha_alta FROM ingreso WHERE numero=num_habitacion;
    --Abrimos el cursor que hemos creado donde introducimos el numero de habitaciones y datos el paciente
    OPEN c_ingreso;
    LOOP    
        FETCH c_ingreso INTO v_ingreso;
            IF v_ingreso.num_habitacion=numero AND v_fecha_alta < SYSDATE THEN
                RETURN ('Habitacion libre');
            ELSE
                RETURN ('Habitacion ocupada por: ' || v_ingreso.cod_paciente ||' -- '|| v_ingreso.nombre_paciente);
            END IF;
    END LOOP;
    CLOSE c_ingreso;
--Hacemos control de excepciones
EXCEPTION 
    WHEN OTHERS THEN  
        RAISE_APPLICATION_ERROR (-20003, 'Por favor, la habitacion que ha introducido no existe');
END;
/


--5
--Funcion por la cual dada una fecha y un codigo del medico indicara si la cita esta libre o no.
CREATE OR REPLACE FUNCTION citas_libres (fecha TIMESTAMP, medico CHAR)
    RETURN VARCHAR2 IS
        --Con este cursor recogeremos fecha, codigo de cita, medico y consulta que hay registrada en la base de datos.
        CURSOR c_citas IS
            SELECT c.cod_cita, co.cod_consulta, m.cod_medico as medico, c.fecha_hora as fechahora
                FROM cita c, consulta co, medico m 
                WHERE m.cod_medico=co.cod_medico AND c.cod_cita=co.cod_cita AND fecha=c.fecha_hora;
        v_citas c_citas%ROWTYPE;
BEGIN
    OPEN c_citas;
    LOOP
        FETCH c_citas INTO v_citas;
        --Si la fecha que introducimos se encuentra registrada y coincide con el medico, la cita no estara disponible.
            IF v_citas.fechahora=fecha AND v_citas.medico=medico  THEN
                RETURN ('Cita no disponible');
            ELSIF fecha=null AND medico=null THEN
                RAISE_APPLICATION_ERROR (-20003, 'Por favor, introduzca datos validos');
            ELSE
                RETURN ('Cita disponible');
            END IF;
    END LOOP;
    CLOSE c_citas;
--Hacemos control de excepciones
EXCEPTION 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Ocurrió el error ' || SQLCODE ||' mensaje: ' || SQLERRM);
END;
/


--TRIGGERS (DISPARADORES)
--6
--En primer lugar he creado un disparador a nivel de instruccion, en el caso de que intentemos insertar mas de 10 medicos
--No nos dejara porque solo hay 10 plazas.
CREATE OR REPLACE TRIGGER control_insert 
    BEFORE INSERT ON MEDICO
DECLARE
    v_medicos NUMBER(2);
BEGIN
    SELECT COUNT(cod_medico) INTO v_medicos FROM medico;
    IF v_medicos > 10 THEN
        RAISE_APPLICATION_ERROR (-20004, 'Lo siento, no hay mas plazas disponibles');
    END IF;
END;
/

--7
--En caso de que se inserte, borre o actualize alguna cita, se verá reflejado en nuestra tabla auditoria_cita.
--Controla que no se pueda insertar ningun horario que no este entre las 8:00 y las 21:00
CREATE OR REPLACE TRIGGER control_citas
    BEFORE INSERT OR DELETE OR UPDATE ON CITA
    FOR EACH ROW 
BEGIN
    IF DELETING THEN
        INSERT INTO auditoria_cita (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 3 ||' '|| :new.cod_cita ||' '|| :old.cod_cita);
    END IF;
    IF UPDATING THEN
        INSERT INTO auditoria_cita (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 2 ||' '|| :new.cod_cita ||' '|| :old.cod_cita);
    END IF;
    IF INSERTING THEN
        IF TO_CHAR(:new.fecha_hora, 'HH24:MI') NOT BETWEEN '08:00' AND '21:00' THEN
            RAISE_APPLICATION_ERROR (-20001, 'Lo siento, a esta hora no se pueden insertar citas, solo podrá ir por urgencias');
        END IF;
    INSERT INTO auditoria_cita (descripcion)
        VALUES (USER || ' ' || SYSDATE ||' '|| 1 ||' '|| :new.cod_cita ||' '|| :old.cod_cita);
    END IF;
END;
/

--He creado una serie de disparadores para que podamos eliminar una cita sin ningun problema.
--En este primer disparador eliminaremos el ingreso del paciente.
CREATE OR REPLACE TRIGGER eliminar_ingreso
    BEFORE DELETE ON PACIENTE
    FOR EACH ROW
BEGIN
    DELETE FROM INGRESO WHERE cod_paciente = :old.cod_paciente;
END;
/

--Con este disparador podemos eliminar la consulta relacionada con una cita y el paciente.
CREATE OR REPLACE TRIGGER eliminar_consulta
    BEFORE DELETE ON CITA
    FOR EACH ROW
BEGIN
    DELETE FROM CONSULTA WHERE cod_cita = :old.cod_cita;
    DELETE FROM PACIENTE WHERE cod_cita = :old.cod_cita;
END;
/

--8
--En caso de que se inserte, borre o actualize algun paciente, se verá reflejado en nuestra tabla auditoria_paciente
CREATE OR REPLACE TRIGGER control_pacientes
    AFTER INSERT OR UPDATE OR DELETE ON PACIENTE
    FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO auditoria_paciente (descripcion)
            VALUES ('Paciente' || USER || ' ' || SYSDATE ||' '|| 1 ||' '|| :old.cod_paciente ||' '|| :new.cod_paciente);
    END IF;
    IF UPDATING THEN
        INSERT INTO auditoria_paciente (descripcion)
            VALUES ('Paciente' || USER || ' ' || SYSDATE ||' '|| 2 ||' '|| :old.cod_paciente ||' '|| :new.cod_paciente);
    END IF;
    IF DELETING THEN
        INSERT INTO auditoria_paciente (descripcion)
            VALUES ('Paciente' || USER || ' ' || SYSDATE ||' '|| 3 ||' '|| :old.cod_paciente ||' '|| :new.cod_paciente);
    END IF;
END auditoria_paciente;
/


--9
--En caso de que se inserte, borre o actualize alguna consulta, se verá reflejado en nuestra tabla auditoria_consulta.
CREATE OR REPLACE TRIGGER control_consultas
    BEFORE INSERT OR DELETE OR UPDATE ON CONSULTA
    FOR EACH ROW 
BEGIN
    IF DELETING THEN
        INSERT INTO auditoria_consulta (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 3 ||' '|| :new.cod_consulta ||' '|| :old.cod_consulta);
    END IF;
    IF UPDATING THEN
        INSERT INTO auditoria_consulta (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 2 ||' '|| :new.cod_consulta ||' '|| :old.cod_consulta);
    END IF;
    IF INSERTING THEN
        INSERT INTO auditoria_consulta (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 1 ||' '|| :new.cod_consulta ||' '|| :old.cod_consulta);
    END IF;
END;
/


--11
--En caso de que se inserte, borre o actualize alguna enfermedad, se verá reflejado en nuestra tabla auditoria_enfermedad.
CREATE OR REPLACE TRIGGER control_enfermedad
    BEFORE INSERT OR DELETE OR UPDATE ON ENFERMEDAD
    FOR EACH ROW 
BEGIN
    IF DELETING THEN
        INSERT INTO auditoria_enfermedad (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 3 ||' '|| :new.cod_enfermedad ||' '|| :old.cod_enfermedad);
    END IF;
    IF UPDATING THEN
        INSERT INTO auditoria_enfermedad (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 2 ||' '|| :new.cod_enfermedad ||' '|| :old.cod_enfermedad);
    END IF;
    IF INSERTING THEN
        INSERT INTO auditoria_enfermedad (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 1 ||' '|| :new.cod_enfermedad ||' '|| :old.cod_enfermedad);
    END IF;
END;
/

--12
--En caso de que se inserte, borre o actualize algun medico, se verá reflejado en nuestra tabla auditoria_medico.
CREATE OR REPLACE TRIGGER control_medico
    BEFORE INSERT OR DELETE OR UPDATE ON MEDICO
    FOR EACH ROW 
BEGIN
    IF DELETING THEN
        INSERT INTO auditoria_medico (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 3 ||' '|| :new.cod_medico ||' '|| :old.cod_medico);
    END IF;
    IF UPDATING THEN
        INSERT INTO auditoria_medico (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 2 ||' '|| :new.cod_medico ||' '|| :old.cod_medico);
    END IF;
    IF INSERTING THEN
        INSERT INTO auditoria_medico (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 1 ||' '|| :new.cod_medico ||' '|| :old.cod_medico);
    END IF;
END;
/

--13
--En caso de que se inserte, borre o actualize algun ingreso, se verá reflejado en nuestra tabla auditoria_ingreso.
CREATE OR REPLACE TRIGGER control_ingreso
    BEFORE INSERT OR DELETE OR UPDATE ON INGRESO
    FOR EACH ROW 
BEGIN
    IF DELETING THEN
        INSERT INTO auditoria_ingreso (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 3 ||' '|| :new.cod_ingreso ||' '|| :old.cod_ingreso);
    END IF;
    IF UPDATING THEN
        INSERT INTO auditoria_ingreso (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 2 ||' '|| :new.cod_ingreso ||' '|| :old.cod_ingreso);
    END IF;
    IF INSERTING THEN
        INSERT INTO auditoria_ingreso (descripcion)
            VALUES (USER || ' ' || SYSDATE ||' '|| 1 ||' '|| :new.cod_ingreso ||' '|| :old.cod_ingreso);
    END IF;
END;
/
