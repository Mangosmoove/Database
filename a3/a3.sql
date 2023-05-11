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



\qecho 'Problem 1'
-- Develop appropriate insert and delete triggers that implement the primary
-- key and foreign key constraints that are specified for the Westerosi,
-- House, and ofHouse relations.
-- Your triggers should report appropriate error conditions. For this problem,
-- implement the triggers such that foreign key constraints are maintained
-- using the cascading delete semantics.
-- For a reference on cascading deletes associated with foreign keys mainte-
-- nance consult the PostgreSQL manual page
-- https://www.postgresql.orgdocs9.2ddl-constraints.html
-- Test your triggers using appropriate inserts and deletes.


\qecho '----Westerosi----'
--insertion
CREATE OR REPLACE FUNCTION pk_constraint_Westerosi() RETURNS TRIGGER AS
$$
BEGIN
 IF NEW.wid IN (SELECT wid FROM Westerosi) THEN
    RAISE EXCEPTION 'wid already exists in Westerosi relation';
 END IF;
 RETURN NEW;
END;
$$LANGUAGE 'plpgsql';

CREATE TRIGGER pk_constraint_Westerosi_trg
 BEFORE INSERT ON Westerosi
 FOR EACH ROW 
 EXECUTE PROCEDURE pk_constraint_Westerosi(); 

\qecho 'attempting insertion into Westerosi'
INSERT INTO Westerosi VALUES (1001, 'DavyJones', 'Highgarden');
INSERT INTO Westerosi VALUES (null, 'DavyJones', 'Highgarden');



--deletion
CREATE OR REPLACE FUNCTION delete_cascade_Westerosi() RETURNS TRIGGER AS
$$
BEGIN
 IF OLD.wid IN (SELECT wid FROM OfHouse) THEN
    DELETE FROM OfHouse O WHERE O.wid=OLD.wid;
 END IF;
 IF OLD.wid IN (SELECT predid FROM Predecessor) THEN
    DELETE FROM Predecessor P WHERE P.predid=OLD.wid;  
 END IF;
 IF OLD.wid IN (SELECT succid FROM Predecessor) THEN
    DELETE FROM Predecessor P WHERE P.succid=OLD.wid;  
 END IF;
 IF OLD.wid IN (SELECT wid1 FROM Knows) THEN
    DELETE FROM Knows K WHERE K.wid1=OLD.wid;  
 END IF;
 IF OLD.wid IN (SELECT wid2 FROM Knows) THEN
    DELETE FROM Knows K WHERE K.wid2=OLD.wid;  
 END IF;
 IF OLD.wid IN (SELECT wid FROM WesterosiSkill) THEN
    DELETE FROM WesterosiSkill WS WHERE WS.wid = OLD.wid;
 END IF;
 RETURN OLD;
END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER delete_cascade_fk_Westerosi_trg
 BEFORE DELETE ON Westerosi 
 FOR EACH ROW
 EXECUTE PROCEDURE delete_cascade_Westerosi();
 
 
\qecho 'attempting deletion from Westerosi' 
DELETE FROM Westerosi WHERE wid=1001;

\qecho 'inserting values back for wid=1001 for future usage'
INSERT INTO Westerosi VALUES (1001,'JonSnow','CastleBlack');
INSERT INTO OfHouse VALUES (1001,'NightsWatch', 65000);
INSERT INTO Predecessor VALUES 
 (1012, 1001),
 (1018, 1001);
INSERT INTO Knows VALUES
 (1001,1012),
 (1001,1014),
 (1001,1008),
 (1008,1001),
 (1001,1019),
 (1019,1001),
 (1002,1001),
 (1009,1001);
INSERT INTO WesterosiSkill VALUES
 (1001,'Archery'),
 (1001,'Politics'); 
 


\qecho '----House----'
--insertion
CREATE OR REPLACE FUNCTION pk_constraint_House() RETURNS TRIGGER AS
$$
BEGIN
 IF NEW.hName IN (SELECT hName FROM House) THEN
    RAISE EXCEPTION 'house name already exists in House relation';
 END IF;
 RETURN NEW;
