create database school;
use school;

CREATE TABLE students (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(50),
  course_id INT
);

INSERT INTO students (student_id, student_name, course_id) VALUES
(1, 'Arun', 101),
(2, 'Banu', 102),
(3, 'Chitra', 103),
(4, 'Dinesh', NULL),
(5, 'Esha', 105);

CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(50)
);

INSERT INTO courses (course_id, course_name) VALUES
(101, 'Python'),
(102, 'SQL'),
(103, 'Power BI'),
(104, 'Excel'),
(106, 'Tableau');

--INNER JOIN--

--1.List all students along with their course names (only for students who are enrolled in valid courses)--
--2.Find the names of students and their courses where the course name starts with the letter 'P'--
--3.Display the student ID, student name, and course name for all students enrolled in SQL--
--4.Retrieve the list of students along with their course names and course IDs, but only for 
    courses that exist in the courses table--
--5.Find the student names and course names for all students whose student ID is greater than 2--
--6.Display student names and course names for courses whose name contains the letter 'a'--

--1.List all students along with their course names (only for students who are enrolled in valid courses)--

SELECT S.STUDENT_ID,S.STUDENT_NAME,S.COURSE_ID,C.COURSE_NAME FROM STUDENTS S
JOIN COURSES C ON S.COURSE_ID = C.COURSE_ID;

--2.Find the names of students and their courses where the course name starts with the letter 'P'--

SELECT S.STUDENT_NAME,C.COURSE_NAME FROM STUDENTS S
JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID
WHERE C.COURSE_NAME LIKE 'P%';

--3.Display the student ID, student name, and course name for all students enrolled in SQL--

SELECT S.STUDENT_ID,S.STUDENT_NAME,C.COURSE_NAME FROM STUDENTS S
JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID;

--4.Retrieve the list of students along with their course names and course IDs, but only for 
    courses that exist in the courses table--
    
SELECT S.STUDENT_NAME,C.COURSE_NAME,C.COURSE_ID FROM STUDENTS S
JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID; 

--5.Find the student names and course names for all students whose student ID is greater than 2--

SELECT S.STUDENT_NAME,S.STUDENT_ID,C.COURSE_NAME FROM COURSES C
JOIN STUDENTS S ON C.COURSE_ID = S.COURSE_ID
WHERE S.STUDENT_ID > 2; 

--6.Display student names and course names for courses whose name contains the letter 'a'--

SELECT S.STUDENT_NAME,C.COURSE_NAME FROM STUDENTS S
JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID
WHERE C.COURSE_NAME LIKE '%a%';

--RIGHT JOIN Practice Questions--

--1.Display all courses along with the students enrolled in them (show NULL if no student is enrolled)--
--2.Find the list of courses whose names contain the letter 'a', along with the students enrolled (if any)--
--3.Show all course IDs and course names, and the corresponding student names, 
    but include courses even if they have no students--
--4.Retrieve all courses and students, but only display those courses that have no students enrolled--
--5.List all courses and the total number of students enrolled in each (use COUNT with RIGHT JOIN)--
--6.Display all students and course names, but if a student is not enrolled in a valid course, 
    show them as NULL (focus on highlighting unmatched students using RIGHT JOIN)--
    
-1.Display all courses along with the students enrolled in them (show NULL if no student is enrolled)--

SELECT C.COURSE_NAME,S.STUDENT_ID,C.COURSE_ID FROM STUDENTS S
RIGHT JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID
WHERE S.STUDENT_ID IS NULL;

--2.Find the list of courses whose names contain the letter 'a', along with the students enrolled (if any)--

SELECT COURSE_NAME,STUDENT_ID FROM STUDENTS S
RIGHT JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID
WHERE COURSE_NAME LIKE '%A%';

--3.Show all course IDs and course names, and the corresponding student names, 
    but include courses even if they have no students--
    
SELECT C.COURSE_ID,C.COURSE_NAME,S.STUDENT_NAME FROM STUDENTS S
RIGHT JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID
WHERE S.STUDENT_NAME IS NULL;   

