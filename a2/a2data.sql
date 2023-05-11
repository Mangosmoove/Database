-- Creating database with full name
CREATE DATABASE ArinahKarim;

-- Connecting to database 
\c postgres;



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


CREATE TABLE Pizza(diameter float);
INSERT INTO Pizza VALUES
(22.44),
(19.96),
(20.12),
(77.44),
(65.01),
(20.15);


drop table if exists equation;

CREATE TABLE EQUATION(A int, B int, C int);


INSERT INTO EQUATION
VALUES
(1,4,3),
(1,-4,4),
(1,-6,9),
(1,-4,3),
(2,-3,1);

DROP TABLE IF EXISTS LINKEDLIST;
CREATE TABLE LINKEDLIST(NODE int, NEXTNODE int);

\qecho 'Problem 1'
/* Consider the relation {\tt Equation(a int, b int, c int)},
find the roots r1,r2 of the the quadratic equation: $ax^2 + bx + c$ */

DROP FUNCTION IF EXISTS rootFinder;

CREATE FUNCTION rootFinder()
RETURNS TABLE (r1 FLOAT, r2 FLOAT) AS
$$
SELECT (((-1 * E.B)+sqrt(power(E.B, 2) - (4 * E.A * E.C)))/(2*E.A)),(((-1 * E.B)-sqrt(power(E.B, 2) - (4 * E.A * E.C)))/(2*E.A)) FROM EQUATION E;
$$LANGUAGE SQL;


SELECT q.r1, q.r2
FROM rootFinder()q;


\qecho 'Problem 2'
/*Using the relation Pizza, write a SQL query that calculates the ratio
of the areas of the 2 largest Pizzas (largest / second largest) rounded to 2
decimal places. (π = 3.14) */


--referenced stack overflow for a rounding issue: https://stackoverflow.com/questions/58731907/error-function-rounddouble-precision-integer-does-not-exist
DROP FUNCTION IF EXISTS ratioArea;
DROP FUNCTION IF EXISTS d1;
DROP FUNCTION IF EXISTS d2;

CREATE FUNCTION d1(firstD FLOAT) RETURNS FLOAT AS
$$
SELECT MAX(P.diameter) FROM Pizza P
$$LANGUAGE SQL;

CREATE FUNCTION d2(secondD FLOAT) RETURNS FLOAT AS
$$
SELECT MAX(P2.diameter)
FROM Pizza P2
WHERE P2.diameter <> (SELECT MAX(P3.diameter) FROM Pizza P3) 
$$LANGUAGE SQL;

CREATE FUNCTION ratioArea() RETURNS TABLE (ratio FLOAT) AS
$$
SELECT DISTINCT (POWER(d1(P.diameter),2)) / (POWER(d2(P.diameter),2)) AS ratio
FROM Pizza P
$$LANGUAGE SQL;

SELECT ROUND(R.ratio::numeric,2)
FROM ratioArea()R;


\qecho 'Problem 3'
/* Create a function skillsInRange(n1 int, n2 int) returns the count of
Westerosis that have at least n1 skills and at most n2 skills. Test your
queries with inputs: */

DROP VIEW WS_Skill_Co;
DROP FUNCTION skillsInRange;


CREATE VIEW WS_Skill_Co AS
	(SELECT WS.wid, COUNT(WS.skill) AS No_skill
	FROM   WesterosiSkill WS
	GROUP BY (WS.wid))
	UNION
	(SELECT W.wid, 0 AS No_skill
	FROM   Westerosi W
	WHERE W.wid NOT IN (SELECT WS.wid
	FROM   WesterosiSkill WS));

--SELECT * FROM WS_Skill_Co;


CREATE FUNCTION skillsInRange(n1 int, n2 int) RETURNS INT AS
$$
SELECT COUNT(W.wid)
FROM WS_Skill_Co W
WHERE W.No_skill >= n1 AND W.No_skill <= n2
$$LANGUAGE SQL;

/* Test Case 1 */
SELECT * FROM skillsInRange(0,1);

/* Test Case 2 */
SELECT * FROM skillsInRange(4,5);