END;
$$LANGUAGE 'plpgsql';

CREATE TRIGGER pk_constraint_House_trg
 BEFORE INSERT ON House
 FOR EACH ROW 
 EXECUTE PROCEDURE pk_constraint_House(); 

\qecho 'attempting insertion of houses'
INSERT INTO House VALUES ('Baratheon', 'Highgarden');
INSERT INTO House VALUES (null, 'Highgarden');
\qecho 'inserting new house name'
INSERT INTO House VALUES ('Luddy', 'Woodlawn');
SELECT hName FROM House;
DELETE FROM House WHERE hName = 'Luddy';
SELECT hName FROM House;

--deletion
CREATE OR REPLACE FUNCTION delete_cascade_fk_House() RETURNS TRIGGER AS
$$
BEGIN
 IF OLD.hName IN (SELECT hName FROM HouseAllyRegion) THEN
    DELETE FROM HouseAllyRegion H WHERE H.hName=OLD.hName;
 END IF;
 IF OLD.hName IN (SELECT hName FROM OfHouse) THEN
    DELETE FROM OfHouse O WHERE O.hName = OLD.hName;  
 END IF;
 RETURN OLD;
END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER delete_cascade_fk_House_trg
 BEFORE DELETE ON House 
 FOR EACH ROW
 EXECUTE PROCEDURE delete_cascade_fk_House();
 
 
\qecho 'Deleting house Baratheon' 
DELETE FROM HOUSE WHERE hName='Baratheon';

\qecho 'Deleting house Baratheon again since it should delete nothing'
DELETE FROM HOUSE WHERE hName='Baratheon';

\qecho 'Inserting values back for house Baratheon'
INSERT INTO House VALUES ('Baratheon', 'KingsLanding');
INSERT INTO OfHouse VALUES
 (1006,'Baratheon', 55000),
 (1007,'Baratheon', 50000),
 (1010,'Baratheon', 55000);
INSERT INTO HouseAllyRegion VALUES
 ('Baratheon', 'BlackwaterBay'),
 ('Baratheon', 'Vale'),
 ('Baratheon', 'IronIslands'),
 ('Baratheon', 'KingsLanding');
 
 

\qecho '----OfHouse----'
--insertion
CREATE OR REPLACE FUNCTION fk_constraint_OfHouse() RETURNS TRIGGER AS
$$
BEGIN
 IF NEW.hName NOT IN (SELECT hName FROM House H) THEN
    RAISE EXCEPTION 'house name does not exist in House relation, error inserting.';
 END IF;
 IF NEW.wid IN (SELECT wid FROM OfHouse) THEN
    RAISE EXCEPTION 'wid already exists in OfHouse relation';
 END IF;
 IF NEW.wid NOT IN (SELECT wid FROM Westerosi) THEN
    RAISE EXCEPTION 'wid does not exist';
 END IF;
 RETURN NEW;
END;
$$LANGUAGE 'plpgsql';

CREATE TRIGGER fk_constraint_ofHouse_trg
 BEFORE INSERT ON OfHouse
 FOR EACH ROW 
 EXECUTE PROCEDURE fk_constraint_OfHouse(); 

\qecho 'attempting insertion of invalid house name'
INSERT INTO OfHouse VALUES (1001, 'Greg', 50000);
\qecho 'attempting insertion of invalid house name and wid'
INSERT INTO OfHouse VALUES (001, 'Beep', 60000); 

--deletion

CREATE OR REPLACE FUNCTION delete_cascade_fk_Hconstraint_OfHouse() RETURNS TRIGGER AS
$$
BEGIN
 IF OLD.hName NOT IN (SELECT hName FROM OfHouse) THEN
    RAISE EXCEPTION 'house name not in OfHouse relation';
 END IF;
 IF OLD.hName NOT IN (SELECT hName FROM House) THEN
    RAISE EXCEPTION 'house name not in House relation';
 END IF;
 RETURN OLD;
END;
$$LANGUAGE 'plpgsql';


