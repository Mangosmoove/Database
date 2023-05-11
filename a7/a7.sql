-- Script for Assignment 6

-- Creating database with full name

CREATE DATABASE ArinahKarim;

-- Connecting to database 
\c arinahkarim

-- Relation schemas and instances for assignment 5

CREATE TABLE Person(pid integer,
                    pname text,
                    city text,
                    primary key (pid));

CREATE TABLE Company(cname text,
                     headquarter text,
                     primary key (cname));

CREATE TABLE Skill(skill text,
                   primary key (skill));


CREATE TABLE worksFor(pid integer,
                      cname text,
                      salary integer,
                      primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text,
                             city text,
                             primary key (cname, city),
                             foreign key (cname) references Company (cname));


CREATE TABLE personSkill(pid integer,
                         skill text,
                         primary key (pid, skill),
                         foreign key (pid) references Person (pid) on delete cascade,
                         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE Knows(pid1 integer,
                   pid2 integer,
                   primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));

CREATE TABLE Manages(mid integer,
		     eid integer,
		     primary key(mid, eid),
		     foreign key (mid) references Person(pid),
		     foreign key (eid) references Person(pid));


INSERT INTO Person VALUES
     (1001,'Jean','Cupertino'),
     (1002,'Vidya', 'Cupertino'),
     (1003,'Anna', 'Seattle'),
     (1004,'Qin', 'Seattle'),
     (1005,'Megan', 'MountainView'),
     (1006,'Ryan', 'Chicago'),
     (1007,'Danielle','LosGatos'),
     (1008,'Emma', 'Bloomington'),
     (1009,'Hasan', 'Bloomington'),
     (1010,'Linda', 'Chicago'),
     (1011,'Nick', 'MountainView'),
     (1012,'Eric', 'Cupertino'),
     (1013,'Lisa', 'Indianapolis'), 
     (1014,'Deepa', 'Bloomington'), 
     (1015,'Chris', 'Denver'),
     (1016,'YinYue', 'Chicago'),
     (1017,'Latha', 'LosGatos'),
     (1018,'Arif', 'Bloomington'),
     (1019,'John', 'NewYork');

INSERT INTO Company VALUES
     ('Apple', 'Cupertino'),
     ('Amazon', 'Seattle'),
     ('Google', 'MountainView'),
     ('Netflix', 'LosGatos'),
     ('Microsoft', 'Redmond'),
     ('IBM', 'NewYork'),
     ('ACM', 'NewYork'),
     ('Yahoo', 'Sunnyvale');


INSERT INTO worksFor VALUES
     (1001,'Apple', 65000),
     (1002,'Apple', 45000),
     (1003,'Amazon', 55000),
     (1004,'Amazon', 55000),
     (1005,'Google', 60000),
     (1006,'Amazon', 55000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 50000),
     (1013,'Yahoo', 55000),
     (1014,'Apple', 50000), 
     (1015,'Amazon', 60000),
     (1016,'Amazon', 55000),
     (1017,'Netflix', 60000),
     (1018,'Apple', 50000),
     (1019,'Microsoft', 50000);

INSERT INTO companyLocation VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington'),
   ('Apple', 'Cupertino'),
   ('Amazon', 'Seattle'),
   ('Google', 'MountainView'),
   ('Netflix', 'LosGatos'),
   ('Microsoft', 'Redmond'),
   ('IBM', 'NewYork'),
   ('Yahoo', 'Sunnyvale');

INSERT INTO Skill VALUES
   ('Programming'),
   ('AI'),
   ('Networks'),
   ('OperatingSystems'),
   ('Databases');

INSERT INTO personSkill VALUES
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1010,'Databases'),
 (1011,'Databases'),
 (1013,'Databases'),
 (1014,'Databases'),
 (1017,'Databases'),
 (1019,'Databases'),
 (1005,'Databases'),
 (1006,'AI'),
 (1009,'Databases');
 

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
 (1014,1012),
 (1010,1002),
 (1010,1012),
 (1010,1018);


INSERT INTO Manages VALUES
 (1005, 1011),
 (1001, 1009),
 (1009, 1014),
 (1009, 1018),
 (1009, 1012),
 (1014, 1002),
 (1015, 1016),
 (1015, 1010),
 (1015, 1003),
 (1015, 1006),
 (1015, 1004),
 (1006, 1008),
 (1017, 1007);

-- We define the following functions and predicates