\qecho 'Problem 4'
/* Create a function/parameterized view familyGuy(housename) that takes
an hname as input, and returns the wids of the Westerosi with the most
amount of immediate successors. Test your query with inputs:
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠶⠚⠛⠉⠉⠉⠀⠀⠉⠉⠙⠓⠦⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⠴⠶⠦⢤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠛⠛⠒⢦⡀⠀⠀⠉⠙⠳⢶⣤⣄⣀⣀⣀⣀⣀⣤⠜⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡏⠀⠀⠀⠀⠀⠹⣄⠀⠀⢀⠔⠋⠉⠉⠛⢍⠉⠉⣽⠃⠀⢀⣻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡤⢾⡇⠀⠀⣸⣧⠤⢤⣏⠉⠙⡏⠀⠀⢀⣀⠀⠈⣧⠴⣷⠶⠾⣿⡟⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠁⠀⠀⠹⣄⡼⠋⠀⠀⠀⠈⠁⠀⣧⠀⠀⠈⠁⠀⢠⡇⠀⠀⠀⠀⢻⠷⠛⣷⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠁⠀⠀⠀⠀⠀⠀⢳⡄⠀⠀⠀⠀⠀⠀⠈⠳⢄⣀⣀⠴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠸⣇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠀⠀⠀⠀⠀⠀⢀⡤⠀⠉⠓⠦⠤⠤⠖⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣼⠁⠀⠀⠀⠀⠀⠀⣨⠧⣄⣀⡀⠀⠀⠀⠀⠀⢀⣀⣠⡤⠶⠛⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠻⣤⣄⡈⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀
*/

/*
I offer you a swimming baby duck from the internet in return: (https://textart.io/art/tag/small/1)
               __
             <(o )___
              ( ._> /
               `---'  
*/

/* YOUR CODE HERE */
CREATE VIEW Succ_co AS
	SELECT DISTINCT P.predid, COUNT(P.succid) AS No_succid
	FROM Predecessor P 
	GROUP BY P.predid;


--https://stackoverflow.com/questions/1475589/sql-server-how-to-use-an-aggregate-function-like-max-in-a-where-clause
--I used the answer to formulate the where clause where the S.No_succid = (SELECT...)
CREATE FUNCTION familyGuy(hN text) RETURNS TABLE (w int) AS
$$
SELECT	S.predid
FROM	Succ_co S, (SELECT Oh.wid FROM OfHouse Oh WHERE Oh.hName = hN)O
WHERE	S.predid = O.wid AND S.No_succid = (SELECT MAX(S2.No_succid) 
					    FROM Succ_co S2, (SELECT Oh.wid FROM OfHouse Oh WHERE Oh.hName = hN)O 
					    WHERE S2.predid = O.wid)
$$LANGUAGE SQL;


/* Test Case 1 */
SELECT * FROM familyGuy('Stark');

/* Test Case 2 */
SELECT * FROM familyGuy('Baratheon');

DROP FUNCTION familyGuy;
DROP VIEW Succ_co;


\qecho 'Problem 5'

/*
Find the wid of the Westerosi who don’t have ‘Archery’ or ‘Swordsmanship’ as
their skill.
*/


\qecho '5a: Using Exists, Not Exists'
SELECT W.wid
FROM Westerosi W
WHERE W.wid NOT IN 
	(SELECT DISTINCT WS1.wid
	FROM WesterosiSkill WS1
	WHERE EXISTS 	(SELECT * 
			FROM WesterosiSkill WS2, WesterosiSkill WS3 
			WHERE WS1.wid = WS2.wid AND WS1.skill <> WS2.skill AND (WS1.skill = 'Archery' OR WS1.skill = 'Swordsmanship' 
			OR WS2.skill = 'Archery' OR WS2.skill = 'Swordsmanship') OR (WS3.wid = WS1.wid AND (WS3.skill = 'Archery' 
			OR WS3.skill = 'Swordsmanship'))));


\qecho '5b: Using In, Not In'
SELECT W.wid
FROM Westerosi W
WHERE W.wid NOT IN
	(SELECT DISTINCT WS.wid 
	FROM WesterosiSkill WS, WesterosiSkill WS2, WesterosiSkill WS3
	WHERE WS.wid = WS2.wid AND WS.skill <> WS2.skill
	AND (WS.skill = 'Archery' OR WS.skill = 'Swordsmanship' OR WS2.skill = 'Archery' OR WS2.skill = 'Swordsmanship') OR (WS3.wid = 		WS.wid AND (WS3.skill = 'Archery' OR WS3.skill = 'Swordsmanship')));   


