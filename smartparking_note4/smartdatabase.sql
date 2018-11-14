
create database smartparking;
use smartparking;
create table cities (
    id_city INT AUTO_INCREMENT,
    name_city VARCHAR(50),
    PRIMARY KEY (id_city));
create table streets(
    id_street INT AUTO_INCREMENT,
    id_city INT ,
    name_street VARCHAR(50),
    longitude INT,
    FOREIGN KEY fk_citys(id_city) REFERENCES cities(id_city),
    PRIMARY KEY(id_street));
create table parkings(
    id_parking INT AUTO_INCREMENT,
    id_street INT,
    longitude FLOAT ,
    latitude FLOAT,
    FOREIGN KEY fk_streets(id_street) REFERENCES streets(id_street),
    PRIMARY KEY(id_parking));

ALTER TABLE parkings ADD COLUMN available INT NOT NULL ;
INSERT INTO cities(name_city)VALUES ("Valdivia");
INSERT INTO streets(id_city,name_street,longitude) VALUES(1,"Yungay",100);
INSERT INTO streets(id_city,name_street,longitude) VALUES(1,"Av Ramon Picarte",4000);

INSERT INTO parkings(id_street,longitude,latitude) VALUES(1,-39.8169298,-73.2481375);