CREATE TRIGGER delete_cascade_fk_Hconstraint_OfHouse_trg
 BEFORE DELETE ON OfHouse 
 FOR EACH ROW
 EXECUTE PROCEDURE delete_cascade_fk_Hconstraint_OfHouse();


SELECT wid FROM OfHouse WHERE hName = 'Baratheon';
\qecho 'Deleting Baratheon house'
DELETE FROM OfHouse WHERE hName='Baratheon'; 
SELECT wid FROM OfHouse WHERE hName = 'Baratheon';

\qecho 'replacing wid from house Baratheon'
INSERT INTO OfHouse VALUES
 (1006,'Baratheon', 55000),
 (1007,'Baratheon', 50000),
 (1010,'Baratheon', 55000);

CREATE OR REPLACE FUNCTION delete_cascade_fk_Wconstraint_OfHouse() RETURNS TRIGGER AS
$$
BEGIN
 IF OLD.wid NOT IN (SELECT wid FROM OfHouse) THEN
    RAISE EXCEPTION 'wid not in OfHouse relation';
 END IF;
 IF OLD.wid NOT IN (SELECT wid FROM Westerosi) THEN
    RAISE EXCEPTION 'wid not in Westerosi relation';
 END IF;
 RETURN OLD;
END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER delete_cascade_fk_Wconstraint_OfHouse_trg
 BEFORE DELETE ON OfHouse 
 FOR EACH ROW
 EXECUTE PROCEDURE delete_cascade_fk_Wconstraint_OfHouse();

 
\qecho 'attempting to delete a wid(1020) not in OfHouse'
DELETE FROM OfHouse WHERE wid=1020;


\qecho 'attempting to delete a wid(0001) not in Westerosi'
DELETE FROM OfHouse WHERE wid=0001;


\qecho 'deleting a tuple from OfHouse'
DELETE FROM OfHouse WHERE wid=1002;


\qecho 'inserting back values into OfHouse'
INSERT INTO OfHouse VALUES(1002,'Targaryen', 45000);
SELECT hName FROM OfHouse WHERE wid=1008;
\qecho 'getting rid of wid(1008)'
DELETE FROM OfHouse WHERE wid=1008;
SELECT hName FROM OfHouse WHERE wid=1008;

\qecho 'replacing values'
INSERT INTO OfHouse VALUES(1008,'Stark', 50000);


DROP TRIGGER pk_constraint_Westerosi_trg ON Westerosi;
DROP TRIGGER delete_cascade_fk_Westerosi_trg ON Westerosi;
DROP TRIGGER pk_constraint_House_trg on House;
DROP TRIGGER delete_cascade_fk_House_trg ON House;
DROP TRIGGER fk_constraint_ofHouse_trg ON OfHouse;
DROP TRIGGER delete_cascade_fk_Wconstraint_OfHouse_trg ON OfHouse;
DROP TRIGGER delete_cascade_fk_Hconstraint_OfHouse_trg ON OfHouse;


\qecho 'Problem 2'
-- Consider two relations R(A:integer,B:integer) and S(B:integer) and a view
-- with the following definition:
-- select distinct r.A
-- from R r, S s
-- where r.A > 10 and r.B = s.B;
-- Suppose we want to maintain this view as a materialized view called
-- V(A:integer) upon the insertion of tuples in R and in S. (You do not
-- have to consider deletions in this question.) Define SQL insert triggers
-- and their associated trigger functions on the relations R and S that imple-
-- ment this materialized view. Write your trigger functions in the language
-- ‘plpgsql.’ Make sure that your trigger functions act in an incremental way
-- and that no duplicates appear in the materialized view.


CREATE TABLE R(A integer, B integer);
CREATE TABLE S(B integer);

INSERT INTO R VALUES 
 (10, 1),
 (21, 3),
 (54, 7),
 (68, 2);

INSERT INTO S VALUES
 (5),
 (3),
 (1),
 (2);


CREATE MATERIALIZED VIEW V AS
 SELECT DISTINCT r.A
 FROM R r, S s
 WHERE r.A > 10 AND r.B = s.B; 

