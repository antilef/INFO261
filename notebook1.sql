CREATE DATABASE football;

CREATE TABLE player(id_player INT AUTO_INCREMENT, name VARCHAR(50), position VARCHAR(20), nationality VARCHAR(20), PRIMARY KEY (id_player));

CREATE TABLE team(id_team INT AUTO_INCREMENT, name VARCHAR(50), country VARCHAR(20), PRIMARY KEY (id_team));

CRATE TABLE to_play(id_team INT NOT NULL, id_player INT NOT NULL, FOREIGN KEY fk_player(id_player) REFERENCES player(id_player), FOREIGN KEY fk_team(id_team) REFERENCES team(id_team), PRIMARY KEY (id_player, id_team));

ALTER TABLE to_play ADD COLUMN number_goals INT;

INSERT INTO player (name, position, nationality) VALUES ("Arturo Vidal", "midfielder", "chilena");

INSERT INTO player (name, position, nationality) VALUES ("Gary Medel", "defender", "chilena");

INSERT INTO player (name, position, nationality) VALUES ("Enzo Roco", "defender", "chilena");

INSERT INTO player (name, position, nationality) VALUES ("Gabriel Arias", "goalkeeper", "chilena");

INSERT INTO team (name, country) VALUES ("Racing", "Argentina");

INSERT INTO team (name, country) VALUES ("Barcelona", "España");

INSERT INTO team (name, country) VALUES ("Besiktas","Turkey");

INSERT INTO to_play (id_player, id_team) VALUES (1, 2),(2, 3),(3, 3),(4, 1);

UPDATE to_play SET number_goals=2 WHERE id_player=1;

SELECT * FROM player WHERE position="defender";

SELECT * FROM player
JOIN to_play ON player.id_player = to_play.id_player
JOIN team ON team.id_team = to_play.id_team
WHERE country="Turkey";
