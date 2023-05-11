-- Creating database with full name
CREATE DATABASE ArinahKarim;

-- Connecting to database 
\c arinahkarim;


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
                     foreign key (wid) references Westerosi(wid),
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
(1011, 'Leadership'),
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
(1014, 1012),
(1011, 1003),
(1018, 1003),
(1010, 1003);


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


\qecho 'RA SQL'
/*
SELECT	W.WID, W.WNAME
FROM	WESTEROSI W, PREDECESSOR P
WHERE 	W.WID = P.SUCCID AND W.WID not in
		(SELECT W.WID
		FROM WESTEROSI W, PREDECESSOR P, OFHOUSE OH1, OFHOUSE OH2
		WHERE W.WID = P.SUCCID AND OH1.WID = P.SUCCID AND OH2.WID = P.PREDID AND OH1.WAGES <= OH2.WAGES );*/

--get rid of comma in main query
/*SELECT	W.wid, W.wname
FROM	Westerosi W JOIN Predecessor P ON W.wid = P.succid
WHERE 	W.wid NOT IN	(SELECT W.wid
			FROM Westerosi W, Predecessor P, OfHouse Oh1, OfHouse Oh2
			WHERE W.wid = P.succid AND Oh1.wid = P.succid AND Oh2.wid = P.predid AND Oh1.wages <= Oh2.wages);
*/	

--get rid of not in clause
/*SELECT	q.wid, q.wname
FROM	(SELECT W.wid, W.wname
	FROM Westerosi W JOIN Predecessor P ON W.wid = P.succid
	EXCEPT
	SELECT W.wid, W.wname
	FROM Westerosi W, Predecessor P, OfHouse Oh1, OfHouse Oh2
	WHERE W.wid = P.succid AND Oh1.wid = P.succid AND Oh2.wid = P.predid AND Oh1.wages <= Oh2.wages)q;*/

--removing commas from subquery
/*
SELECT	q.wid, q.wname
FROM	(SELECT W.wid, W.wname
	FROM	Westerosi W JOIN Predecessor P ON W.wid = P.succid
	EXCEPT
	SELECT	W.wid, W.wname
	FROM	Westerosi W NATURAL JOIN Predecessor P, OfHouse Oh1, OfHouse Oh2
	WHERE	W.wid = P.succid AND Oh1.wid = P.succid AND Oh2.wid = P.predid AND Oh1.wages <= Oh2.wages)q;*/


--natural join predecessor separately
SELECT	q.wid, q.wname
FROM	(SELECT W.wid, W.wname
	FROM	Westerosi W NATURAL JOIN Predecessor P
	WHERE W.wid = P.succid
	EXCEPT
	SELECT	W.wid, W.wname
	FROM	Westerosi W JOIN Predecessor P ON W.wid = P.succid
		NATURAL JOIN OfHouse Oh1 
		JOIN OfHouse Oh2 ON Oh1.wages <= OH2.wages
	WHERE	Oh1.wid = P.succid AND Oh2.wid = P.predid)q;
	

\qecho 'Optimized query'
--pushing condition into predecessor, of house, and other of house instance, excluding westerosi join
/*
WITH Wage AS (SELECT DISTINCT P.succid FROM Predecessor P, OfHouse O, OfHouse O2 
		WHERE P.predid = O.wid AND P.succid = O2.wid AND O2.wages <= O.wages)
SELECT	q.wid, q.wname
FROM	(SELECT W.wid, W.wname
	FROM	Westerosi W NATURAL JOIN (SELECT succid as wid FROM Predecessor)P
	EXCEPT
	SELECT W.wid, W.wname
	FROM Westerosi W JOIN Wage W2 ON W.wid = W2.succid)q;
*/

--joining
/*
WITH Wage AS (SELECT DISTINCT P.succid FROM (Predecessor P NATURAL JOIN OfHouse O) JOIN OfHouse O2
		ON P.predid = O.wid AND P.succid = O2.wid AND O2.wages <= O.wages)
SELECT	q.wid, q.wname
FROM	(SELECT W.wid, W.wname
	FROM	Westerosi W NATURAL JOIN (SELECT succid as wid FROM Predecessor)P
	EXCEPT
	SELECT W.wid, W.wname
	FROM Westerosi W JOIN Wage W2 ON W.wid = W2.succid)q;*/


--pulling back westerosi join because it is used in both relations
WITH Wage AS (SELECT DISTINCT P.succid FROM (Predecessor P NATURAL JOIN OfHouse O) JOIN OfHouse O2
		ON P.predid = O.wid AND P.succid = O2.wid AND O2.wages <= O.wages)
SELECT	W.wid, W.wname
FROM	Westerosi W NATURAL JOIN (SELECT succid FROM Predecessor
				   EXCEPT
				   SELECT *
				   FROM Wage)q