--SELECT * FROM V;
CREATE OR REPLACE FUNCTION update_mView() RETURNS TRIGGER AS
$$
BEGIN
 REFRESH MATERIALIZED VIEW V;
RETURN NULL;
END;
$$LANGUAGE 'plpgsql';

CREATE TRIGGER updateR_mView_trg
 AFTER INSERT ON R
 FOR EACH ROW
 EXECUTE PROCEDURE update_mView();

CREATE TRIGGER updateS_mView_trg
 AFTER INSERT ON S
 FOR EACH ROW
 EXECUTE PROCEDURE update_mView();

\qecho 'before inserting into R'
Table R;
--Table S;
SELECT * FROM V;

\qecho 'inserting into R (40,5)'
INSERT INTO R VALUES(40, 5);
TABLE R;
SELECT * FROM V;

\qecho 'inserting into S(7) which exists in A'
INSERT INTO S VALUES(7);
TABLE S;
SELECT * FROM V;

DROP TRIGGER updateR_mView_trg ON R; 
DROP TRIGGER updateS_mView_trg ON S;

\qecho 'Problem 3'
-- Consider the following on the WesterosiSkill relation. ”Each skill of a Wes-
-- terosi who belongs to house Lannister must also be a skill of a Westerosi
-- who belongs to the house NightsWatch.”
-- Write a trigger that maintains this constraint when inserting pairs (wid, skill)
-- into the WesterosiSkill table.

CREATE VIEW NightsWatch AS
 SELECT O.wid, WS.skill
 FROM OfHouse O, WesterosiSkill WS
 WHERE O.wid = WS.wid AND O.hname = 'NightsWatch';
--1001, 1012, 1014, 1018

CREATE VIEW Lannister AS
 SELECT O.wid
 FROM OfHouse O, WesterosiSkill WS
 WHERE O.wid = WS.wid AND O.hname = 'Lannister';

--SELECT * FROM NightsWatch;

CREATE OR REPLACE FUNCTION insertSkill() RETURNS TRIGGER AS
$$
BEGIN
 IF ((NEW.wid, NEW.skill) NOT IN (SELECT wid, skill FROM WesterosiSkill)) AND (NEW.wid IN (SELECT wid FROM Lannister)) THEN
       INSERT INTO WesterosiSkill(wid, skill) 
       SELECT N.wid, NEW.skill 
       FROM NightsWatch N, WesterosiSkill WS
       WHERE WS.wid IN (N.wid) AND WS.skill <> NEW.skill AND WS.skill <> N.skill;
 END IF;  
 RETURN NEW;
END;
$$LANGUAGE 'plpgsql';


CREATE TRIGGER insertSkill_trg
 AFTER INSERT ON WesterosiSkill
 FOR EACH ROW
 EXECUTE PROCEDURE insertSkill();


SELECT COUNT(*) FROM WesterosiSkill;
INSERT INTO WesterosiSkill VALUES(1004, 'Swordsmanship');
SELECT COUNT(*) FROM WesterosiSkill;


DROP TRIGGER insertSkill_trg ON WesterosiSkill;
DROP FUNCTION insertSkill;
DROP VIEW NightsWatch;
DROP VIEW Lannister;


\qecho 'deleting values'
DELETE FROM WesterosiSkill WHERE wid = 1004 AND skill = 'Swordsmanship';

\qecho 'Problem 4'
-- Consider the view WesterosiHasSkills(wid ,skills) which associates with each Westerosi, identified by a wid, his or her set of skills.
-- \begin{verbatim}
--     Create view WesterosiHasSkills as 
--             select distinct W.wid from 
--             Westerosi W, WesterosiSkill WS
--             where W.wid = WS.wid 
--             order by 1;
-- \end{verbatim}

--  Write a trigger that will delete all the skill records from
--  $WesterosiSkill$ relation when a Westerosi entry(wid) is deleted 
--  from the above $WesterosiHasSkills$ view. Show appropriate delete statements.


CREATE VIEW WesterosiHasSkills AS
 SELECT DISTINCT W.wid FROM
 Westerosi W, WesterosiSkill WS
 WHERE W.wid = WS.wid
 ORDER BY 1;

