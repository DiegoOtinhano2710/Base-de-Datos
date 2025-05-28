create schema pers;

create table "pers".ciu1
(idCiu integer,
nomCiu text NOT NULL,
cantHab integer DEFAULT 0,
primary key (idCiu));

create table "pers".pers1
(cuil text,
nom text,
idCiu integer,
edad integer,
trabaja text,
primary key (cuil),
foreign key (idCiu) references "pers".ciu1 (idCiu)
ON DELETE RESTRICT
ON UPDATE CASCADE
);

/* a */
INSERT INTO "pers".pers1 VALUES
('20-11111111-1', 'Juan Perez', 1, 35, 'si'),
('27-22222222-2', 'Ana Gomez', 2, 28, 'no'),
('23-33333333-3', 'Carlos Diaz', 1, 40, 'si'),
('25-44444444-4', 'María Lopez', 3, 22, 'no');

/* b */
UPDATE "pers".pers1 
INSERT INTO "pers".pers1 VALUES ('20-55555555-1', 'Juan Sanchez', 10, 35, 'si');

/* c */
INSERT INTO "pers".ciu1 VALUES (1, 'Buenos Aires', 3000000);
INSERT INTO "pers".ciu1 VALUES (2, 'Rosario', null);
INSERT INTO "pers".ciu1 VALUES (3, null, 1400000);
INSERT INTO "pers".ciu1 VALUES (4, 'Mendoza', -800000);

/* d */
INSERT INTO "pers".ciu1 VALUES (3, 'San Juan', 822853);
INSERT INTO "pers".ciu1 VALUES (4, 'Mendoza', 2043540);

/* 3 */
DELETE FROM "pers".ciu1 WHERE idciu = 1;
/* Este query da error porqueee en la restriccion referencial tenía que en caso de querer borrar una tupla referenciada,
si habían tuplas que referenciaban a esa tupla en cuestión, no dejara borrarla (ON DELETE RESTRICT) */

/* 4 */
UPDATE "pers".ciu1
SET idCiu = 10
WHERE idCiu = 1
/* Este query, gracias a la restriccion referencial "ON UPDATE CASCADE", si se modifica un atributo en la tupla referenciada,
este cambio se refleja también en las tuplas referenciantes */

/* 5 */

/* CREACIÓN DE LAS TABLAS */
CREATE TABLE "pers".ciu2
(idCiu INT,
nomCiu TEXT NOT NULL,
cantHab INT DEFAULT (0),
PRIMARY KEY (idCiu));

CREATE TABLE "pers".pers2
(cuil TEXT,
nom TEXT,
idCiu INT,
edad INT,
trabaja TEXT,
PRIMARY KEY (cuil),
FOREIGN KEY (idCiu) REFERENCES "pers".ciu2(idCiu)
ON DELETE SET NULL
ON UPDATE RESTRICT);

ALTER TABLE "pers".ciu2
ALTER COLUMN cantHab DROP NOT NULL
/*	6	*/
/* CARGAR LAS TABLAS */
/* a */
INSERT INTO "pers".pers2 VALUES
('20-11111111-1', 'Juan Perez', 1, 35, 'si'),
('27-22222222-2', 'Ana Gomez', 2, 28, 'no'),
('23-33333333-3', 'Carlos Diaz', 1, 40, 'si'),
('25-44444444-4', 'María Lopez', 3, 22, 'no');

/* b */
UPDATE "pers".pers2 
INSERT INTO "pers".pers2 VALUES ('20-55555555-1', 'Juan Sanchez', 10, 35, 'si');

/* c */
INSERT INTO "pers".ciu2 VALUES (1, 'Buenos Aires', 3000000);
INSERT INTO "pers".ciu2 VALUES (2, 'Rosario');
INSERT INTO "pers".ciu2 VALUES (3, null, 1400000);
INSERT INTO "pers".ciu2 VALUES (4, 'Mendoza', -800000);

