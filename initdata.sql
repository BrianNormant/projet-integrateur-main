/* Script d'ajout des données test dans la DB */
/* Author: Brian Normant */

START TRANSACTION;

INSERT INTO EQ06_Station (nameStation, posX, posY) VALUES 
	('Toronto', 1798, 1549),  
	('Brockville', 1459, 1352),  
	('Ottawa', 1575, 1293),  
	('Montreal', 1382, 1189),  
	('Sainte-Foy', 1314, 977),   
	('Quebec', 1241, 914),   
	('Winnipeg', 3466, 1237),  
	('Edmonton', 4460, 855),   
	('Vancouver', 5289, 1078);

INSERT INTO EQ06_Rail (conn1_station, conn2_station, longueur) VALUES
	((SELECT id FROM EQ06_Station WHERE nameStation = 'Toronto'), (SELECT id FROM EQ06_Station WHERE nameStation = 'Brockville'), 50),
	((SELECT id FROM EQ06_Station WHERE nameStation = 'Brockville'), (SELECT id FROM EQ06_Station WHERE nameStation = 'Ottawa'), 50),
	((SELECT id FROM EQ06_Station WHERE nameStation = 'Brockville'), (SELECT id FROM EQ06_Station WHERE nameStation = 'Montreal'), 50),
	((SELECT id FROM EQ06_Station WHERE nameStation = 'Montreal'), (SELECT id FROM EQ06_Station WHERE nameStation = 'Sainte-Foy'), 50),
	((SELECT id FROM EQ06_Station WHERE nameStation = 'Sainte-Foy'), (SELECT id FROM EQ06_Station WHERE nameStation = 'Quebec'), 50),
	((SELECT id FROM EQ06_Station WHERE nameStation = 'Toronto'), (SELECT id FROM EQ06_Station WHERE nameStation = 'Winnipeg'), 50),
	((SELECT id FROM EQ06_Station WHERE nameStation = 'Winnipeg'), (SELECT id FROM EQ06_Station WHERE nameStation = 'Edmonton'), 50),
	((SELECT id FROM EQ06_Station WHERE nameStation = 'Edmonton'), (SELECT id FROM EQ06_Station WHERE nameStation = 'Vancouver'), 50);

COMMIT;