\qecho 'before deleting a wid(1002) from view'
SELECT * FROM WesterosiHasSkills;
SELECT skill FROM WesterosiSkill WHERE wid=1002;


CREATE OR REPLACE FUNCTION delWS() RETURNS TRIGGER AS
$$
BEGIN
 IF OLD.wid IN (SELECT wid FROM WesterosiHasSkills) THEN
   DELETE FROM WesterosiSkill WS WHERE OLD.wid = WS.wid;
 END IF;
RETURN OLD;
END;
$$LANGUAGE 'plpgsql';



CREATE TRIGGER delWS_trg
 INSTEAD OF DELETE ON WesterosiHasSkills
 FOR EACH ROW
 EXECUTE PROCEDURE delWS();

\qecho 'attempting deletion for wid=1002'
DELETE FROM WesterosiHasSkills WHERE wid=1002;
SELECT * FROM WesterosiHasSkills;
SELECT skill FROM WesterosiSkill WHERE wid=1002;


DROP TRIGGER delWS_trg on WesterosiHasSkills;
DROP FUNCTION delWS;
DROP VIEW WesterosiHasSkills;


\qecho 'inserting skills back in for future problems'
INSERT INTO WesterosiSkill VALUES
 (1002, 'Archery'),
 (1002, 'Politics');

SELECT skill FROM WesterosiSkill WHERE wid=1002;



\qecho 'Problem 5'
-- Find the hname of each house who only has Westerosis currently stationed
-- in ‘Winterfell’ or ‘CastleBlack’ locations.
-- using ONLY template

CREATE OR REPLACE FUNCTION HouseLocations(house TEXT) RETURNS TABLE (wid INT) AS
$$
SELECT DISTINCT W.wid
FROM   OfHouse O, Westerosi W
WHERE  O.wid = W.wid AND O.hName = HouseLocations.house
$$LANGUAGE SQL;


CREATE VIEW WinterBlack AS
SELECT DISTINCT W.wid
FROM   Westerosi W
WHERE  W.wlocation = 'CastleBlack' OR W.wlocation = 'Winterfell';

SELECT DISTINCT O.hname
FROM   OfHouse O
WHERE  NOT EXISTS (SELECT DISTINCT wid
                   FROM   HouseLocations(O.hName)
                     EXCEPT
                   SELECT DISTINCT wid
                   FROM   WinterBlack);
                   
DROP VIEW WinterBlack;
DROP FUNCTION HouseLocations;

\qecho 'Problem 6'
/*
Find the wid of each Westerosi who knows all Westerosis who belongs to ‘Lannister’ house and makes wages that is equal to 55000.
using ALL template
*/
CREATE VIEW Lannister AS
 (SELECT DISTINCT O.wid AS wid
 FROM	 OfHouse O
 WHERE	 O.hName = 'Lannister' AND O.wages = 55000);

CREATE OR REPLACE FUNCTION whoYaKnow (wid INT) RETURNS TABLE (wid INT) AS
$$
SELECT DISTINCT K.wid2
FROM	Knows K
WHERE	K.wid1 = whoYaKnow.wid
$$LANGUAGE SQL;

SELECT DISTINCT K.wid1
FROM   Knows K
WHERE  NOT EXISTS (SELECT wid
                   FROM   Lannister
                    EXCEPT
                   SELECT wid
                   FROM   whoYaKnow(K.wid1));

DROP VIEW Lannister;



\qecho 'Problem 7'

/*
Find the pairs (s1, s2) of different Successors(Westerosis) such that some Predecessors of Successor1 are Predecessors of Successor2.
*/

--using SOME PAIR template

CREATE OR REPLACE FUNCTION whoUrSuccessor(predid INT) RETURNS TABLE (succid INT) AS
$$
SELECT DISTINCT P.succid
FROM Predecessor P
WHERE P.predid = whoUrSuccessor.predid
$$LANGUAGE SQL;