/*
Functions:
set_union(A,B)               A union B
set_intersection(A,B)        A intersection B
set_difference(A,B)          A - B
add_element(x,A)             {x} union A
remove_element(x,A)          A - {x}
make_singleton(x)            {x}
choose_element(A)            choose some element from A
bag_union(A,B)               the bag union of A and B
bag_to_set(A)                coerce a bag A to the corresponding set

Predicates:
is_in(x,A)                   x in A
is_not_in(x,A)               not(x in A)
is_empty(A)                  A is the emptyset
is_not_emptyset(A)           A is not the emptyset
subset(A,B)                  A is a subset of B
superset(A,B)                A is a super set of B
equal(A,B)                   A and B have the same elements
overlap(A,B)                 A intersection B is not empty
disjoint(A,B)                A and B are disjoint 
*/

-- Set Operations: union, intersection, difference

-- Set union $A \cup B$:
create or replace function set_union(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) union select unnest(B) order by 1);
$$ language sql;

-- Set intersection $A\cap B$:
create or replace function set_intersection(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;

-- Set difference $A-B$:
create or replace function set_difference(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) except select unnest(B) order by 1);
$$ language sql;


-- Add element to set
create or replace function add_element(x anyelement, A anyarray) 
returns anyarray as
$$
   select bag_to_set(x || A);
$$ language sql;


-- Add element to set
create or replace function remove_element(x anyelement, A anyarray) 
returns anyarray as
$$
   select array_remove(A, x);
$$ language sql;


-- Make singleton  x --->  {x}

create or replace function make_singleton(x anyelement) 
returns anyarray as
$$
   select add_element(x,'{}');
$$ language sql;

create or replace function make_pair(x anyelement, y anyelement) 
returns anyarray as
$$
   select set_union(make_singleton(x),make_singleton(y));
$$ language sql;


-- Make triple   x, y, z  ---> {x,y,z}

create or replace function make_triple(x anyelement, y anyelement, z anyelement) 
returns anyarray as
$$
   select set_union(set_union(make_singleton(x),make_singleton(y)),make_singleton(z));
$$ language sql;

-- Choose some element from set A
create or replace function choose_element(A anyarray) 
returns anyelement as
$$
   select x 
   from (select UNNEST(A) as x) q
   order by random();
$$ language sql;


-- Bag operations

-- Bag union 
create or replace function bag_union(A anyarray, B anyarray) 
returns anyarray as
$$
   select A || B;
$$ language sql;

-- bag To set
create or replace function bag_to_set(A anyarray)
returns anyarray as
$$
   select array(select distinct unnest(A) order   by 1);
$$ language sql;


-- Set Predicates: set membership, set non membership, emptyset, subset, superset, overlap, disjoint

-- Set membership $x \in A$:
create or replace function is_in(x anyelement, A anyarray) 
returns boolean as
$$
   select x = SOME(A);
$$ language sql;

-- Set non membership $x \not\in A$:
create or replace function is_not_in(x anyelement, A anyarray) 
returns boolean as
$$
   select not(x = SOME(A));
$$ language sql;

-- emptyset test $A = \emptyset$:
create or replace function is_empty(A anyarray) 
returns boolean as
$$
   select A <@ '{}';
$$ language sql;


-- non emptyset test $A \neq \emptyset$:
create or replace function is_not_empty(A anyarray) 
returns boolean as
$$
   select not(A <@ '{}');
$$ language sql;

-- Subset test $A\subseteq B$:
create or replace function subset(A anyarray, B anyarray) 
returns boolean as
$$
   select A <@ B;
$$ language sql;

-- Superset test $A \supseteq B$:
create or replace function superset(A anyarray, B anyarray) 
returns boolean as
$$
   select A @> B;
$$ language sql;

-- Equality test $A = B$
create or replace function equal(A anyarray, B anyarray) 
returns boolean as
$$
   select A <@ B and A @> B;
$$ language sql;

-- Overlap test $A\cap B \neq \emptyset$:
create or replace function overlap(A anyarray, B anyarray) 
returns boolean as
$$
   select A && B;
$$ language sql;

-- Disjointness test $A\cap B = \emptyset$:
create or replace function disjoint(A anyarray, B anyarray) 
returns boolean as
$$
   select not A && B;
$$ language sql;


-- Set Operations: union, intersection, difference

-- Set union $A \cup B$:
create or replace function setunion(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) union select unnest(B) order by 1);
$$ language sql;

-- Set intersection $A\cap B$:
create or replace function setintersection(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;

-- Set difference $A-B$:
create or replace function setdifference(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) except select unnest(B) order by 1);
$$ language sql;


-- Set Predicates: set membership, subset, superset, overlap, disjoint

-- Set membership $x \in A$:
create or replace function isIn(x anyelement, A anyarray) 
returns boolean as
$$
   select x = SOME(A);
$$ language sql;

