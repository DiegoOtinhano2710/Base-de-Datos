CREATE SCHEMA "min";

/*	CREACIÓN DE TABLAS	*/
CREATE TABLE "min".rub
(tipo TEXT,
nom TEXT,
alm TEXT,
PRIMARY KEY (tipo));

CREATE TABLE "min".prod
(cod INT,
nom TEXT,
rubro TEXT,
precio FLOAT,
PRIMARY KEY (cod),
FOREIGN KEY (rubro) REFERENCES "min".rub (tipo)
ON UPDATE RESTRICT
ON DELETE RESTRICT);

CREATE TABLE "min".factura
(num INT,
cuil TEXT,
fecha DATE,
precio FLOAT,
cant INT,
PRIMARY KEY (num));

CREATE TABLE "min".genera
(codP INT,
numF INT,
PRIMARY KEY (codP, numF),
FOREIGN KEY (codP) REFERENCES "min".prod (cod)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (numF) REFERENCES "min".factura (num)
ON DELETE CASCADE
ON UPDATE CASCADE);


