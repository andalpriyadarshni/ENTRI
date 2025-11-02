CREATE DATABASE EMPLOYEE;
USE EMPLOYEE;

CREATE TABLE DEPARTMENTS(
       DEPARTMENT_ID INT PRIMARY KEY,
       DEPARTMENT_NAME VARCHAR (100) UNIQUE
       );
  CREATE TABLE EMPLOYEES(
       EMPLOYEE_ID INT PRIMARY KEY,
       EMPLOYEE_NAME VARCHAR(25) NOT NULL,
       GENDER ENUM('M','F'),
       AGE INT,
       HIRE_DATE DATE,
       DESIGNATION VARCHAR(30),
       DEPARTMENT_ID INT,
       LOCATION_ID INT,
       SALARY DECIMAL(6,0),
       FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID)
       );
CREATE TABLE LOCATION(
       LOCATION_ID INT PRIMARY KEY AUTO_INCREMENT,
       LOCATION VARCHAR(25)
       );
       
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');

INSERT INTO location (location) VALUES
('Chennai'),
('Bangalore'),
('Hyderabad'),
('Pune');

INSERT INTO employees (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary) VALUES
(5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
(5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
(5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
(5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
(5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
(5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
(5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
(5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
(5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
(5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
(5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
(5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
(5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
(5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
(5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
(5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
(5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
(5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
(5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
(5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
(5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
(5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
(5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
(5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
(5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
(5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
(5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
(5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
(5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
(5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);


--DISTINCT VALUES--

--1. DISTINCT SALARY FROM EMPLOYEE TABLE--

SELECT DISTINCT SALARY FROM EMPLOYEES;

--ALIAS(AS)--

--2.PROVIDE ALIAS FOR AGE AND SALARY AS EMPLOYEE_AGE AND EMPLOYEE_SALARY--

SELECT AGE AS EMPLOYEE_AGE FROM EMPLOYEES;
SELECT SALARY AS EMPLOYEE_SALARY FROM EMPLOYEES;

3.WHERE CLAUSE AND OPERATORS--

--Retrieve employees with a salary greater than ₹50000 and hired before
2016-01-01--

SELECT * FROM EMPLOYEES WHERE HIRE_DATE < '2016-01-01' AND SALARY > 50000;

--Find the employee whose designation is missing and fill it with "Data
Scientist"--

UPDATE EMPLOYEES
SET DESIGNATION = 'DATA SCIENTIST'
WHERE DESIGNATION IS NULL
AND EMPLOYEE_ID > 0;

--AND EMPLOYEE_ID > 0;-- IS FOR SAFE UPDATE--

--SORTING AND GROUPING--

--1.Find employees sorted by department ID in ascending order and salary in
descending order--

--ORDER BY--

SELECT * FROM DEPARTMENTS ORDER BY DEPARTMENT_ID ASC;
SELECT * FROM EMPLOYEES ORDER BY SALARY DESC;

--2.LIMIT--

--Display the first 5 employees hired in the year 2018--

SELECT * FROM EMPLOYEES WHERE YEAR (HIRE_DATE)= 2018 LIMIT 5;

--3.AGGREGATE FUNCTIONS--

--Calculate the sum of all salaries in the Finance department--

SELECT DEPARTMENT_NAME,SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME = 'FINANCE'
GROUP BY DEPARTMENT_NAME;


--Find the minimum age among all employees--

SELECT MIN(AGE) MIN_AGE FROM EMPLOYEES;

--4.GROUP BY--

--List the maximum salary for each location--

SELECT L.LOCATION,MAX(E.SALARY) MAX_SALARY FROM EMPLOYEES E
JOIN LOCATION L ON L.LOCATION_ID = E.LOCATION_ID
GROUP BY L.LOCATION;


--Calculate the average salary for each designation containing the word
'Analyst'--

SELECT DESIGNATION,AVG(SALARY) AVG_SALARY FROM EMPLOYEES WHERE DESIGNATION LIKE '%ANALYST%' GROUP BY DESIGNATION;

--5.HAVING--

--Find departments with less than 3 employees--

SELECT D.DEPARTMENT_NAME,COUNT(E.DEPARTMENT_ID) FROM DEPARTMENTS D
JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY E.DEPARTMENT_ID
HAVING COUNT(E.DEPARTMENT_ID)< 3;


--Find locations with female employees whose average age is below 30--

SELECT L.LOCATION,L.LOCATION_ID,GENDER,AVG(E.AGE) AVG_AGE FROM LOCATION L
JOIN EMPLOYEES E ON E.LOCATION_ID = L.LOCATION_ID
WHERE E.GENDER = 'F'
GROUP BY L.LOCATION,L.LOCATION_ID,E.GENDER
HAVING AVG(E.AGE) < 30;

--JOIN--

--INNER JOIN--

--List employee names, their designations, and department names where
employees are assigned to a department--

SELECT EMPLOYEE_NAME,DESIGNATION,DEPARTMENT_NAME
FROM DEPARTMENTS D
JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--LEFT JOIN--

--List all departments along with the total number of employees in each
department, including departments with no employees--

SELECT COUNT(E.EMPLOYEE_ID) TOTAL_EMPLOYEES,D.DEPARTMENT_ID,D.DEPARTMENT_NAME
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID,D.DEPARTMENT_NAME;

--RIGHT JOIN--

--Display all locations along with the names of employees assigned to each
location. If no employees are assigned to a location, display NULL for
employee name--

SELECT L.LOCATION,L.LOCATION_ID,E.EMPLOYEE_NAME
FROM LOCATION L
RIGHT JOIN EMPLOYEES E ON E.LOCATION_ID = L.LOCATION_ID;















































