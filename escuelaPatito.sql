/*Se requiere una base de datos de una escuela, donde no se realicen transacciones pero si se guarden los datos de todos los estudiantes , los cuáles tendrán curso (1 a 6to), jornada (Vespertina o matutina), materias (matemáticas, física, química, sociales y lengua), pensión por año , periodo lectivo, deporte(atletismo, natación, futbol, ajedrez o lucha) , tipo de estudiante (Normal, becado por deporte, becado por condición social).  Del estudiante también se debe saber nombre, apellido, dirección, representante, peso, talla. */

/* Crear tablas*/
CREATE TABLE deporte (
	deporteID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(60) NOT NULL
);
CREATE TABLE tipo_estudiante (
	tipoEstudianteID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(60) NOT NULL
);
CREATE TABLE materia (
	materiaID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(60) NOT NULL
);
CREATE TABLE jornada (
	jornadaID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(60) NOT NULL
);

CREATE TABLE curso (
	cursoID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(60) NOT NULL,
	jornadaID INT NOT NULL,
    FOREIGN KEY (jornadaID) REFERENCES jornada(jornadaID)
);

CREATE TABLE curso_materia (
	curso_materiaID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	materiaID INT NOT NULL,
	cursoID INT NOT NULL,
    FOREIGN KEY (materiaID) REFERENCES materia(materiaID),
    FOREIGN KEY (cursoID) REFERENCES curso(cursoID)
);

CREATE TABLE estudiante (
	estudianteID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(60) NOT NULL,
	apellido VARCHAR(60) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
	pensionBasica DECIMAL(5) NOT NULL,
    representante VARCHAR(60) NOT NULL,
    peso DECIMAL(5, 2) NOT NULL,
    talla DECIMAL(5, 2) NOT NULL,
	tipoEstudianteID INT NOT NULL,
    deporteID INT NOT NULL,
	cursoID INT NOT NULL,
    FOREIGN KEY (tipoEstudianteID) REFERENCES tipo_estudiante(tipoEstudianteID),
    FOREIGN KEY (deporteID) REFERENCES deporte(deporteID),
    FOREIGN KEY (cursoID) REFERENCES curso(cursoID)
);

/*Insertar datos*/

INSERT INTO `deporte` VALUES (1, 'Atletismo');
INSERT INTO `deporte` VALUES (2, 'Natación');
INSERT INTO `deporte` VALUES (3, 'Futbol');
INSERT INTO `deporte` VALUES (4, 'Ajedrez');
INSERT INTO `deporte` VALUES (5, 'Lucha');

INSERT INTO `tipo_estudiante` VALUES (1, 'Normal');
INSERT INTO `tipo_estudiante` VALUES (2, 'Becado por deporte');
INSERT INTO `tipo_estudiante` VALUES (3, 'Becado por condición social');

INSERT INTO `materia` VALUES (1, 'Matematicas');
INSERT INTO `materia` VALUES (2, 'Fisica');
INSERT INTO `materia` VALUES (3, 'Química');
INSERT INTO `materia` VALUES (4, 'Sociales');
INSERT INTO `materia` VALUES (5, 'Lengua');

INSERT INTO `jornada` VALUES (1, 'Vespertina');
INSERT INTO `jornada` VALUES (2, 'Matutina');

INSERT INTO `curso` VALUES (1, '1ro', 1);
INSERT INTO `curso` VALUES (2, '2ro', 2);
INSERT INTO `curso` VALUES (3, '3ro', 1);
INSERT INTO `curso` VALUES (4, '4ro', 2);
INSERT INTO `curso` VALUES (5, '5ro', 1);
INSERT INTO `curso` VALUES (6, '6ro', 2);

INSERT INTO `curso_materia` VALUES (1, 1, 1);
INSERT INTO `curso_materia` VALUES (2, 2, 1);
INSERT INTO `curso_materia` VALUES (3, 3, 1);
INSERT INTO `curso_materia` VALUES (4, 4, 1);
INSERT INTO `curso_materia` VALUES (5, 5, 1);
INSERT INTO `curso_materia` VALUES (6, 5, 1);

INSERT INTO `estudiante` VALUES (1, 'Juan', 'Perez', 'Guayaquil', 200, 'Maria Lola', 85.00, 140.00, 1, 1, 1);
INSERT INTO `estudiante` VALUES (2, 'Alberto', 'Rodriguez', 'Loja', 300, 'Maggie Simson', 60.00, 160.00, 2, 2, 1);
INSERT INTO `estudiante` VALUES (3, 'Lisa', 'Simspson', 'Ibarra', 800, 'Homero Simson', 75.00, 180.00, 2, 4, 1);
INSERT INTO `estudiante` VALUES (4, 'Natalia', 'Romero', 'Ibarra', 800, 'Homero Simson', 75.00, 180.00, 2, 5, 1);
INSERT INTO `estudiante` VALUES (5, 'Byron', 'Caicedo', 'Napo', 1000, 'Homero Simson', 75.00, 150.00, 3, 5, 1);
INSERT INTO `estudiante` VALUES (6, 'Alexa', 'Guaman', 'Napo', 1400, 'Homero Simson', 78.00, 155.00, 3, 5, 1);
INSERT INTO `estudiante` VALUES (7, 'Bolivar', 'Andrango', 'Cuenca', 1400, 'Homero Simson', 78.00, 155.00, 3, 5, 1);
INSERT INTO `estudiante` VALUES (8, 'Mauricio', 'Benitez', 'Tulcan', 850, 'Homero Simson', 75.00, 180.00, 2, 5, 1);

/*CONSULTAS: Se requieren las siguientes consultas */

/*Cuántos estudiantes practican ajedrez y son becados por deporte*/

select count(*) as TotalEstudiantes from estudiante where deporteID = 4 and tipoEstudianteID = 2;

/*La suma total de las pensiones de todos los estudiantes que son becados por condición social, que sean de la jornada vespertina y cuyo apellido comience con A*/
select SUM(pensionBasica) AS SumaPensiones from estudiante as e join curso as c on e.cursoID = c.cursoID where e.tipoEstudianteID = 3 and c.jornadaID = 1 and e.apellido like "a%";

/*El promedio del peso de los estudiantes que practican lucha*/
select AVG(peso) AS PromedioPeso from estudiante where deporteID = 5; 

/*El nombre, apellido, nombre del deporte, curso y jornada de todos los estudiantes que no tienen beca y cuyo peso esta entre 50 y 100 kilos. */
select nombre, apellido, deporteID, cursoID from estudiante where tipoEstudianteID = 1 and peso >= 50 and peso <= 100; 

/*Mostrar los nombres apellido y dirección de los tres estudiantes con mayor talla que no pertenezcan a 5to curso*/
select nombre, apellido, direccion, talla from estudiante where cursoID != 5 order by talla DESC LIMIT 3;


