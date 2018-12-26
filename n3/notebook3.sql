CREATE DATABASE valdivia;

USE valdivia;

CREATE TABLE persona(
	id_RUT INT NOT NULL,
	nombre VARCHAR(50),
	edad INT,PRIMARY KEY(id_RUT)
);

CREATE TABLE lugar_de_interes(id_lugar INT NOT NULL AUTO_INCREMENT,description VARCHAR(100),
categoria VARCHAR(50),latitud FLOAT,longitud FLOAT,PRIMARY KEY(id_lugar));

CREATE TABLE desplazarse(id_RUT INT NOT NULL,
fecha DATE ,latitud FLOAT,longitud FLOAT,
FOREIGN KEY fk_persona(id_RUT) REFERENCES  
persona(id_RUT),PRIMARY KEY(id_RUT,fecha));



INSERT INTO persona(id_RUT,nombre,edad)VALUES (19862480,"francisco",20);
INSERT INTO persona(id_RUT,nombre,edad)VALUES (19863430,"stevenson",21);
INSERT INTO persona(id_RUT,nombre,edad)VALUES (19823430,"matias",40);
INSERT INTO persona(id_RUT,nombre,edad)VALUES (19123480,"eduardo",12);
INSERT INTO persona(id_RUT,nombre,edad)VALUES (19862180,"manco",20);

INSERT INTO lugar_de_interes(description,categoria,latitud,longitud) 
VALUES("Mercado fluvial","turismo",-39.81,-73.24);

INSERT INTO lugar_de_interes(description,categoria,latitud,longitud) 
VALUES("Torreon","turismo",-39.80,-73.22);

INSERT INTO lugar_de_interes(description,categoria,latitud,longitud) 
VALUES("Guatamarilla","turismo",-39.81,-73.21);

INSERT INTO desplazarse(id_RUT,fecha,latitud,longitud) 
VALUES(19862480,"2018-09-30 12:00:00",-39.81,-73.21);

SELECT * FROM persona INTO OUTFILE '/tmp/orders.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';



CREATE USER 'lazo'@'localhost' IDENTIFIED BY 'micontraseña';
GRANT ALL PRIVILEGES ON valdivia.* TO 'lazo'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'manco'@'localhost' IDENTIFIED BY 'micontraseña';
GRANT SELECT ON valdivia.lugar_de_interes TO 'manco'@'localhost';
GRANT SELECT ON valdivia.desplazarse TO 'manco'@'localhost';

ALTER TABLE persona ALTER COLUMN (nivel_de_estudio VARCHAR(50) NOT NULL);#elimina categoria de la tabla
ALTER TABLE lugar_de_interes DROP COLUMN categoria;

CREATE TABLE categoria(categoria_id INT NOT NULL AUTO_INCREMENT,nombre VARCHAR(50),PRIMARY KEY(categoria_id));

CREATE TABLE cat_lugar(id_categoria INT NOT NULL,lugar_id INT NOT NULL
,FOREIGN KEY fk_categoria(id_categoria) REFERENCES categoria(categoria_id)
,FOREIGN KEY fk_lugar(lugar_id) REFERENCES lugar_de_interes(id_lugar),
PRIMARY KEY(id_categoria,lugar_id)); 

ALTER TABLE lugar_de_interes MODIFY latitud FLOAT NOT NULL;
ALTER TABLE lugar_de_interes MODIFY longitud FLOAT NOT NULL;


SELECT *
FROM persona
INTO OUTFILE '/tmp/orders.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
