CREATE TABLE student(
	id integer PRIMARY KEY NOT NULL,
	firstname varchar(20),
	lastname varchar(20),
	dateOfBirth date,
	enrolledDate date,
	gender varchar(10),
	nationalIdNumber integer NOT NULL,
	studentCardNumber integer NOT NULL
	
)

SELECT * FROM student

CREATE TABLE teacher(
 id integer PRIMARY KEY NOT NULL,
	firstname varchar(20),
	lastname varchar(30),
	dateOfBirth date,
	academicRank varchar(20),
	hireDate date
)

SELECT * FROM teacher

CREATE TABLE gradeDetails(
	id integer PRIMARY KEY NOT NULL,
	gradeId integer,
	achievementTypeId integer,
	achievementMacPoints integer,
	achievementDate integer
)

SELECT * FROM gradedetails

CREATE TABLE course(
	id integer PRIMARY KEY NOT NULL,
	name varchar(30),
	credit integer,
	academicYear varchar(100),
	semester varchar(100)
)

SELECT * FROM course

CREATE TABLE Grade(
	id integer PRIMARY KEY NOT NULL,
	studentId integer,
	courseId integer,
	teacherId integer,
	grade smallint,
	comment varchar(100),
	createdDate date
)
SELECT * FROM grade

CREATE TABLE AchievementType (
	id integer PRIMARY KEY NOT NULL,
	name varchar(100),
	description varchar(100),
	participationRate NUMERIC(5,2)
)

SELECT * FROM achievementtype