-- Subset test $A\subseteq B$:
create or replace function subset(A anyarray, B anyarray) 
returns boolean as
$$
   select A <@ B;
$$ language sql;

-- Superset test $A \supseteq B$:
create or replace function superset(A anyarray, B anyarray) 
returns boolean as
$$
   select A @> B;
$$ language sql;

-- Overlap test $A\cap B \neq \emptyset$:
create or replace function overlap(A anyarray, B anyarray) 
returns boolean as
$$
   select A && B;
$$ language sql;

-- Disjointness test $A\cap B = \emptyset$:
create or replace function disjoint(A anyarray, B anyarray) 
returns boolean as
$$
   select not A && B;
$$ language sql;

-- Complex-object views on the Person, Company, companyLocation,
-- worksFor, Skill, personSkill, and Knows database

-- Define the view {\tt companyHasEmployees(cname,employees)} which
-- associates with each company, identified by a cname, the set of
-- pids of persons who work for that company. 

create or replace view companyHasEmployees as
   select cname, array(select pid 
                       from   worksfor w
                       where  w.cname = c.cname order by 1) as employees
   from   company c order by 1;


-- Define a view {\tt cityHasCompanies(city,companies)} which associates
-- with each city the set of cnames of companies who are located in that
-- city. 

create or replace view cityHasCompanies as
   select city, array_agg(cname order by 1) as companies
   from   companyLocation 
   group by city order by 1;




-- Define a view {\tt companyLocations(cname,locations)} which associates
-- with each company, identified by a cname, the set of cities in which
-- that company is located.  

create or replace view companyHasLocations     as
   select cname, array(select city 
                       from   companyLocation cc
                       where  c.cname = cc.cname order by 1) as locations
   from   company c
   order by 1;



-- Define a view {\tt knowsPersons(pid,persons)} which associates with each
-- person, identified by a pid, the set of pids of persons he or she
-- knows.

create or replace view knowsPersons as
   select p.pid, array(select k.pid2 
                       from   knows k
                       where  k.pid1 = p.pid order by pid2) as persons
   from   person p
   order by 1;




-- The view {\tt isKnownByPersons(pid,persons)} which associates with
-- each person, identified by a pid, the set of pids of persons who know
-- that person.  Observe that there may be persons who are not known by
-- any one.

create or replace view isKnownByPersons as
   select distinct p.pid, array(select k.pid1 
                                from   knows k
                                where  k.pid2 = p.pid order by pid1) as persons
   from   person p
   order by 1;


-- Define a view {\tt personHasSkills(pid,skills)} which associates with
-- each person, identified by a pid, his or her set of job skills.
-- Observe that a person may not have any job skills.  (Test your view.)

create or replace view personHasSkills  as
   select distinct p.pid, array(select s.skill
                                from   personSkill s
                                where  s.pid = p.pid order by 1) as skills
   from   person p order by 1;





-- Define a view {\tt skillOfPersons(skills,persons)} which associates
-- with each job skill the set of pids of persons who have that job
-- skill.  Observe that there may be job skills that are not job skills
-- of any person.  (Test your view.)

create or replace view  skillOfPersons as
    select js.skill, array(select ps.pid
                           from   personSkill ps
                           where  ps.skill = js.skill order by 1) as persons
    from   Skill js order by 1;


-- Problem 1

\qecho 'Problem 5A COMPLETED' 

/*
SELECT p1.pid, p1.pname, p2.pid 
FROM Person p1, Person p2 
WHERE p1.city = 'Bloomington' 
AND p1.pid <> p2.pid 
AND p2.pid <> ALL (SELECT w.pid 
                  FROM worksfor w 
                  WHERE w.salary > 100000 
                  AND p1.pname = 'Eric'); 
*/

/*
SELECT p1.pid, p1.pname, p2.pid
FROM Person p1 JOIN Person p2 ON (p1.pid <> p2.pid)
WHERE (P1.city = 'Bloomington' AND p2.pid <> ALL(SELECT w.pid FROM worksFor w where w.salary > 100000 and p1.pname = 'Eric'));
*/



SELECT p1.pid, p1.pname, p2.pid
FROM Person p1 JOIN Person p2 ON (p1.pid <> p2.pid)
WHERE p1.city = 'Bloomington'
EXCEPT
SELECT p1.pid, p1.pname, p2.pid
FROM Person p1 JOIN Person P2 ON (p1.pname ='Eric') JOIN worksFor w ON (w.salary > 100000 AND NOT p2.pid = w.pid);