\qecho 'Problem 6'

/*
Find all pairs (h1,h2) of hnames of different houses such that h1 and h2
do not have any Westerosis belonging to the same wlocation.
*/

\qecho '6a: Using Exists, Not Exists'
SELECT DISTINCT O.hName, O2.hName
FROM OfHouse O, OfHouse O2
WHERE	O.wid <> O2.wid AND O.hName <> O2.hName 
	AND NOT EXISTS (SELECT DISTINCT O3.hName, O4.hName
		   FROM OfHouse O3, OfHouse O4, Westerosi W, Westerosi W2, HouseAllyRegion H, HouseAllyRegion H2
		   WHERE O3.hName = O.hName AND O4.hName = O2.hName AND O3.wid <> O4.wid
		   AND O3.wid = W.wid AND O4.wid = W2.wid AND W.wlocation = W2.wlocation 
		   AND W.wlocation = H.region AND W2.wlocation = H2.region)
ORDER BY O.hName;


\qecho '6b: Using In, Not In'
SELECT DISTINCT O.hName, O2.hName
FROM OfHouse O, OfHouse O2
WHERE O.wid <> O2.wid AND O.hName <> O2.hName AND (O.hName, O2.hName) NOT IN 
				   (SELECT DISTINCT O3.hName, O4.hName
				   FROM OfHouse O3, OfHouse O4, Westerosi W, Westerosi W2, HouseAllyRegion H, HouseAllyRegion H2
				   WHERE O3.hName = O.hName AND O4.hName = O2.hName AND O3.wid <> O4.wid 
				   AND O3.wid = W.wid AND O4.wid = W2.wid AND W.wlocation = H.region 
				   AND W2.wlocation = H2.region AND W.wlocation = W2.wlocation AND H.region = H2.region)
ORDER BY O.hName;


\qecho '6c: Using Except, Intersect'
--sorry for not ordering it, I kept trying to do order by but I tried placing the order by clause in the first except clause
--but it didn't work, and it also wouldn't work if I put it after the second exist clause outside the ()
(SELECT DISTINCT O.hName, O2.hName
FROM OfHouse O, OfHouse O2
WHERE O.wid <> O2.wid AND O.hName <> O2.hName)
EXCEPT
(SELECT DISTINCT O3.hName, O4.hName
FROM OfHouse O3, OfHouse O4, Westerosi W, Westerosi W2, HouseAllyRegion H, HouseAllyRegion H2
WHERE	O3.wid <> O4.wid 
	AND O3.wid = W.wid AND O4.wid = W2.wid AND W.wlocation = H.region 
	AND W2.wlocation = H2.region AND H.region = H2.region);

\qecho 'Problem 7'

/*
Find the (wid,hname) of all the westerosis who belong to a hname and
know at least 2 people belonging to the same house.
*/

\qecho '7a: Using Exists, Not Exists'
SELECT DISTINCT O.wid, O.hName
FROM OfHouse O
WHERE O.wid IN (SELECT DISTINCT K.wid1
		FROM Knows K, Knows K2, OfHouse Oh
		WHERE K.wid1 = K2.wid1 AND K.wid2 <> K2.wid2 AND Oh.wid = K.wid1
		AND EXISTS (SELECT * FROM OfHouse O1 WHERE O1.wid = K.wid2 AND O1.hName = Oh.hName)
		AND EXISTS (SELECT * FROM OfHouse O2 WHERE O2.wid = K2.wid2 AND O2.hName = Oh.hName));


		
\qecho '7b: Using In, Not In'
SELECT DISTINCT O.wid, O.hName
FROM OfHouse O
WHERE O.wid IN (SELECT DISTINCT K.wid1
		FROM Knows K, Knows K2, OfHouse O
		WHERE K.wid1 = K2.wid1 AND K.wid2 <> K2.wid2 AND K.wid1 = O.wid
		AND K.wid2 IN	(SELECT O1.wid FROM OfHouse O1 WHERE O1.hName = O.hName AND O1.wid = K.wid2)
		AND K2.wid2 IN	(SELECT O2.wid FROM OfHouse O2 WHERE O2.hName = O.hName AND O2.wid = K2.wid2));
		
