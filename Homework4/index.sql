-- Homework requirement 1/3
-- Calculate the count of all grades in the system
SELECT COUNT(grade) AS totalgrades FROM grade

-- Calculate the count of all grades per teacher in the system
SELECT firstname, COUNT(grade) FROM grade
INNER JOIN teacher
ON grade.teacherid= teacher.id
GROUP BY firstname
-- OR
SELECT teacherid, COUNT(grade) FROM grade
GROUP BY teacherid

-- Calculate the count of all grades per teacher in the system for first 100 students (id<100)
SELECT firstname, COUNT(grade) FROM grade
INNER JOIN teacher
ON grade.teacherid = teacher.id
WHERE studentid < 100
GROUP BY firstname


-- Find the maximal grade and the average grade per student on all grades in the system
SELECT firstname, MAX(grade), AVG(grade) FROM grade
INNER JOIN student
ON student.id = grade.studentid
GROUP BY firstname
--OR
SELECT studentid,MAX(grade), AVG(grade) FROM grade
GROUP BY studentid

-- Homework requirement 2/3
-- Calculate the count of all grades per teacher in the system and filter only grade count greater than 200
SELECT firstname, COUNT(grade) FROM grade
INNER JOIN teacher
ON grade.teacherid = teacher.id
GROUP BY firstname
HAVING COUNT(grade) > 2

-- Calculate the count of all grades per teacher in the system for first 100 students (id<100) and filter teachers with more than 50 grade count
SELECT firstname, COUNT(grade) FROM grade
INNER JOIN teacher
ON grade.teacherid = teacher.id
WHERE studentid < 20
GROUP BY firstname
HAVING COUNT(grade) > 1

-- Find the grade count, maximal grade and average grade per student on all grades in the system. Filter only records where maximal grade is equal to average grade
SELECT studentid, COUNT(grade), AVG(grade), MAX(grade) FROM grade
GROUP BY studentid
HAVING MAX(grade) = AVG(grade)

-- List student first name and last name next to the other details from previous query
SELECT firstname,lastname, COUNT(grade), AVG(grade), MAX(grade) FROM grade
INNER JOIN student
ON grade.studentid = student.id
GROUP BY firstname, lastname
HAVING MAX(grade) = AVG(grade)

-- Homework requirements 3/3
-- Create new view (vw_StudentGrades) that will list all studentids and count of grades pre student
CREATE VIEW vw_studentgrades AS 
SELECT studentid, COUNT(grade) FROM grade
GROUP BY studentid

SELECT * FROM vw_studentgrades

-- Change the view to show student first and last names instead of student id
DROP VIEW vw_studentgrades
CREATE OR REPLACE VIEW vw_studentgrades AS
SELECT firstname, lastname, COUNT(grade) FROM grade
INNER JOIN student
ON grade.studentid = student.id
GROUP BY firstname, lastname, studentid

-- List all rows from view ordered by biggest grade count
SELECT * FROM vw_studentgrades
ORDER BY count DESC


-- Create new view (vw_studentgradedetails) what will list all students (firstname, lastname) and count the courses he passed through the exam
CREATE VIEW vw_studentgradedetails AS
SELECT firstname, lastname, COUNT(courseid) FROM grade
INNER JOIN student
ON grade.studentid = student.id
GROUP BY firstname, lastname

SELECT * FROM vw_studentgradedetails

-- Homework requirement 1/3
-- Calculate (price + cost) / weight for all products
SELECT name, (price + cost) / weight AS product_price FROM product

-- Get a round number that is higher or equal for the costs and a round number that is lower or equal for the prices for all products
SELECT name, ceil(cost) AS heigherCost, floor(price) AS lowerPrice FROM product

-- Get all orders and generate a random number between 0 and 100 for every order
SELECT id, random() * 100 AS randomNumber FROM "Order"

-- Concatenate the name, region and zipcode from every businessentity and add the delimiter ';' between them
SELECT name || ';' || region || ';' || zipcode AS totalInformation FROM businessentity

-- Declare temp table that will contain lastname and hiredate columns. The hiredate column must not allow dates after 01.01.2010. Insert 5 rows of dummy data and display every row inserted
CREATE TEMPORARY TABLE tempTable(
	lastname varchar(50),
	hiredate date CHECK(hiredate < '2010.01.01' )
)

INSERT INTO tempTable(lastname, hiredate) VALUES('Doe', '2000.02.04')
INSERT INTO tempTable(lastname, hiredate) VALUES('Smith', '1992.01.02'), ('Johnson', '2007.10.12'), ('Nelson', '1999.03.06'), ('Camil', '2001.08.08')

SELECT * FROM tempTable

