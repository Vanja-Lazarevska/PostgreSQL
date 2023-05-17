CREATE TABLE Student (
	id INTEGER PRIMARY KEY,
	FirstName VARCHAR NOT NULL,
	LastName VARCHAR NOT NULL,
	DateOfBirth DATE,
	EnrolledDate DATE,
	Gender VARCHAR,
	NationalIDNumber VARCHAR,
	StudentCardNumber INTEGER 
);

SELECT * FROM student;

CREATE TABLE teacher (
	id INTEGER PRIMARY KEY,
	firstname VARCHAR(20) NOT NULL,
	lastname VARCHAR(20) NOT NULL,
	dateofbirth DATE NOT NULL,
	academicrank VARCHAR(20) NOT NULL,
	hiredate DATE NOT NULL
);

SELECT * FROM teacher;

CREATE TABLE gradedetails (
	id INTEGER PRIMARY KEY,
	gradeid INTEGER,
	achievementtypeid INTEGER,
	achievementpoints INTEGER,
	achievementmaxpoints INTEGER,
	achievementdate DATE
);

SELECT * FROM gradedetails;

CREATE TABLE course (
	id INTEGER PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	credit SMALLINT NOT NULL,
	academicyear VARCHAR(10),
	semester VARCHAR(10)
);

SELECT * FROM course;

CREATE TABLE grade (
	id INTEGER PRIMARY KEY,
	studentid INTEGER NOT NULL,
	courseid INTEGER NOT NULL,
	teacherid INTEGER NOT NULL,
	grade SMALLINT NOT NULL,
	comment VARCHAR(100) NOT NULL,
	createddate DATE NOT NULL
);

SELECT * FROM grade;

CREATE TABLE achievementtype (
	id INTEGER PRIMARY KEY, 
	name VARCHAR(20) NOT NULL,
	description VARCHAR(100) NOT NULL,
	participationrate MONEY
);

SELECT * FROM achievementtype;