Where q.succid = W.wid;

\qecho 'Problem 2'


\qecho 'RA sql'
/*SELECT H.HNAME, H.KINGDOM
FROM	HOUSE H
WHERE	H.HNAME in (SELECT OH.HNAME
		   FROM OFHOUSE OH
		   WHERE OH.WAGES < 60000
		   AND OH.WID = SOME(SELECT WS.WID
				     FROM WESTEROSISKILL WS
				     WHERE WS.SKILL = 'Archery'));*/

--remove in
/*SELECT H.hname, H.kingdom
FROM	House H, OfHouse Oh
WHERE	Oh.hname = H.hname AND Oh.wages < 60000 AND OH.wid = SOME(SELECT WS.WID
				     			       FROM WESTEROSISKILL WS
				     			       WHERE WS.SKILL = 'Archery');*/
--remove some
/*SELECT H.hname, H.kingdom
FROM	House H, OfHouse Oh, WesterosiSkill WS
WHERE	Oh.hname = H.hname AND Oh.wages < 60000 AND WS.skill = 'Archery' AND OH.wid = WS.wid;*/
				     			       
--adding joins
/*SELECT H.hname, H.kingdom
FROM	House H NATURAL JOIN OfHouse Oh, WesterosiSkill WS
WHERE	Oh.hname = H.hname AND Oh.wages < 60000 AND WS.skill = 'Archery' AND Oh.wid = WS.wid;*/

SELECT	H.hname, H.kingdom
FROM	House H NATURAL JOIN OfHouse Oh NATURAL JOIN WesterosiSkill WS
WHERE	WS.skill = 'Archery' AND Oh.wid = WS.wid AND Oh.wages < 60000; 



\qecho 'Optimized query'
--projection elimination on House because we are selecting all attributes from House
/*
SELECT	H.*
FROM	House H NATURAL JOIN OfHouse Oh 
	JOIN WesterosiSkill WS ON WS.skill = 'Archery' AND Oh.wid = WS.wid AND Oh.wages < 60000; */


--pushing ofhouse condition selections over join, same for WS

WITH Archery AS (SELECT wid FROM WesterosiSkill WHERE skill = 'Archery')
SELECT H.*
FROM House H NATURAL JOIN OFHOUSE OH NATURAL JOIN ARCHERY A
WHERE OH.wages < 60000;




\qecho 'Problem 3'

\qecho 'RA sql'
/*
SELECT DISTINCT W.WID
FROM 	WESTEROSI W
WHERE	W.WLOCATION = 'Winterfell' AND EXISTS (SELECT 1
						FROM OFHOUSE H, WESTEROSISKILL W1
						WHERE W.WID = H.WID AND W.WID = W1.WID
						      AND H.WAGES = 50000 AND NOT W1.SKILL = 'Swordsmanship');*/
--get rid of exists
/*SELECT DISTINCT W.wid
FROM 	Westerosi W, OfHouse H, WesterosiSkill W1
WHERE	W.wlocation = 'Winterfell' AND W.wid = H.wid AND W.wid = W1.wid AND H.wages = 50000 AND NOT W1.skill = 'Swordsmanship';*/


--moving winterfell thing as its own separate thing, get rid of not
/*WITH	WinterfellGang AS (SELECT wid FROM Westerosi WHERE wlocation = 'Winterfell')
SELECT	DISTINCT W.wid
FROM	WinterfellGang W, ofHouse H, WesterosiSkill W1
WHERE	W.wid = H.wid AND W.wid = W1.wid AND H.wages = 50000 AND W1.skill <> 'Swordsmanship';*/

--time to join things
WITH	WinterfellGang AS (SELECT wid FROM Westerosi WHERE wlocation = 'Winterfell')
SELECT	DISTINCT WG.wid
FROM	(WinterfellGang WG NATURAL JOIN ofHouse H) JOIN WesterosiSkill W1 
		ON W1.wid = WG.wid 
WHERE H.wages = 50000 AND W1.skill <> 'Swordsmanship';



\qecho 'Optimized query'
--pushing down selection of winterfell onto westerosi
/*
WITH	WinterfellGang AS (SELECT wid FROM Westerosi WHERE wlocation = 'Winterfell')
SELECT	DISTINCT WG.wid
FROM	(WinterfellGang WG NATURAL JOIN ofHouse H) JOIN WesterosiSkill W1 
		ON W1.wid = WG.wid AND H.wages = 50000 AND W1.skill <> 'Swordsmanship';*/

