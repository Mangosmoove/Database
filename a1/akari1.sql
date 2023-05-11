-- Creating database with full name
CREATE DATABASE akari;

-- Connecting to database 
\c akari;

CREATE TABLE Westerosi(wid integer,
                    wname text,
                    wlocation text,
                    primary key (wid));

CREATE TABLE House(hname text,
                     kingdom text,
                     primary key (hname));

CREATE TABLE Skill(skill text,
                   primary key (skill));


CREATE TABLE OfHouse(wid integer,
                      hname text,
                      wages integer,
                      primary key (wid),
                      foreign key (wid) references Westerosi (wid),
                      foreign key (hname) references House(hname));


CREATE TABLE HouseAllyRegion(hname text,
                             region text,
                             primary key (hname, region),
                             foreign key (hname) references House (hname));


CREATE TABLE WesterosiSkill(wid integer,
                         skill text,
                         primary key (wid, skill),
                         foreign key (wid) references Westerosi (wid) on delete cascade,
                         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE Predecessor(succid integer,
                        predid integer,
                        primary key (succid, predid),
                        foreign key (succid) references Westerosi (wid),
                        foreign key (predid) references Westerosi (wid));

CREATE TABLE Knows(wid1 integer,
                   wid2 integer,
                   primary key(wid1, wid2),
                   foreign key (wid1) references Westerosi (wid),
                   foreign key (wid2) references Westerosi (wid));

INSERT INTO Westerosi VALUES
     (1001,'JonSnow','CastleBlack'),
     (1002,'Daenerys', 'CastleBlack'),
     (1003,'Sansa', 'KingsLanding'),
     (1004,'Cersei', 'KingsLanding'),
     (1005,'Jamie', 'CasterlyRock'),
     (1006,'Joffrey', 'BlackwaterBay'),
     (1007,'Stannis','Stormlands'),
     (1008,'Arya', 'Winterfell'),
     (1009,'Bran', 'Winterfell'),
     (1010,'Renly', 'BlackwaterBay'),
     (1011,'Catelyn', 'CasterlyRock'),
     (1012,'Samwell', 'CastleBlack'),
     (1013,'Tywin', 'Riverrun'), 
     (1014,'Brienne', 'Winterfell'), 
     (1015,'Olenna', 'Vale'),
     (1016,'Oberyn', 'BlackwaterBay'),
     (1017,'Robb', 'Stormlands'),
     (1018,'Theon', 'Winterfell'),
     (1019,'Tyrion', 'Highgarden'),
     (1020,'Varys', 'Oldtown');

INSERT INTO House VALUES
     ('NightsWatch', 'CastleBlack'),
     ('Baratheon', 'KingsLanding'),
     ('Lannister', 'CasterlyRock'),
     ('Stark', 'Winterfell'),
     ('Martell', 'Dorne'),
     ('Targaryen', 'KingsLanding'),
     ('Tyrell', 'Highgarden');


INSERT INTO OfHouse VALUES
     (1001,'NightsWatch', 65000),
     (1002,'Targaryen', 45000),
     (1003,'Stark', 55000),
     (1004,'Lannister', 55000),
     (1005,'Lannister', 60000),
     (1006,'Baratheon', 55000),
     (1007,'Baratheon', 50000),
     (1008,'Stark', 50000),
     (1009,'Stark',60000),
     (1010,'Baratheon', 55000),
     (1011,'Stark', 70000), 
     (1012,'NightsWatch', 50000),
     (1013,'Lannister', 55000),
     (1014,'NightsWatch', 50000), 
     (1015,'Tyrell', 60000),
     (1016,'Martell', 55000),
     (1017,'Stark', 60000),
     (1018,'NightsWatch', 50000),
     (1019,'Lannister', 50000);


INSERT INTO HouseAllyRegion VALUES
   ('NightsWatch', 'Winterfell'),
   ('Baratheon', 'BlackwaterBay'),
   ('Baratheon', 'Vale'),
   ('Baratheon', 'IronIslands'),
   ('Lannister', 'Highgarden'),
   ('Stark', 'Riverrun'),
   ('Stark', 'BlackwaterBay'),
   ('Martell', 'Winterfell'),
   ('NightsWatch', 'CastleBlack'),
   ('Baratheon', 'KingsLanding'),
   ('Lannister', 'CasterlyRock'),
   ('Stark', 'Stormlands'),
   ('Martell', 'Dorne'),
   ('Targaryen', 'Highgarden');

INSERT INTO Skill VALUES
   ('Archery'),
   ('Politics'),
   ('Swordsmanship'),
   ('HorseRiding'),
   ('Leadership');

INSERT INTO WesterosiSkill VALUES
 (1001,'Archery'),
 (1001,'Politics'),
 (1002,'Archery'),
 (1002,'Politics'),
 (1004,'Politics'),
 (1004,'Archery'),
 (1005,'Politics'),
 (1005,'Archery'),
 (1005,'Swordsmanship'),
 (1006,'Archery'),
 (1006,'HorseRiding'),
 (1007,'HorseRiding'),
 (1007,'Archery'),
 (1009,'HorseRiding'),
 (1009,'Swordsmanship'),
 (1010,'Swordsmanship'),
 (1011,'Swordsmanship'),
 (1011,'HorseRiding'),
 (1011,'Politics'),
 (1011,'Archery'),
 (1012,'Politics'),
 (1012,'HorseRiding'),
 (1012,'Archery'),
 (1013,'Archery'),
 (1013,'Politics'),
 (1013,'HorseRiding'),
 (1013,'Swordsmanship'),
 (1014,'HorseRiding'),
 (1014,'Politics'),
 (1014,'Swordsmanship'),
 (1015,'Archery'),
 (1015,'Politics'),
 (1016,'HorseRiding'),
 (1016,'Politics'),
 (1017,'Swordsmanship'),
 (1017,'Archery'),
 (1018,'Politics'),
 (1019,'Swordsmanship');

INSERT INTO Predecessor VALUES
 (1004, 1013),
 (1005, 1013),
 (1019, 1013),
 (1009, 1017),
 (1009, 1011),
 (1012, 1001),
 (1010, 1007),
 (1006, 1010),
 (1017, 1011),
 (1018, 1001),
 (1003, 1008),
 (1014, 1012);

 INSERT INTO Knows VALUES
 (1011,1009),
 (1007,1016),
 (1011,1010),
 (1003,1004),
 (1006,1004),
 (1002,1014),
 (1009,1005),
 (1018,1009),
 (1007,1017),
 (1017,1019),
 (1019,1013),
 (1016,1015),
 (1001,1012),
 (1015,1011),
 (1019,1006),
 (1013,1002),
 (1018,1004),
 (1013,1007),
 (1014,1006),
 (1004,1014),
 (1001,1014),
 (1010,1013),
 (1010,1014),
 (1004,1019),
 (1018,1007),
 (1014,1005),
 (1015,1018),
 (1014,1017),
 (1013,1018),
 (1007,1008),
 (1005,1015),
 (1017,1014),
 (1015,1002),
 (1018,1013),
 (1018,1010),
 (1001,1008),
 (1012,1011),
 (1002,1015),
 (1007,1013),
 (1008,1007),
 (1004,1002),
 (1015,1005),
 (1009,1013),
 (1004,1012),
 (1002,1011),
 (1004,1013),
 (1008,1001),
 (1008,1019),
 (1019,1008),
 (1001,1019),
 (1019,1001),
 (1004,1003),
 (1006,1003),
 (1015,1003),
 (1016,1004),
 (1016,1006),
 (1008,1015),
 (1010,1008),
 (1017,1013),
 (1002,1001),
 (1009,1001),
 (1011,1005),
 (1014,1012);

\qecho 'Problem 1'
CREATE TABLE WhiteWalker(ranking integer NOT NULL,
			 wid integer NOT NULL,
			 skill text NOT NULL,
			 nkname text,
			 kills integer,
			 primary key (ranking),
			 foreign key (wid) references Westerosi(wid),
			 foreign key (skill) references Skill(skill));
						 
INSERT INTO WhiteWalker VALUES
	(1, 1001, 'Archery', 'NickleBack', 7),
	(2, 1002, 'Politics', 'Stevie', 4),
	(3, 1004, 'Politics', 'Squanch', 5),
	(4, 1005, 'Swordsmanship', 'McPhatter', 8);

SELECT * FROM WhiteWalker;


\qecho 'Problem 2'
SELECT W.wid, W.skill, W.nkname
FROM WhiteWalker W
WHERE W.kills > 5;


\qecho 'Problem 3'
SELECT W.wid, W.wname, W.wlocation
FROM Westerosi W, OfHouse O
WHERE O.wid = W.wid AND O.hname='Stark';


\qecho 'Problem 4'
SELECT W.wid
FROM Westerosi W
EXCEPT
SELECT WE.wid
FROM Westerosi WE, WesterosiSkill WS, WesterosiSkill WS2, WesterosiSkill WS3
WHERE (WE.wid = WS.wid AND WE.wid = WS2.wid AND WS2.skill<>WS.skill AND (WS2.skill = 'Archery' OR WS.skill = 'Swordsmanship' OR WS.skill = 'Archery' OR WS2.skill = 'Swordsmanship')) OR (WS3.wid = WE.wid AND WS3.skill = 'Swordsmanship') 
ORDER BY wid; 


\qecho 'Problem 5'
--1st
INSERT INTO Westerosi VALUES
	(1001,'JonSnowTheSecond','CastleBlack'),
	(1002,'DaenerysTheSecond','CastleBlack');

--2nd 
--SELECT DISTINCT wid1 FROM KNOWS;
DELETE FROM Knows WHERE wid1 = '1011';
--SELECT DISTINCT wid1 FROM KNOWS;

--3rd
DELETE FROM Westerosi WHERE wid = '1011';

--4th
INSERT INTO WesterosiSkill VALUES
	(1022, 'Politics');
\qecho 'Problem 6'
Select DISTINCT W.wid, W.wname, HAR.hname
FROM 	(SELECT WE.wid, WE.wname 
	FROM Westerosi WE, WesterosiSkill WS1, WesterosiSkill WS2 
	WHERE (WE.wid = WS1.wid AND WS1.wid = WS2.wid AND (WS1.skill = 
		'Archery' OR WS2.skill = 'Archery')))W, OfHouse O, HouseAllyRegion HAR
WHERE	O.wid = W.wid AND (O.wages > 50000 AND O.wages < 75000) AND (O.hname = HAR.hname AND HAR.region = 'CasterlyRock'); 


\qecho 'Problem 7'
SELECT DISTINCT O.hname
FROM OfHouse O, OfHouse O2
WHERE O.hname = O2.hname AND O.wid<>O2.wid;


\qecho 'Problem 8'
SELECT DISTINCT W.wid, W.wname, W.wlocation
FROM (SELECT PR.succid FROM Predecessor PR)P, Westerosi W
WHERE W.wid = P.succid
ORDER BY W.wid;


\qecho 'Problem 9'
(SELECT DISTINCT WS1.wid
FROM WesterosiSkill WS1, WesterosiSkill WS2
WHERE WS1.wid = WS2.wid AND (WS1.skill = 'Archery' OR WS2.skill = 'Politics' OR WS1.skill = 'Politics' OR WS2.skill = 'Archery'))
INTERSECT
SELECT O.wid
FROM OfHouse O
WHERE O.hname = 'Stark' OR O.hname = 'Baratheon';


\qecho 'Problem 10'
SELECT DISTINCT W.wid
FROM (SELECT WE.wid FROM Westerosi WE EXCEPT SELECT P.succid FROM Predecessor P)W
UNION
	(SELECT DISTINCT W2.wid 
	FROM (SELECT WE2.wid FROM Westerosi WE2 EXCEPT SELECT OH.wid FROM OfHouse OH)W2
	INTERSECT 
	(SELECT DISTINCT W3.wid FROM (SELECT WE3.wid FROM Westerosi WE3 EXCEPT SELECT WS.wid FROM WesterosiSkill WS)W3));

-- Connect to default database
\c postgres;

-- Drop database created for this assignment
DROP DATABASE akari;
