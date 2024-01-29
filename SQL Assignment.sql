----------------------------------------------SQL Assignment------------------------------------------------


---Create the following Tables and insert the values accordingly and Perform the tasks mentioned below.

---Table 1
CREATE TABLE [EMPLOYEE TABLE](

EMPLOYEE_ID INT,
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR(20),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT VARCHAR(20)
PRIMARY KEY (EMPLOYEE_ID)
)
insert into [EMPLOYEE TABLE] values
(1,'Anika','Arora',100000, '2020-02-14 9:00','HR'),
(2,'Veena','Verma',80000, '2011-06-15 9:00','Admin'),
(3,'Vishal','Singhal',300000, '2020-02-16 9:00','HR'),
(4,'Sushanth','Singh',500000, '2020-02-17 9:00','Admin'),
(5,'Bhupal','Bhati',500000, '2011-06-18 9:00','Admin'),
(6,'Dheeraj','Diwan',200000, '2011-06-19 9:00','Account'),
(7,'Karan','Kumar',75000, '2020-01-14 9:00','Account'),
(8,'Chandrika','Chauhan',90000, '2011-04-15 9:00','Admin')

SELECT * FROM [EMPLOYEE TABLE]
---Table 2
CREATE TABLE [EMPLOYEE BONUS TABLE]
(
EMPLOYEE_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY (EMPLOYEE_REF_ID) 
REFERENCES [EMPLOYEE TABLE](EMPLOYEE_ID))

INSERT INTO [EMPLOYEE BONUS TABLE] VALUES
(1,5000,'2020-02-16 0:00'),
(2,3000,'2011-06-16 0:00'),
(3,4000,'2020-02-16 0:00'),
(1,4500,'2020-02-16 0:00'),
(2,3500,'2011-06-16 0:00')
SELECT * FROM [EMPLOYEE BONUS TABLE]


------Table 3
CREATE TABLE [EMPLOYEE TITLE TABLE]
( EMPLOYEE_REF_ID INT,
EMPLYEE_TITLE VARCHAR(20),
AFFECTIVE_DATE DATETIME,
FOREIGN KEY (EMPLOYEE_REF_ID) 
REFERENCES [EMPLOYEE TABLE](EMPLOYEE_ID))

INSERT INTO [EMPLOYEE TITLE TABLE] VALUES
(1,'Manager','2016-02-20 0:00'),
(2,'Executive','2016-06-11 0:00'),
(8,'Executive','2016-06-11 0:00'),
(5,'Manager','2016-06-11 0:00'),
(4,'Asst. Manager','2016-06-11 0:00'),
(7,'Executive','2016-06-11 0:00'),
(6,'Lead','2016-06-11 0:00'),
(3,'Lead','2016-06-11 0:00')
SELECT * FROM [EMPLOYEE TITLE TABLE]

----Tasks To Be Performed

---1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.SELECT FIRST_NAME AS EMPLOYEE_NAME FROM [EMPLOYEE TABLE]---2 Display “LAST_NAME” from Employee table in upper case.SELECT UPPER(LAST_NAME) FROM [EMPLOYEE TABLE]---3 Display unique values of DEPARTMENT from EMPLOYEE table.SELECT DISTINCT DEPARTMENT FROM [EMPLOYEE TABLE]---4 Display the first three characters of LAST_NAME from EMPLOYEE table.SELECT SUBSTRING(LAST_NAME,1,3) FROM [EMPLOYEE TABLE]---5 Display the unique values of DEPARTMENT from EMPLOYEE table and  prints its length. SELECT DEPARTMENT,LEN(DEPARTMENT) FROM [EMPLOYEE TABLE]---6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME. 
 --a space char should separate them. SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS FULL_NAME FROM [EMPLOYEE TABLE] ---7 DISPLAY all EMPLOYEE details from the employee table  order by FIRST_NAME Ascending. SELECT * FROM [EMPLOYEE TABLE] ORDER BY FIRST_NAME ---8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.SELECT * FROM [EMPLOYEE TABLE] ORDER BY FIRST_NAME ASC, DEPARTMENT DESC---9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.SELECT * FROM [EMPLOYEE TABLE] WHERE FIRST_NAME='VEENA' OR FIRST_NAME='KARAN'---10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.SELECT * FROM [EMPLOYEE TABLE] WHERE DEPARTMENT ='Admin'---11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.SELECT * FROM [EMPLOYEE TABLE] WHERE FIRST_NAME like 'V%'---12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.SELECT * FROM [EMPLOYEE TABLE] WHERE SALARY BETWEEN 100000 AND 500000---13 Display details of the employees who have joined in Feb-2020.SELECT * FROM [EMPLOYEE TABLE] where  YEAR(JOINING_DATE) = '2020' AND MONTH(JOINING_DATE)='02'---14 Display employee names with salaries >= 50000 and <= 100000.SELECT CONCAT(FIRST_NAME,' ','LAST_NAME') AS EMPLOYEEE_NAME, SALARY FROM [EMPLOYEE TABLE] WHERE SALARY>=50000 AND SALARY<=100000---16 DISPLAY details of the EMPLOYEES who are also Managers.SELECT ET.*,ETT.EMPLYEE_TITLE FROM [EMPLOYEE TABLE] AS ET LEFT JOIN [EMPLOYEE TITLE TABLE] AS ETT ON ET.EMPLOYEE_ID=ETT.EMPLOYEE_REF_ID WHERE ETT.EMPLYEE_TITLE='Manager'---17 DISPLAY duplicate records having matching data in some fields of a table.SELECT * FROM [EMPLOYEE TABLE]