SELECT	DISTINCT P.succid as S1, P2.succid as S2
FROM	Predecessor P, Predecessor P2
WHERE 	P.predid = P2.predid AND P2.succid <> P.succid AND 
	EXISTS (SELECT succid
		FROM	whoUrSuccessor(P.predid)
		INTERSECT
		SELECT DISTINCT P3.succid
		FROM	Predecessor P3 
		WHERE	P3.predid = P2.predid AND P.succid <> P3.succid
		ORDER BY 1);

DROP FUNCTION whoUrSuccessor;


\qecho 'Problem 8'
--Find the hname of each house that not only has Westerosis with ‘Politics’ in their skills set.
--using NOT ONLY template

CREATE VIEW Politics AS
SELECT S.wid
FROM WesterosiSkill S
WHERE S.skill = 'Politics';


SELECT DISTINCT O.hName
FROM OfHouse O
WHERE EXISTS	(SELECT S.wid
		FROM WesterosiSkill S
		WHERE S.wid = O.wid
		EXCEPT
		SELECT wid
		FROM Politics); 

DROP VIEW Politics;



\qecho 'Problem 9'
/*
Find the pairs (wid1, wid2) of different Westerosis such that Westerosi with wid1 and the Westerosi with wid2 knows same number of Westerosis.
using SOME PAIR template
*/

CREATE OR REPLACE FUNCTION numberOfPplKnown(wid INT) RETURNS INT AS
$$
SELECT DISTINCT COUNT(K.wid2)
FROM Knows K
WHERE K.wid1 = numberOfPplKnown.wid
$$LANGUAGE SQL;

--SELECT * FROM numberOfPplKnown(1004);

SELECT	DISTINCT K.wid1 as wid1, K2.wid1 as wid2
FROM	Knows K, Knows K2
WHERE	K.wid1 <> K2.wid1 and K.wid2 <> K2.wid2 AND 
	EXISTS	(SELECT numberOfPplKnown 
		FROM numberOfPplKnown(K.wid1)
		INTERSECT
		SELECT numberOfPplKnown 
		FROM numberOfPplKnown(K2.wid1))
ORDER BY K.wid1;


DROP FUNCTION numberOfPplKnown;



\qecho 'Problem 10'
/*
Find the hname of each house that has strictly 2 Westerosis with minimum wages at that house and who know at least 3 Westerosis.
*/

CREATE VIEW atLeast3 AS
 SELECT DISTINCT K.wid1, COUNT(K.wid2)
 FROM	Knows K, OfHouse O
 WHERE	K.wid1 = O.wid
 GROUP BY K.wid1
 HAVING COUNT(K.wid2) >= 3
 ORDER BY K.wid1;


--helper function that returns number of people in house w/ minimum wage for that house
CREATE OR REPLACE FUNCTION getMinWageCo(house TEXT) RETURNS INT AS
$$
SELECT	COUNT(*)
FROM	(SELECT MIN(Oh.wages) FROM OfHouse Oh WHERE Oh.hName = getMinWageCo.house)O
$$LANGUAGE SQL;


--helper function that'll return the min wage per house
CREATE VIEW MinWagePerHouse AS
 SELECT O.hname, Min(O.wages) AS minwage
 FROM	OfHouse O
 GROUP BY(O.hName);


--driver function returns a list of wids that have the min wage for that house
CREATE OR REPLACE FUNCTION getWids(house TEXT) RETURNS TABLE(wid INT) AS
$$
SELECT	O.wid 
FROM	MinWagePerHouse M, OfHouse O 
WHERE	O.hname = M.hname AND M.hname = getWids.house AND O.wages = M.minwage
$$LANGUAGE SQL;
	

--using all template
SELECT	DISTINCT O.hName
FROM	OfHouse O
WHERE	(SELECT COUNT(1)
	 FROM	(SELECT wid
		FROM	getWids(O.hName)
	 	EXCEPT
	 	SELECT wid
	 	FROM	atLeast3)c)=2;
		

DROP FUNCTION getWids;
DROP FUNCTION getMinWageCo;
DROP VIEW atLeast3;
DROP VIEW MinWagePerHouse;

-- Connect to default database
\c postgres;

-- Drop database created for this assignment
DROP DATABASE ArinahKarim;