--4.Retrieve all courses and students, but only display those courses that have no students enrolled--

SELECT S.STUDENT_ID,S.STUDENT_NAME,S.COURSE_ID,C.COURSE_ID,C.COURSE_NAME FROM STUDENTS S
RIGHT JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID
WHERE S.STUDENT_ID IS NULL;

--5.List all courses and the total number of students enrolled in each (use COUNT with RIGHT JOIN)--

SELECT C.COURSE_ID,C.COURSE_NAME,COUNT(STUDENT_ID) AS TOTAL_STUDENTS FROM STUDENTS S
RIGHT JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID
GROUP BY  C.COURSE_ID,C.COURSE_NAME;

--6.Display all students and course names, but if a student is not enrolled in a valid course, 
    show them as NULL (focus on highlighting unmatched students using RIGHT JOIN)--
    
SELECT STUDENT_ID,STUDENT_NAME,COURSE_NAME FROM COURSES C
RIGHT JOIN STUDENTS S ON C.COURSE_ID = S.COURSE_ID
WHERE COURSE_NAME IS NULL;  

--LEFT JOIN questions--

--1.Display all students along with their course names. If a student is not enrolled in any course 
    show NULL for the course name--
--2.Retrieve all students and their course IDs, but also include students who are not assigned to any course--
--3.Find all students who are not enrolled in any course (use LEFT JOIN with IS NULL)--
--4.List all students and their courses, but only include courses starting with the letter "D". 
    Students without such courses should still appear--
--5.Show each student with the course name, but display "Not Enrolled" if the student has no matching course--
--6.Display a list of all students along with the course name and ID, 
    sorted so that students without courses appear at the bottom--
    
--1.Display all students along with their course names. If a student is not enrolled in any course 
    show NULL for the course name--   
    
SELECT S.STUDENT_ID,S.STUDENT_NAME,C.COURSE_NAME,C.COURSE_ID FROM STUDENTS S
LEFT JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID
WHERE C.COURSE_NAME IS NULL;

--2.Retrieve all students and their course IDs, but also include students who are not assigned to any course--

SELECT S.STUDENT_ID,S.STUDENT_NAME,C.COURSE_ID,C.COURSE_NAME FROM STUDENTS S
LEFT JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID
WHERE C.COURSE_ID IS NULL;

--3.Find all students who are not enrolled in any course (use LEFT JOIN with IS NULL)--

SELECT STUDENT_NAME,COURSE_NAME FROM STUDENTS S
LEFT JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID
WHERE COURSE_NAME IS NULL;

--4.List all students and their courses, but only include courses starting with the letter "D". 
    Students without such courses should still appear--
    
SELECT S.STUDENT_ID,S.STUDENT_NAME,C.COURSE_ID,C.COURSE_NAME FROM STUDENTS S
LEFT JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID
WHERE C.COURSE_NAME LIKE 'D%'
      OR C.COURSE_NAME IS NULL;

--5.Show each student with the course name, but display "Not Enrolled" if the student has no matching course--

SELECT STUDENT_NAME,COALESCE(COURSE_NAME,'NOT ENROLLED') COURSE_NAME FROM STUDENTS S
LEFT JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID;

SELECT STUDENT_NAME,
       CASE
             WHEN COURSE_NAME IS NULL THEN 'NOT ENROLLED'
             ELSE COURSE_NAME
	   END AS COURSE_NAME
FROM STUDENTS S
LEFT JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID;

--6.Display a list of all students along with the course name and ID, 
    sorted so that students without courses appear at the bottom--
    
SELECT S.STUDENT_ID,S.STUDENT_NAME,C.COURSE_ID,C.COURSE_NAME FROM STUDENTS S
LEFT JOIN COURSES C ON C.COURSE_ID = S.COURSE_ID
ORDER BY C.COURSE_NAME IS NULL, C.COURSE_NAME;
    
    
    
    
    
    
    
    
    
    
    

       
      
    












    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        
    
    
    
    
    
    







































    
    
    
    
    
    
    
    


    
    




