EXCEPT
SELECT DISTINCT * FROM [EMPLOYEE TABLE]---18 Display only odd rows from a table.SELECT * FROM [EMPLOYEE TABLE] WHERE (EMPLOYEE_ID%2) !=0--19 Clone a new table from EMPLOYEE table.SELECT TOP 0 * INTO [DBO].NEW_TABLE
FROM [DBO].[EMPLOYEE TABLE]INSERT INTO NEW_TABLE SELECT * FROM [EMPLOYEE TABLE]SELECT * FROM NEW_TABLE---20 DISPLAY the TOP 2 highest salary from a table.SELECT TOP 2 SALARY AS TOP_SALARIES FROM [EMPLOYEE TABLE] GROUP BY SALARY ORDER BY SALARY DESC  ---21. DISPLAY the list of employees with the same salary.SELECT CONCAT(ET.FIRST_NAME,' ',ET.LAST_NAME), ET.SALARY
FROM [EMPLOYEE TABLE] AS ET
INNER JOIN [EMPLOYEE TABLE] ET2 ON ET.SALARY = ET2.SALARY AND ET.FIRST_NAME <> ET2.FIRST_NAME

---22 Display the second highest salary from a table. SELECT TOP 1 SALARY FROM (SELECT TOP 2 SALARY FROM [EMPLOYEE TABLE]GROUP BY SALARY ORDER BY SALARY DESC)[ EMPLOYEE TABLE] ORDER BY SALARY ASC---23 Display the first 50% records from a table.SELECT TOP 50 PERCENT * FROM [EMPLOYEE TABLE]---24. Display the departments that have less than 4 people in it.SELECT DEPARTMENT,COUNT(*) FROM [EMPLOYEE TABLE]
GROUP BY DEPARTMENT HAVING COUNT(*)<4---25. Display all departments along with the number of people in there.SELECT DEPARTMENT,COUNT(*) as [No. of people] FROM [EMPLOYEE TABLE]
GROUP BY DEPARTMENT

---26 Display the name of employees having the highest salary in each department.SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS EMPLOYEE_NAMES ,DEPARTMENT,SALARY  FROM [EMPLOYEE TABLE]  
WHERE SALARY IN(SELECT MAX(SALARY) AS SALARY FROM [EMPLOYEE TABLE] GROUP BY DEPARTMENT)

---27 Display the names of employees who earn the highest salary. SELECT CONCAT(FIRST_NAME,' ',LAST_NAME),SALARY FROM [EMPLOYEE TABLE] WHERE SALARY IN (SELECT MAX(SALARY) FROM [EMPLOYEE TABLE])---28 Diplay the average salaries for each department.

SELECT department,avg(SALARY) AS [Average Salary]
FROM [EMPLOYEE TABLE]
GROUP BY DEPARTMENT
---29 display the name of the employee who has got maximum bonus.SELECT TOP 1 CONCAT(ET.FIRST_NAME,' ',ET.LAST_NAME),
COALESCE((SELECT SUM(EBT.BONUS_AMOUNT) AS BONUS
FROM [EMPLOYEE BONUS TABLE] AS EBT
WHERE EBT.EMPLOYEE_REF_ID = ET.EMPLOYEE_ID), 0) [TOTAL_BONUS]
FROM [EMPLOYEE TABLE] AS ET--30 Display the first name and title of all the employees.SELECT ET.FIRST_NAME, ETT.EMPLYEE_TITLE FROM [EMPLOYEE TABLE] AS ETLEFT JOIN [EMPLOYEE TITLE TABLE] AS ETT ON ET.EMPLOYEE_ID=ETT.EMPLOYEE_REF_ID