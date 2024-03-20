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

INSERT INTO EQ06_Route (origin_station, destination_station) VALUES
	((SELECT id FROM EQ06_Station WHERE nameStation = 'Toronto'),
	 (SELECT id FROM EQ06_Station WHERE nameStation = 'Montreal'));

INSERT INTO EQ06_RailRoute ( rail_id, route_id, nb_stop) VALUES
	((SELECT id FROM EQ06_Rail WHERE conn1_station = 3 AND conn2_station = 4 OR conn1_station = 4 AND conn2_station = 3), 2, 0),
	((SELECT id FROM EQ06_Rail WHERE conn1_station = 6 AND conn2_station = 4 OR conn1_station = 4 AND conn2_station = 6), 2, 1);

INSERT INTO EQ06_Train (charge, puissance, company_id, route_id, relative_position, currentRail, lastStation, nextStation) VALUES
	( 40, 4000, 'PHP', 2, 17, (SELECT id FROM EQ06_Rail WHERE conn1_station = 'Toronto' AND conn2_station = 'Brockville' OR conn1_station = 'Brockville' AND conn2_station = 'Toronto'), (SELECT id FROM EQ06_Station WHERE nameStation = 'Toronto'), (SELECT id FROM EQ06_Station WHERE nameStation = 'Brockville'));

COMMIT;