/*
WITH btown AS (SELECT pid, pname FROM Person WHERE city = 'Bloomington')
 SELECT b.pid, b.pname, p2.pid
 FROM btown b JOIN person p2 on (b.pid <> p2.pid)
 EXCEPT
 SELECT p1.pid, p1.pname, p2.pid
 FROM Person p1 JOIN Person p2 ON (p1.pname = 'Eric') JOIN worksFor w ON (w.salary > 100000 AND NOT p2.pid = w.pid);
*/

/*
WITH	btown	AS (SELECT pid, pname FROM Person where city = 'Bloomington'),
	w	AS (SELECT pid FROM worksFor WHERE salary > 100000)
SELECT b.pid, b.pname, p2.pid
 FROM btown b JOIN person p2 on (b.pid <> p2.pid)
 EXCEPT
 SELECT p1.pid, p1.pname, p2.pid
 FROM Person p1 JOIN Person p2 ON (p1.pname = 'Eric') JOIN W w ON (NOT p2.pid = w.pid);
*/ 

/*
WITH	btown	AS (SELECT pid, pname FROM Person where city = 'Bloomington' AND pname <> 'Eric'),
	w	AS (SELECT pid FROM worksFor WHERE salary > 100000)
SELECT b.pid, b.pname, p2.pid
 FROM btown b JOIN person p2 on (b.pid <> p2.pid)
 EXCEPT
 SELECT b.pid, b.pname, p2.pid
 FROM btown b NATURAL JOIN Person p2 JOIN W w ON (p2.pid <> w.pid);
*/

 
WITH	btown	AS (SELECT pid, pname FROM Person where city = 'Bloomington' AND pname <> 'Eric'),
	w	AS (SELECT pid FROM worksFor WHERE salary > 100000)
SELECT b.pid, b.pname, q.pid
FROM btown b JOIN (SELECT pid FROM person
		    EXCEPT
		    SELECT pid FROM W)q ON q.pid <> b.pid;		     
 
\qecho '5B COMPLETED'  

/*
SELECT m.mid 
FROM Manages m, worksFor w1, worksFor w2 
WHERE m.mid = w1.pid AND m.eid = w2.pid AND 
w1.salary < w2.salary AND w1.cname = 'Google';
*/


SELECT m.mid
FROM Manages m JOIN worksFor w1 ON (m.mid=w1.pid) JOIN worksfor w2 ON (m.eid = w2.pid)
WHERE w1.salary < w2.salary AND w1.cname = 'Google';


/*
SELECT m.mid
FROM Manages m JOIN (SELECT pid, salary FROM worksFor WHERE cname = 'Google')w1 ON m.mid = w1.pid JOIN worksFor w2 ON (m.eid = w2.pid)
WHERE w1.salary < w2.salary;
*/

/*
SELECT m.mid
FROM Manages m JOIN (SELECT pid, salary FROM worksFor WHERE cname = 'Google')w1 ON m.mid = w1.pid JOIN (SELECT pid, salary FROM worksFor)w2 ON (m.eid = w2.pid)
WHERE w1.salary < w2.salary;
*/

/*
SELECT m.mid
FROM manages m natural join (select pid as mid, salary FROM worksFor WHERE cname = 'Google')w1 JOIN (SELECT pid, salary FROM worksFor)w2 ON w2.pid = m.eid
WHERE w1.salary < w2.salary;
*/
/*
SELECT m.mid
FROM manages m natural join (select pid as mid, salary FROM worksFor WHERE cname = 'Google')w1 
	       NATURAL JOIN (SELECT pid as eid, salary FROM worksFor)w2
WHERE w1.salary < w2.salary;
*/


WITH w1 AS (select pid as mid, salary FROM worksFor where cname = 'Google'),
     w2 AS (select pid, salary from worksFor)
 SELECT m.mid
 FROM (manages m natural join w1) join w2 on m.eid = w2.pid
 WHERE w1.salary < w2.salary;

\qecho '7A COMPLETED'
--Find the pid of each person who has the most job skills (10 marks) 

WITH E AS (SELECT pid, CARDINALITY(skills) AS skillCount FROM personHasSkills)
SELECT pid
FROM E
WHERE skillCount = (SELECT MAX(skillCount) FROM E);


\qecho '7B COMPLETED'
-- Find,  for  each  person,  that  person’s  pid  and  name  along  with  the  number  of 
-- persons he or she manages. 


WITH managesWho AS (SELECT DISTINCT p.pid, array(SELECT m.eid FROM Manages m WHERE m.mid = p.pid order by 1) as manages 
		    FROM Person P order by 1)
SELECT p.pid, p.pname, CARDINALITY(m.manages) as number_managed
FROM Person p, managesWho m
WHERE p.pid = m.pid;


-- Connect to default database
\c postgres;
-- Drop database created for this assignment
DROP DATABASE ArinahKarim;
