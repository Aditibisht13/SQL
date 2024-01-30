
------------------------------------------------ ASSIGNMENT 5-------------------------------------------

-- 1. Arrange the ‘Orders’ dataset in decreasing order of amount

CREATE TABLE ORDERS(
ORDERS_ID INT,
ORDERS_DATE DATE,
AMOUNT INT,
CUSTOMER_ID INT
);

INSERT INTO ORDERS VALUES
(100,'2020-10-01',9000,20),
(110,'2020-10-01',9000,10),
(111,'2020-10-02',8000,2),
(112,'2020-10-03',7000,30),
(113,'2020-10-04',6000,3),
(114,'2020-10-05',5000,5);

SELECT * FROM ORDERS

SELECT * FROM ORDERS ORDER BY AMOUNT DESC;

--2. Create a table with the name ‘Employee_details1’ consistingof thesecolumns: ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. 
-- Create another table with the name ‘Employee_details2’ consisting of the same columns as the first table

-- TABLE ONE 

CREATE TABLE EMPLOYEE_DETAILS1 (EMP_ID INT,
EMP_NAME VARCHAR(40),
EMP_SALARY INT
);

INSERT INTO EMPLOYEE_DETAILS1 VALUES 
(1,'FERNA',5000),
(2,'APPLE',6000),
(3,'DANNY',7000),
(4,'JOHN',8000);

SELECT * FROM EMPLOYEE_DETAILS1

-- TABLE TWO

CREATE TABLE EMPLOYEE_DETAILS2 (
EMP_ID INT,
EMP_NAME VARCHAR(40),
EMP_SALARY INT
);

INSERT INTO EMPLOYEE_DETAILS2 VALUES
(1,'FERNA',5000),
(6,'VISHWA',6000),
(7,'CHANDAN',7000),
(8,'VIKAS',8000);

SELECT * FROM EMPLOYEE_DETAILS1
SELECT * FROM EMPLOYEE_DETAILS2

-- 3. Apply the UNION operator on these two tables

SELECT * FROM EMPLOYEE_DETAILS1
UNION 
SELECT * FROM EMPLOYEE_DETAILS2

-- 4. Apply the INTERSECT operator on these two tables

SELECT * FROM EMPLOYEE_DETAILS1
INTERSECT
SELECT * FROM EMPLOYEE_DETAILS2;

-- 5. Apply the EXCEPT operator on these two tables

SELECT * FROM EMPLOYEE_DETAILS1
EXCEPT
SELECT * FROM EMPLOYEE_DETAILS2;


/*
SELECT * FROM EMPLOYEE_DETAILS2
EXCEPT
SELECT * FROM EMPLOYEE_DETAILS1;
*/
