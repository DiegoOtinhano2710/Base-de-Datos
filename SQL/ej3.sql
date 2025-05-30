CREATE TABLE ej3.pers (
    correo VARCHAR(50) PRIMARY KEY,
    nomU VARCHAR(30) NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE ej3.curso (
    nom VARCHAR(30) PRIMARY KEY,
    cH INTEGER NOT NULL CHECK (cH > 0)
);

CREATE TABLE ej3.dicta (
    correo VARCHAR(50) REFERENCES pers(correo),
    nom VARCHAR(30) REFERENCES curso(nom),
    PRIMARY KEY (correo, nom)
);

CREATE TABLE ej3.insc (
    correo VARCHAR(50) REFERENCES pers(correo),
    nom VARCHAR(30) REFERENCES curso(nom),
    correoD VARCHAR(50) REFERENCES pers(correo),
    nota NUMERIC(4,2) CHECK (nota >= 0 AND nota <= 10),
    PRIMARY KEY (correo, nom),
    FOREIGN KEY (correoD, nom) REFERENCES dicta(correo, nom)
);

CREATE TABLE ej3.temas (
    nom VARCHAR(30) REFERENCES curso(nom),
    tema VARCHAR(100) NOT NULL,
    PRIMARY KEY (nom, tema)
);

-- Inserción de personas (docentes y alumnos)
INSERT INTO ej3.pers VALUES ('pedroibañez@yahoo.com.ar', 'pedro_i', 'Pedro Ibañez');
INSERT INTO ej3.pers VALUES ('mlopez@gmail.com', 'mlopez', 'María López');
INSERT INTO ej3.pers VALUES ('rperez@hotmail.com', 'rperez', 'Roberto Pérez');
INSERT INTO ej3.pers VALUES ('anagarcia@gmail.com', 'anagarcia', 'Ana García');
INSERT INTO ej3.pers VALUES ('jgomez@outlook.com', 'jgomez', 'Juan Gómez');
INSERT INTO ej3.pers VALUES ('carmenv@gmail.com', 'carmenv', 'Carmen Vázquez');
INSERT INTO ej3.pers VALUES ('luisf@yahoo.com', 'luisf', 'Luis Fernández');
INSERT INTO ej3.pers VALUES ('rosam@gmail.com', 'rosam', 'Rosa Martínez');
INSERT INTO ej3.pers VALUES ('rosap@yahoo.com.ar', 'rosap', 'Rosa Paredes');
INSERT INTO ej3.pers VALUES ('carlosr@gmail.com', 'carlosr', 'Carlos Rodríguez');
INSERT INTO ej3.pers VALUES ('mariaf@hotmail.com', 'mariaf', 'María Fernández');
INSERT INTO ej3.pers VALUES ('davidm@yahoo.com', 'davidm', 'David Martínez');

-- Inserción de cursos
INSERT INTO ej3.curso VALUES ('Python I', 30);
INSERT INTO ej3.curso VALUES ('Python II', 45);
INSERT INTO ej3.curso VALUES ('Java I', 40);
INSERT INTO ej3.curso VALUES ('Java II', 50);
INSERT INTO ej3.curso VALUES ('Ruby', 40);
INSERT INTO ej3.curso VALUES ('Ruby I', 25);
INSERT INTO ej3.curso VALUES ('Kotlin I', 35);
INSERT INTO ej3.curso VALUES ('JavaScript', 30);
INSERT INTO ej3.curso VALUES ('PHP', 25);
INSERT INTO ej3.curso VALUES ('C++', 55);

-- Inserción de relaciones dicta (profesor-curso)
INSERT INTO ej3.dicta VALUES ('pedroibañez@yahoo.com.ar', 'Python I');
INSERT INTO ej3.dicta VALUES ('pedroibañez@yahoo.com.ar', 'Python II');
INSERT INTO ej3.dicta VALUES ('mlopez@gmail.com', 'Java I');
INSERT INTO ej3.dicta VALUES ('mlopez@gmail.com', 'Java II');
INSERT INTO ej3.dicta VALUES ('rperez@hotmail.com', 'Ruby');
INSERT INTO ej3.dicta VALUES ('rperez@hotmail.com', 'Ruby I');
INSERT INTO ej3.dicta VALUES ('anagarcia@gmail.com', 'Kotlin I');
INSERT INTO ej3.dicta VALUES ('jgomez@outlook.com', 'JavaScript');
INSERT INTO ej3.dicta VALUES ('carmenv@gmail.com', 'PHP');
INSERT INTO ej3.dicta VALUES ('luisf@yahoo.com', 'C++');

-- Inserción de inscripciones (alumno-curso-profesor-nota)
INSERT INTO ej3.insc VALUES ('rosam@gmail.com', 'Python I', 'pedroibañez@yahoo.com.ar', 8.5);
INSERT INTO ej3.insc VALUES ('rosam@gmail.com', 'Python II', 'pedroibañez@yahoo.com.ar', 7.8);
INSERT INTO ej3.insc VALUES ('rosap@yahoo.com.ar', 'Python I', 'pedroibañez@yahoo.com.ar', 9.0);
INSERT INTO ej3.insc VALUES ('carlosr@gmail.com', 'Python I', 'pedroibañez@yahoo.com.ar', 7.0);
INSERT INTO ej3.insc VALUES ('carlosr@gmail.com', 'Java I', 'mlopez@gmail.com', 8.2);
INSERT INTO ej3.insc VALUES ('mariaf@hotmail.com', 'Java I', 'mlopez@gmail.com', 9.5);
INSERT INTO ej3.insc VALUES ('mariaf@hotmail.com', 'Java II', 'mlopez@gmail.com', 8.7);
INSERT INTO ej3.insc VALUES ('davidm@yahoo.com', 'Ruby', 'rperez@hotmail.com', 7.5);
INSERT INTO ej3.insc VALUES ('pedroibañez@yahoo.com.ar', 'Java I', 'mlopez@gmail.com', 9.2);
INSERT INTO ej3.insc VALUES ('mlopez@gmail.com', 'Python I', 'pedroibañez@yahoo.com.ar', 8.9);

-- Inserción de temas por curso
INSERT INTO ej3.temas VALUES ('Python I', 'Introducción a Python');
INSERT INTO ej3.temas VALUES ('Python I', 'Estructuras de datos básicas');
INSERT INTO ej3.temas VALUES ('Python II', 'Programación orientada a objetos');
INSERT INTO ej3.temas VALUES ('Python II', 'Módulos y paquetes');
INSERT INTO ej3.temas VALUES ('Java I', 'Fundamentos de Java');
INSERT INTO ej3.temas VALUES ('Java II', 'Interfaces gráficas con Swing');
INSERT INTO ej3.temas VALUES ('Ruby', 'Sintaxis básica');
INSERT INTO ej3.temas VALUES ('Ruby I', 'Introducción a Ruby');
INSERT INTO ej3.temas VALUES ('Kotlin I', 'Fundamentos de Kotlin');
INSERT INTO ej3.temas VALUES ('JavaScript', 'DOM y eventos');
INSERT INTO ej3.temas VALUES ('PHP', 'Conexión a bases de datos');
INSERT INTO ej3.temas VALUES ('C++', 'Punteros y memoria dinámica');


SELECT correo, nombre FROM ej3.pers; /*3*/

SELECT count(*)  AS cantidad FROM ej3.curso; /*4*/

SELECT count(distinct nom) FROM ej3.insc; /*5*/

SELECT  max(nota) FROM ej3.insc WHERE nom='Python I'; /*6*/

SELECT nom 
FROM ej3.curso 
ORDER BY nom ASC; /*7*/

SELECT nombre 
FROM pers NATURAL JOIN insc 
ORDER BY nombre DESC; /*8*/

SELECT * FROM curso WHERE cH > 40; /*9*/

SELECT * FROM curso WHERE cH BETWEEN 40 AND 45; /*10*/

SELECT * 
FROM curso 
WHERE cH > 
	(SELECT cH 
	 FROM ej3.curso 
	 WHERE nom='Kotlin I') 
ORDER BY cH DESC; /*11*/

SELECT nom 
from curso 
WHERE cH > 
	(SELECT max(cH) 
	 FROM curso NATURAL JOIN 
		(SELECT nom 
		 FROM dicta 
		 WHERE correo='pedroibañez@yahoo.com.ar')); /*12*/

select * from pers where nombre like 'Rosa%';  /*13*/

select nom, correo, nomU, nombre from dicta natural join pers; /*14*/
 
select * from curso 
left join insc on curso.nom=insc.nom
left join pers on insc.correo = pers.correo; /*15*/

select distinct correo 
from dicta 
where nom = 'Python I' or nom ='Python II'; /*16*/

select distinct correo 
from dicta 
where nom = 'Python I' and nom ='Python II'; /*17*/

select * from pers natural join (select distinct dicta.correo
from dicta join insc on dicta.correo=insc.correo) /*18*/

select correo 
from insc 
group by correo 
having count (distinct nom) > 1; /*19*/

select correo 
from dicta 
group by correo
having count (distinct nom) > 1; /*20*/

select * from pers 
where correo in 
	(select correo
	from (select * from dicta natural join	
	(select nom from curso where cH > 30))
group by correo
having count (distinct nom) > 1); /*21*/

select distinct a.correo, a.nom, a.correoD, b.correo, b.nom, b.correoD
from insc a, insc b
where a.correo != b.correo and a.nom = b.nom and a.correoD != b.correoD /*22/23*/