/* d */
INSERT INTO "pers".ciu2 VALUES (3, 'San Juan', 822853);
INSERT INTO "pers".ciu2 VALUES (4, 'Mendoza', 2043540);
UPDATE "pers".ciu2
SET cantHab = 2043540
WHERE idCiu = 4

/* ELIMINAR LA CIUDAD idciu=1 */
DELETE FROM "pers".ciu2
WHERE idciu = 1
/* a diferencia de la primera el ON DELETE está en SET NULL lo que provoca que SI se pueda eliminar la tupla
referenciada y, además, en las tuplas referenciantes va a colocar un null en la clave foránea */

/* MODIFICAR LA CIUDAD CON ID 1 */
UPDATE "pers".ciu2
SET idciu = 10
WHERE idciu = 3
/* en este caso la modificación no ocurre por una razón similar al eliminar de antes.
La restricción refercial ON UPDATE está en RESTRICT por lo que, si hay tuplas que referencien a la tupla a modificar,
no le va a dejar */

/*	7	*/
ALTER TABLE "pers".pers1
ADD CONSTRAINT edad CHECK (edad > 0)
ALTER COLUMN trabaja SET DEFAULT ('si')

/*	8	*/
INSERT INTO "pers".pers1 VALUES ('20-66666666-1', 'Ignacio Perez', 10, 33);

UPDATE "pers".pers1
SET edad=0
WHERE cuil='20-66666666-1';

/*	9	*/
DROP TABLE "pers".pers2;
DROP TABLE "pers".ciu2;

/*	10	*/
CREATE TABLE "pers".ciu3
(idCiu INT,
nomCiu TEXT NOT NULL,
cantHab INT DEFAULT 0,
PRIMARY KEY (idCiu));

CREATE TABLE "pers".pers3
(cuil TEXT,
nom TEXT,
ciudad INT,
edad INT,
trabaja TEXT,
PRIMARY KEY (cuil),
FOREIGN KEY (ciudad) REFERENCES "pers".ciu3 (idCiu)
ON DELETE NO ACTION
ON UPDATE SET DEFAULT);

ALTER TABLE "pers".pers3
ALTER COLUMN ciudad SET DEFAULT 4;
ALTER TABLE "pers".ciu3
ADD CONSTRAINT habitantes CHECK (cantHab > 0)

/* a */
INSERT INTO "pers".pers3 VALUES
('20-11111111-1', 'Juan Perez', 1, 35, 'si'),
('27-22222222-2', 'Ana Gomez', 2, 28, 'no'),
('23-33333333-3', 'Carlos Diaz', 1, 40, 'si'),
('25-44444444-4', 'María Lopez', 3, 22, 'no');

/* b */
UPDATE "pers".pers3 
INSERT INTO "pers".pers3 VALUES ('20-55555555-1', 'Juan Sanchez', 10, 35, 'si');

/* c */
INSERT INTO "pers".ciu3 VALUES (1, 'Buenos Aires', 3000000);
INSERT INTO "pers".ciu3 VALUES (2, 'Rosario', null);
INSERT INTO "pers".ciu3 VALUES (3, null, 1400000);
INSERT INTO "pers".ciu3 VALUES (4, 'Mendoza', -800000);
/* d */
INSERT INTO "pers".ciu3 VALUES (3, 'San Juan', 822853);
INSERT INTO "pers".ciu3 VALUES (4, 'Mendoza', 2043540);

DELETE FROM "pers".ciu3 WHERE idCiu = 1

UPDATE "pers".ciu3
SET idCiu = 10
WHERE idCiu = 3
/*==================================================*/
select * from "pers".ciu1;
select * from "pers".pers1;
select * from "pers".ciu3;
select * from "pers".pers3;
INSERT INTO "pers".pers1 VALUES ('20-44317847-6', 'Diego Otinhano', 3, -22);
DELETE FROM "pers".pers1 WHERE cuil='20-44317847-6'