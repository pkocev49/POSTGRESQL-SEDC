-- Homework 3

-- Homework requirement 1/3

-- Pre-requisites: database from Homework 1 with some dummy data inserted

 
SELECT * FROM achievementtype  
SELECT * FROM grade
SELECT * FROM student
SELECT * FROM teacher

ALTER TABLE grade
ADD CONSTRAINT grade_teacher_id_fkey FOREIGN KEY(teacherid) REFERENCES teacher(id)

ALTER TABLE grade
ADD CONSTRAINT grade_student_id_fkey FOREIGN KEY(studentid) REFERENCES student(id)

ALTER TABLE grade
ADD CONSTRAINT grade_course_id_fkey FOREIGN KEY(courseid) REFERENCES course(id)

ALTER TABLE gradedetails 
ADD CONSTRAINT gradedetails_achievementtype_id_fkey FOREIGN KEY(achievementtypeid) REFERENCES achievementtype(id)

ALTER TABLE gradedetails 
ADD CONSTRAINT gradedetails_grade_id_fkey FOREIGN KEY(gradeid) REFERENCES grade(id)

-- Calculate the count of all grades in the system
SELECT COUNT(grade) AS grade_count FROM  grade
  
-- Calculate the count of all grades per Teacher in the system

SELECT t.firstname, COUNT(g.grade) as totalgrade
FROM teacher as t
	INNER JOIN grade as g ON t.id = g.teacherid
GROUP BY t.firstname

-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT t.firstname as teacherName,
COUNT(g.grade) as totalGrades
FROM teacher as t
INNER JOIN grade AS g ON g.teacherid = t.id
INNER JOIN student AS s on s.id = g.studentid
WHERE s.id < 100
GROUP BY teacherName
  
-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system
  
SELECT g.studentid,
	max(g.grade),
	avg(g.grade)
FROM grade as g
GROUP BY g.studentid

-- Homework requirement 2/3

-- Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT g.teacherid, COUNT(g.grade) AS totalGrades
FROM grade  AS g
GROUP BY teacherid
HAVING COUNT(g.grade) > 200


  
-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count
SELECT t.firstname as teacherName,
COUNT(g.grade) as totalGrades
FROM teacher as t
INNER JOIN grade AS g ON g.teacherid = t.id
INNER JOIN student AS s on s.id = g.studentid
WHERE s.id < 100
GROUP BY teacherName
HAVING COUNT(g.grade) > 50



-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade

SELECT g.studentid,
	count(g.grade),
	max(g.grade),
	avg(g.grade)
FROM grade as g
GROUP BY g.studentid
HAVING max(g.grade) = avg(g.grade)

-- List Student First Name and Last Name next to the other details from previous query

SELECT s.firstname,s.lastname,
	count(g.grade),
	max(g.grade),
	avg(g.grade)
FROM student as s
INNER JOIN grade as g ON studentid=s.id
GROUP BY s.firstname,s.lastname
HAVING max(g.grade) = avg(g.grade)