\qecho '7c: Using Except, Intersect'
SELECT DISTINCT O.wid, O.hName
FROM OfHouse O
INTERSECT
(SELECT DISTINCT K.wid1, Oh.hName
		FROM Knows K, Knows K2, OfHouse Oh
		WHERE K.wid1 = K2.wid1 AND K.wid2 <> K2.wid2 AND K.wid1 = Oh.wid
		AND K.wid2 IN	(SELECT O1.wid FROM OfHouse O1 WHERE O1.hName = Oh.hName AND O1.wid = K.wid2)
		AND K2.wid2 IN	(SELECT O2.wid FROM OfHouse O2 WHERE O2.hName = Oh.hName AND O2.wid = K2.wid2));


\qecho 'Problem 8'

/*
Use a VIEW to return the pairs (wid, wname) of all Westerosis that earn
a wage strictly greater than their immediate predecessors.
*/

DROP VIEW Wage;

CREATE VIEW Wage AS
	SELECT DISTINCT P.succid
	FROM Predecessor P, OfHouse O, OfHouse O2
	WHERE P.predid = O.wid AND P.succid = O2.wid AND O2.wages <= O.wages;

SELECT DISTINCT W.wid, W.wName
FROM Westerosi W, Predecessor P2
WHERE W.wid = P2.succid AND P2.succid NOT IN (SELECT * FROM Wage);

\qecho 'Problem 9'

/*
Define a materialized view HouseLeader that, for each hname, returns the
wid of Westerosis known by atleast 1 Westerosi from the same region.
*/


CREATE MATERIALIZED VIEW HouseLeader AS
	SELECT K.wid2
	FROM Knows K, OfHouse O, OfHouse O2
	WHERE K.wid1 = O.wid AND K.wid2 = O2.wid AND O.hName = O2.hName
	ORDER BY K.wid2;
	
SELECT * FROM HouseLeader;
	
DROP MATERIALIZED VIEW HouseLeader;



\qecho 'Problem 10'

/*
Let LinkedList(node integer, nextNode integer) be a binary rela-
tion, where a pair (n, m) in LinkedList indicates that node n is succeeded
by node m. The SequentialOrder(node) unary relation is inductively
defined using the following two rules:

• If n is NULL, m is a node in SequentialOrder, and represents the
head of the LinkedList relation. (Base rule)
• If s is a node in SequentialOrder and (n, m) is a pair in LinkedList
such that s = n, it implies that m succeeds s in the order. If m is
NULL, n is the last node in LinkedList. (Inductive Rule)
Write a recursive view SequentialOrder(node) that starts at the head
and visits each node in LinkedList in sequential order. You may assume
each node in LinkedList is unique. Test your view with the data in the
a2data.sql file.

*/



-- Test 1
insert into LinkedList values (NULL,1),(1,2),(2,4), (4,8), (8,16),(16,NULL);



WITH RECURSIVE SequentialOrder(NODE) AS
	(SELECT L.NEXTNODE
	FROM LinkedList L
	WHERE L.NODE IS NULL
	UNION
	SELECT L2.NEXTNODE
	FROM LinkedList L2, LinkedList L3
	WHERE L2.NEXTNODE = L3.NODE OR (L2.NEXTNODE IS NOT NULL))
SELECT * FROM SequentialOrder;

-- Test 2
delete from linkedlist;
insert into linkedlist values (null,0), (0,3), (3,7), (7,5), (5,null);
WITH RECURSIVE SequentialOrder(NODE) AS
	(SELECT L.NEXTNODE
	FROM LinkedList L
	WHERE L.NODE IS NULL
	UNION
	SELECT L2.NEXTNODE
	FROM LinkedList L2, LinkedList L3
	WHERE L2.NEXTNODE = L3.NODE OR (L2.NEXTNODE IS NOT NULL))
SELECT * FROM SequentialOrder;

--DROP VIEW SequentialOrder;


-- Connect to default database
\c postgres;

-- Drop database created for this assignment
DROP DATABASE ArinahKarim;