--pushing down OfHouse wage selection over join
/*
WITH	WinterfellGang AS (SELECT wid FROM Westerosi WHERE wlocation = 'Winterfell'),
	FiftyKPpl      AS (SELECT wid FROM OfHouse H WHERE wages = 50000)
SELECT	DISTINCT W.wid
FROM	(WinterfellGang W NATURAL JOIN FiftyKPpl F) JOIN WesterosiSkill W1 ON W1.wid = W.wid AND W1.skill <> 'Swordsmanship';
*/		


--pushing down <>sworddsmanship selection over join
/*WITH	WinterfellGang	AS (SELECT wid FROM Westerosi WHERE wlocation = 'Winterfell'),
	FiftyKPpl	AS (SELECT wid FROM OfHouse H WHERE wages = 50000),
	SwordsSuck	AS (SELECT wid FROM WesterosiSkill WHERE skill <> 'Swordsmanship')
SELECT	DISTINCT WG.wid
FROM	(WinterfellGang WG NATURAL JOIN FiftyKPpl F) NATURAL JOIN SwordsSuck S;*/
		

WITH	WinterfellGang	AS (SELECT wid FROM Westerosi WHERE wlocation = 'Winterfell'),
	FiftyKPpl	AS (SELECT wid FROM OfHouse H WHERE wages = 50000),
	SwordsSuck	AS (SELECT wid FROM WesterosiSkill WHERE skill <> 'Swordsmanship')
SELECT	DISTINCT WG.*
FROM	(WinterfellGang WG NATURAL JOIN FiftyKPpl F) NATURAL JOIN SwordsSuck S;
	
\qecho 'Problem 4'


\qecho 'RA SQl'
/*
SELECT	W.WID
FROM	WESTEROSI W
WHERE 	NOT EXISTS (SELECT 1
		    FROM HOUSEALLYREGION HA
		    WHERE HA.REGION = 'IronIslands' AND
		    HA.HNAME NOT IN (SELECT H.HNAME
				      FROM OFHOUSE H
				      WHERE H.WID = W.WID
				      AND H.WID in (SELECT WS.WID
						     FROM WESTEROSISKILL WS
						     WHERE WS.SKILL = 'Archery')));*/

--eliminate IN clause
/*
SELECT W.WID
FROM	WESTEROSI W
WHERE 	NOT EXISTS (SELECT 1
		    FROM HOUSEALLYREGION HA
		    WHERE HA.REGION = 'IronIslands' AND
		    HA.HNAME NOT IN (SELECT H.HNAME
				      FROM OFHOUSE H, WESTEROSISKILL WS
				      WHERE H.WID = W.WID AND H.WID = WS.WID
				      AND WS.SKILL = 'Archery'));*/



--getting rid of NOT IN
/*
SELECT  W.WID
FROM	WESTEROSI W
WHERE 	NOT EXISTS (SELECT HA.HNAME
		    FROM HOUSEALLYREGION HA
		    WHERE HA.REGION = 'IronIslands'
		    EXCEPT
		    (SELECT H.HNAME
		     FROM OFHOUSE H, WESTEROSISKILL WS
		     WHERE H.WID = W.WID AND H.WID = WS.WID AND WS.SKILL = 'Archery'));*/
		   

--getting rid of commas in inner most sub-query
/*SELECT  W.WID
FROM	WESTEROSI W
WHERE 	NOT EXISTS (SELECT HA.HNAME
		    FROM HOUSEALLYREGION HA
		    WHERE HA.REGION = 'IronIslands'
		    EXCEPT
		    (SELECT H.HNAME
		     FROM OFHOUSE H JOIN WESTEROSISKILL WS 
		     		      ON H.WID = W.WID AND H.WID = WS.WID AND WS.SKILL = 'Archery'));*/


--remove where clause for houseallyregion
/*
WITH IronIslandsGang AS (SELECT HA.HNAME FROM HOUSEALLYREGION HA WHERE HA.REGION = 'IronIslands')
SELECT  W.WID
FROM	WESTEROSI W 
WHERE 	NOT EXISTS (SELECT I.HNAME
		    FROM IronIslandsGang I
		    EXCEPT
		    (SELECT H.HNAME
		     FROM OFHOUSE H JOIN WESTEROSISKILL WS 
		     		      ON H.WID = W.WID AND H.WID = WS.WID AND WS.SKILL = 'Archery'));
*/

--eliminating not exists clause, also changing back the ironislands to not a view so I can use it as an optimization step :P
SELECT  W.wid
FROM	Westerosi W JOIN WesterosiSkill WS ON W.WID = WS.WID
WHERE	WS.skill = 'Archery'
INTERSECT
SELECT	O.wid
FROM	OfHouse O JOIN HouseAllyRegion H ON O.HNAME = H.HNAME WHERE	H.REGION = 'IronIslands';


		     		      
	        
\qecho 'Optimized query'
--using natural join for westerosiskill and westerosi because they share same attribute wid
/*
SELECT  W.wid
FROM	Westerosi W NATURAL JOIN WesterosiSkill WS
WHERE	WS.skill = 'Archery'
INTERSECT
SELECT	O.wid
FROM	OfHouse O JOIN HouseAllyRegion H ON O.HNAME = H.HNAME AND H.REGION = 'IronIslands';*/


--pushing condition of westerosi skill being archery to reduce number of tuples to evaluate first
/*
WITH	ArcheryGang AS (SELECT wid FROM WesterosiSkill WHERE skill = 'Archery')
SELECT  W.wid
FROM	Westerosi W NATURAL JOIN ArcheryGang A
INTERSECT
SELECT	O.wid
FROM	OfHouse O JOIN HouseAllyRegion H ON O.HNAME = H.HNAME AND H.REGION = 'IronIslands';*/



--pushing condition of ironislands into a view as well
WITH	ArcheryGang AS (SELECT wid FROM WesterosiSkill WHERE skill = 'Archery'),
	IronIslands AS (SELECT hname FROM HouseAllyRegion WHERE region = 'IronIslands')
SELECT  W.wid
FROM	Westerosi W NATURAL JOIN ArcheryGang A
INTERSECT
SELECT	O.wid
FROM	OfHouse O NATURAL JOIN IronIslands I;


\qecho 'Problem 5'
/*
Find the wname and wlocation of each westerosi whose wages are
strictly greater than 50000, and belongs to a house which has a king-
dom in KingsLanding and has some skill.
*/

--not RA SQL
/*
WITH KingsLandingGang AS (SELECT hname FROM HouseAllyRegion WHERE region = 'KingsLanding')
SELECT W.WID, W.WNAME, W.WLOCATION
FROM WESTEROSI W, OFHOUSE O, KingsLandingGang K
WHERE W.WID = O.WID AND O.WAGES > 50000 AND O.HNAME IN (K.hname) AND 
	EXISTS (SELECT 1
		FROM WESTEROSISKILL WS
		WHERE WS.WID = W.WID);*/
		
		
--elimining commas in FROM
/*WITH KingsLandingGang AS (SELECT hname FROM HouseAllyRegion WHERE region = 'KingsLanding')
SELECT W.WID, W.WNAME, W.WLOCATION
FROM (WESTEROSI W NATURAL JOIN OFHOUSE O) JOIN KingsLandingGang K ON O.WAGES > 50000 AND O.HNAME IN (K.hname) AND 
	EXISTS (SELECT 1
		FROM WESTEROSISKILL WS
		WHERE WS.WID = W.WID);*/


\qecho 'RA SQL'
	
--eliminating EXISTS clause
/*
WITH KingsLandingGang AS (SELECT hname FROM HouseAllyRegion WHERE region = 'KingsLanding')
SELECT	DISTINCT W.WID
FROM	(WESTEROSI W NATURAL JOIN WESTEROSISKILL WS) 
	NATURAL JOIN OFHOUSE O 
	JOIN KingsLandingGang K ON O.WAGES > 50000 AND O.HNAME IN (K.hname);
*/	
--eliminating IN clause, turning back view into a separate thing for an optimization step later
SELECT	DISTINCT W.WID
FROM	(WESTEROSI W NATURAL JOIN WESTEROSISKILL WS) 
	NATURAL JOIN OFHOUSE O NATURAL JOIN HouseAllyRegion H
	WHERE O.WAGES > 50000 AND O.HNAME = H.Hname AND H.region = 'KingsLanding';


\qecho 'Optimized RA'
--pushing houseallyregion condition onto houseallyregion relation only
/*
WITH	KingsLGang AS (SELECT hname FROM HouseAllyRegion WHERE region = 'KingsLanding')
SELECT	DISTINCT W.WID
FROM	(WESTEROSI W NATURAL JOIN WESTEROSISKILL WS) 
	NATURAL JOIN KingsLGang K
	NATURAL JOIN OfHouse O
WHERE	O.wages > 50000;*/

--pushing down selection of wages, projecting wages and hname
WITH	KingsLGang	AS (SELECT hname FROM HouseAllyRegion WHERE region = 'KingsLanding'),
	FiftyGrandPlus	AS (SELECT wid, hname FROM OfHouse WHERE wages > 50000)
SELECT	DISTINCT W.WID
FROM	(WESTEROSI W NATURAL JOIN WESTEROSISKILL WS) 
	NATURAL JOIN FiftyGrandPlus F 
	NATURAL JOIN KingsLGang K;


-- Connect to default database
\c postgres;
-- Drop database created for this assignment
DROP DATABASE ArinahKarim;
