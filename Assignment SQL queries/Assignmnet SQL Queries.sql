
---TABLE 1-STUDIES---
CREATE TABLE STUDIES (
PNAME VARCHAR(20),
INSTITUTE VARCHAR(20),
COURSE VARCHAR(20),
[COURSE FEE] INT,

PRIMARY KEY (PNAME) 
)
 
 INSERT INTO STUDIES VALUES
 ('ANAND','SABHARI','PGDCA',4500),
 ('ALTAF','COIT','DCA',7200),
 ('JULIANA','BDPS','MCA',22000),
 ('KAMALA','PRAGATHI','DCA',5000),
 ('MARY','SABHARI','PGDCA',4500),
 ('NELSON','PRAGATHI','DAP',6200),
 ('PATRICK','PRAGATHI','DCAP',5200),
 ('QADIR','APPLE','HDCA',14000),
 ('RAMESH','SABHARI','PGDCA',4500),
 ('REBECCA','BRILLIANT','DCAP',11000),
 ('REMITHA','BDPS','DCS',6000),
 ('REVATHI','SABHARI','DAP',5000),
 ('VIJAYA','BDPS','DCA',48000)
 select * from STUDIES
 ---TABLE 2----SOFTWARE
 CREATE TABLE SOFTWARE (
 PNAME VARCHAR(20),
 TITLE VARCHAR(20),
 DEVELOPIN VARCHAR(20),
 SCOST INT,
 DCOST INT,
 SOLD INT,
 )

INSERT INTO SOFTWARE VALUES
('MARY','README','CPP',300,1200,84),
('ANAND','PARACHUTES','BASIC',399.95,6000,43),
('ANAND','VIDEO TITLING','PASCAL',7500,6000,9),
('JULIANA','INVENTORY','COBOL',3000,3500,0),
('KAMALA','PAYROLL PKG.','DBASE',9000,20000,7),
('MARY','FINANCIAL ACCT.','ORACLE',18000,85000,4),
('MARY','CODE GENERATOR','C',4500,20000,23),
('PATTRICK','README','CPP',300,1200,84),
('QADIR','BOMBS AWAY','ASSEMBLY',750,3000,11),
('QADIR','VACCINES','C',1900,3100,21),
('RAMESH','HOTEL MGMT.','DBASE',13000,35000,4),
('RAMESH','DEAD LEE','PASCAL',599.95,4500,73),
('REMITHA','PC UTILITIES','C',725,5000,51),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500,6000,7),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100,75000,2),
('VIJAYA','TSR EDITOR','C',900,700,6)
select * from SOFTWARE

----TABLE 3--PROGRAMMER--
CREATE TABLE PROGRAMMER (
 PNAME VARCHAR(20),
 DOB DATE,
 DOJ DATE,
GENDER VARCHAR(20),
PROF1 VARCHAR(20),
PROF2 VARCHAR(20),
SALARY INT
 )

 INSERT INTO PROGRAMMER VALUES
 ('ANAND','12-APR-66','21-APR-92','M','PASCAL','BASIC',3200),
 ('ALTAF','2-JUL-64','13-NOV-90','M','CLIPPER','COBOL',2800),
 ('JULIANA','31-JAN-60','21-APR-90','F','COBOL','DBASE',3000),
 ('KAMALA','30-OCT-68','2-JAN-92','F','C','DBASE',2900),
 ('MARY','24-JUN-70','1-FEB-91','F','CPP','ORACLE',4500),
 ('NELSON','11-SEP-85','11-OCT-89','M','COBOL','DBASE',2500),
 ('PATTRICK','10-NOV-65','21-APR-90','M','PASCAL','CLIPPER',2800),
 ('QADIR','31-AUG-65','21-APR-91','M','ASSEMBLY','C',3000),
 ('RAMESH','3-MAY-67','28-FEB-91','M','PASCAL','DBASE',3200),
 ('REBECCA','1-JAN-67','1-DEC-90','F','BASIC','COBOL',2500),
 ('REMITHA','19-APR-70','20-APR-93','F','C','ASSEMBLY',3600),
('REVATHI','2-DEC-69','2-JAN-92','F','PASCAL','BASIC',3700),
('VIJAYA','14-DEC-65','2-MAY-92','F','FOXPRO','C',3500)

SELECT * FROM PROGRAMMER

---Problem Statement:
--Consider yourself to be Sam and you have been given the below tasks to complete using 
--the Table – STUDIES, SOFTWARE & PROGRAMMER. 
--Tasks to be performed: 

--1. Find out the selling cost AVG for packages developed in Pascal. 

SELECT DEVELOPIN,AVG(SCOST) AS AVG_SCOST FROM SOFTWARE WHERE DEVELOPIN='PASCAL' group by DEVELOPIN

--2.Display Names, Ages of all Programmers. SELECT PNAME,DATEDIFF (YY, DOB, GETDATE ()) AS AGE FROM PROGRAMMER--3. Display the Names of those who have done the DAP Course. SELECT PNAME,COURSE FROM STUDIES WHERE COURSE='DAP'--4. Display the Names and Date of Births of all Programmers Born in January. select pname,DOB from PROGRAMMER where month(dob)=1
--5. What is the Highest Number of copies sold by a Package?
SELECT MAX(SOLD) FROM SOFTWARE 

--6. Display lowest course Fee. 
SELECT min([COURSE FEE]) AS MIN_COURSE_FEE FROM STUDIES

--7. How many programmers done the PGDCA Course? 
SELECT COURSE,COUNT(PNAME) AS [NO. OF PROGRAMMERS] FROM STUDIES WHERE COURSE='PGDCA' GROUP BY COURSE 

--8. How much revenue has been earned thru sales of Packages Developed in C.

SELECT DEVELOPIN,SUM(SOLD*SCOST) as Revenue_generated FROM SOFTWARE WHERE DEVELOPIN LIKE 'C' GROUP  BY DEVELOPIN

--9 Display the Details of the Software Developed by Ramesh. 
select * from software where pname='Ramesh'

--10. How many Programmers Studied at Sabhari? 

select count(pname) as [No. of programmers] from studies where INSTITUTE='SABHARI'

--11. Display details of Packages whose sales crossed the 2000 Mark

 SELECT * FROM SOFTWARE WHERE SCOST>2000

 --12 Display the Details of Packages for which Development Cost have been recovered.
 
 SELECT * FROM SOFTWARE WHERE DCOST<=SCOST

 --13 What is the cost of the costliest software development in Basic?

 SELECT TOP 1 SCOST FROM SOFTWARE WHERE DEVELOPIN='BASIC' GROUP BY SCOST ORDER BY SCOST DESC

 --14 How many Packages Developed in DBASE?

 SELECT COUNT(DEVELOPIN) FROM SOFTWARE WHERE DEVELOPIN='DBASE'

 --15. How many programmers studied in Pragathi?

 SELECT COUNT(PNAME) [No. of Programmers] FROM STUDIES WHERE INSTITUTE='PRAGATHI'

 --16. How many Programmers Paid 5000 to 10000 for their course? 

 SELECT count(PNAME) as [No. of programmers] FROM STUDIES WHERE [COURSE FEE] BETWEEN 5000 AND 10000

 --17. What is AVG Course Fee ?

 SELECT AVG([COURSE FEE]) AS [AVERAGE COURSE FEE] FROM STUDIES

 --18. Display the details of the Programmers Knowing C.
 SELECT * FROM PROGRAMMER WHERE PROF1='C' OR PROF2='C'

 --19. How many Programmers know either COBOL or PASCAL

 SELECT COUNT(PNAME) FROM PROGRAMMER WHERE (PROF1='COBOL' OR PROF2='COBOL') OR (PROF1='PASCAL' OR PROF2='PASCAL')

 --21. How old is the Oldest Male Programmer. 
 SELECT TOP 1 PNAME,DATEDIFF (YY, DOB, GETDATE ()) AS AGE FROM PROGRAMMER WHERE GENDER='M' ORDER BY DATEDIFF (YY, DOB, GETDATE ()) DESC

 --22. What is the AVG age of Female Programmers? 
 select avg(DATEDIFF (YY, DOB, GETDATE ())) as [average age of female programmer ] from PROGRAMMER where gender='F'

 --23. Calculate the Experience in Years for each Programmer and Display with their  names in Descending order.  SELECT PNAME, (DATEDiFF(YY, DOJ, GETDATE ())) AS [EXPERIENCE IN YEARS] FROM PROGRAMMER ORDER BY (DATEDIFF(YY, DOJ, GETDATE ())) DESC

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month? 

SELECT PNAME FROM PROGRAMMER WHERE MONTH(DOB)=MONTH(GETDATE())

--25. How many Female Programmers are there?

SELECT COUNT(PNAME) AS [No of Female programmer] FROM PROGRAMMER WHERE GENDER='F'

--26. What are the Languages studied by Male Programmers. 

  SELECT DISTINCT PROF1 FROM PROGRAMMER WHERE GENDER='M' union
  SELECT DISTINCT PROF2 FROM PROGRAMMER WHERE GENDER='M'

  --27. What is the AVG Salary? 

  SELECT AVG(SALARY) as [Average Salary] FROM PROGRAMMER

  --28. How many people draw salary 2000 to 4000? 

  SELECT COUNT(PNAME) FROM PROGRAMMER WHERE SALARY BETWEEN 2000 AND 4000

  ---29. Display the details of those who don’t know Clipper, COBOL or PASCAL. 

  SELECT * FROM PROGRAMMER WHERE PROF1 NOT IN('CLIPPER','COBOL','PASCAL')
  AND PROF2 NOT IN('CLIPPER','COBOL','PASCAL')

  ---30. Display the Cost of Package Developed By each Programmer.

  SELECT PNAME AS PROGRAMMER_NAME,SUM(DCOST) AS[PACKAGE COST] FROM SOFTWARE GROUP BY PNAME

---31. Display the sales values of the Packages Developed by the each Programmer. 

  SELECT PNAME AS PROGRAMMER_NAME,SUM(SCOST * SOLD) AS[SALES COST] FROM SOFTWARE GROUP BY PNAME

---32. Display the Number of Packages sold by Each Programmer. 

 SELECT PNAME ,COUNT(TITLE) AS TOTAL_PACKAGES FROM SOFTWARE GROUP BY PNAME

 ---33. Display the sales cost of the packages Developed by each Programmer Language wise. 

 SELECT DEVELOPIN AS language, SUM(SCOST) as Sales_cost  FROM SOFTWARE GROUP BY DEVELOPIN

 ---34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy. 

 SELECT DEVELOPIN as language, AVG(DCOST) as avg_dev_cost ,AVG(SCOST) as avg_selling_cost,
 AVG(SCOST) as avg_price_per_copy FROM SOFTWARE GROUP BY DEVELOPIN

 ---35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 
 
 SELECT PNAME,MAX(DCOST) AS COSTLIEST_PACKAGE,MIN(DCOST) AS CHEAPEST_PACKAGE  FROM SOFTWARE GROUP BY PNAME
 select * from SOFTWARE

 ---36. Display each institute name with number of Courses, Average Cost per Course.

 SELECT INSTITUTE,COUNT(COURSE) AS NO_OF_COURSE, AVG([COURSE FEE]) AS AVG_FEE FROM STUDIES GROUP BY INSTITUTE

 ---37. Display each institute Name with Number of Students.

 SELECT INSTITUTE, COUNT(PNAME) as No_of_students FROM STUDIES GROUP BY INSTITUTE

 ---38. Display Names of Male and Female Programmers. Gender also.

 SELECT PNAME,GENDER FROM PROGRAMMER ORDER BY GENDER

 ---39. Display the Name of Programmers and Their Packages. 

SELECT PNAME,TITLE AS PACKAGE_NAME FROM SOFTWARE ORDER BY PNAME

---40. Display the Number of Packages in Each Language Except C and C++. 

SELECT DEVELOPIN,COUNT(TITLE) AS NO_OF_PACKAGES FROM SOFTWARE WHERE DEVELOPIN<>'C' AND DEVELOPIN<>'C++' GROUP BY DEVELOPIN

---41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.

SELECT DEVELOPIN,TITLE FROM SOFTWARE WHERE DCOST<1000 ORDER BY DEVELOPIN

---42. Display AVG Difference between SCOST, DCOST for Each Package. 

SELECT TITLE,AVG((DCOST-SCOST)) AS AVG_DIFFERENCE FROM SOFTWARE GROUP BY TITLE

---43. Display the total SCOST, DCOST and amount to Be Recovered for each  Programmer for Those Whose Cost has not yet been Recovered. 

SELECT PNAME,SUM(SCOST) AS TOTAL_SELLING_COST, SUM(DCOST) AS TOTAL_DEV_COST, SUM(DCOST-(SOLD*SCOST)) AS AMOUNT_TO_BE_RECOVERED 
FROM SOFTWARE GROUP BY PNAME HAVING SUM(DCOST)>SUM(SOLD*SCOST)

---44. Display Highest, Lowest and Average Salaries for those earning more than 2000.
SELECT MAX(SALARY) AS HIGHEST_SAL,MIN(SALARY) AS LOWEST_SAL,AVG(SALARY) AS AVG_SAL FROM PROGRAMMER WHERE SALARY>2000

---45. Who is the Highest Paid C Programmers? 

SELECT TOP 1 PNAME FROM PROGRAMMER WHERE PROF1='C' OR PROF2='C' ORDER BY SALARY DESC

---46. Who is the Highest Paid Female COBOL Programmer? 
 SELECT PNAME FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER
 WHERE PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL') AND GENDER='F'

 ---47. Display the names of the highest paid programmers for each Language.
 
SELECT LANG.PROF1, MAX(LANG.MAX_SAL) FROM (
SELECT PROF1, MAX(SALARY) AS MAX_SAL FROM PROGRAMMER GROUP BY PROF1
UNION
SELECT PROF2, MAX(SALARY) AS MAX_SAL FROM PROGRAMMER GROUP BY PROF2) AS LANG GROUP BY LANG.PROF1

---48. Who is the least experienced Programmer. 

SELECT TOP 1 PNAME FROM PROGRAMMER ORDER BY (DATEDIFF(YY, DOJ, GETDATE ())) ASC

---49. Who is the most experienced male programmer knowing PASCAL

SELECT TOP 1 PNAME FROM PROGRAMMER WHERE PROF1='PASCAL' OR PROF2='PASCAL' AND GENDER='M' 
ORDER BY (DATEDIFF(YY, DOJ, GETDATE ())) DESC

---50. Which Language is known by only one Programmer? 

SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER)AND COUNT(PROF1)=1 
UNION 
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1

---51. Who is the Above Programmer Referred in 50

SELECT PNAME as In_50s FROM PROGRAMMER WHERE (DATEDIFF(YY, DOB, GETDATE ())) >=50

---52. Who is the Youngest Programmer knowing DBASE? 

SELECT TOP 1 PNAME FROM PROGRAMMER WHERE PROF1='DBASE' OR PROF2='DBASE' ORDER BY (DATEDIFF(YY, DOB, GETDATE ())) ASC

---53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 

SELECT PNAME FROM PROGRAMMER WHERE GENDER='F' AND SALARY >3000 AND 
(PROF1<>'C' AND PROF1<> 'C++'AND PROF1<>'DBASE' AND PROF1<>'ORACLE' AND PROF2<>'C' AND PROF2<>'C++' AND PROF2<>'DBASE' AND PROF2<>'ORACLE')

---54. Which Institute has most number of Students?

  SELECT TOP 1 INSTITUTE,COUNT(PNAME) AS NO_OF_STUDENTS FROM STUDIES GROUP BY INSTITUTE ORDER BY COUNT(PNAME) DESC

---55. What is the Costliest course? 

SELECT COURSE as costliest_course FROM STUDIES WHERE [COURSE FEE] = (SELECT MAX([COURSE FEE]) FROM STUDIES)

---56. Which course has been done by the most of the Students? 

SELECT COURSE FROM STUDIES GROUP BY COURSE 
HAVING COUNT(COURSE)=(SELECT MAX(COUNT(COURSE)) FROM STUDIES GROUP BY COURSE)

---57. Which Institute conducts costliest course. SELECT INSTITUTE FROM STUDIES WHERE [COURSE FEE]= (SELECT MAX([COURSE FEE]) FROM STUDIES ) 
---Display the name of the Institute and Course, which has below AVG course fee. 

SELECT INSTITUTE,COURSE FROM STUDIES WHERE
[COURSE FEE]<(SELECT AVG([COURSE FEE]) from studies)

---59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee

SELECT INSTITUTE,COURSE FROM STUDIES WHERE
[COURSE FEE] BETWEEN (SELECT AVG([COURSE FEE]) FROM STUDIES)-1000 
AND (SELECT AVG([COURSE FEE]) FROM STUDIES)+1000

---60. Which package has the Highest Development cost? 

SELECT TITLE FROM SOFTWARE WHERE DCOST=(SELECT MAX(DCOST) FROM SOFTWARE)

---61. Which course has below AVG number of Students? 
SELECT COURSE FROM STUDIES GROUP BY COURSE HAVING 
COUNT(PNAME)<(SELECT AVG(COUNT(PNAME)) FROM STUDIES GROUP BY COURSE) 

---62. Which Package has the lowest selling cost? 

SELECT TITLE FROM SOFTWARE WHERE SCOST=(SELECT MIN(SCOST) FROM SOFTWARE)

---63. Who Developed the Package that has sold the least number of copies? 

SELECT PNAME FROM SOFTWARE WHERE SOLD=(SELECT MIN(SOLD) FROM SOFTWARE)

---64. Which language has used to develop the package, which has the highest sales amount? 

SELECT DEVELOPIN,TITLE FROM SOFTWARE WHERE SCOST=(SELECT MAX(SCOST) FROM SOFTWARE)

---65. How many copies of package that has the least difference between development and selling cost where sold. SELECT SOLD,TITLE FROM SOFTWARE WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE)
---66. Which is the costliest package developed in PASCAL

SELECT TITLE FROM SOFTWARE WHERE DCOST=(SELECT MAX(DCOST) FROM SOFTWARE where developin='PASCAL')

---67. Which language was used to develop the most number of Packages. 

SELECT DEVELOPIN FROM SOFTWARE GROUP BY DEVELOPIN HAVING MAX(DEVELOPIN) = (SELECT MAX(DEVELOPIN) FROM SOFTWARE)

---68. Which programmer has developed the highest number of Packages? 

SELECT PNAME FROM SOFTWARE GROUP BY PNAME having
max(title)=(SELECT max(COUNT(title)) FROM SOFTWARE GROUP BY PNAME)

SELECT count(PNAME) as count FROM SOFTWARE group by PNAME

---69. Who is the Author of the Costliest Package? 

SELECT PNAME,DCOST FROM SOFTWARE WHERE DCOST=(SELECT MAX(DCOST) FROM SOFTWARE)

---70. Display the names of the packages, which have sold less than the AVG number of copies. 

SELECT TITLE FROM SOFTWARE WHERE SOLD<(SELECT AVG(SOLD) FROM SOFTWARE) 

---71. Who are the authors of the Packages, which have recovered more than double the Development cost? 

SELECT TITLE FROM SOFTWARE WHERE SOLD*SCOST > 2*DCOST

---72. Display the programmer Name and the cheapest packages developed by them in each language. 

SELECT PNAME,TITLE FROM SOFTWARE
WHERE DCOST IN (SELECT MIN(DCOST) FROM SOFTWARE GROUP BY PNAME)

---73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package. SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE GROUP BY PNAME)
UNION SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY
PNAME) ORDER BY PNAME---74. Who is the youngest male Programmer born in 1965? SELECT PNAME FROM PROGRAMMER WHERE GENDER='M' AND DOB=(SELECT (MIN(DOB)) FROM PROGRAMMER WHERE YEAR(DOB)=1965)---75. Who is the oldest Female Programmer who joined in 1992?SELECT PNAME FROM PROGRAMMER WHERE GENDER='F' AND DOB=(SELECT (MAX(DOB))
FROM PROGRAMMER WHERE YEAR(DOJ) LIKE '1992')

---76. In which year was the most number of Programmers born. 

SELECT YEAR(DOB) "YEAR",COUNT(YEAR(DOB))
FROM PROGRAMMER GROUP BY YEAR(DOB) HAVING COUNT(YEAR(DOB)) >= ALL(SELECT COUNT(YEAR(DOB))
FROM PROGRAMMER GROUP BY YEAR(DOB))

---77. In which month did most number of programmers join? 

SELECT MONTH(DOJ) "MONTH",COUNT(MONTH(DOJ))
FROM PROGRAMMER GROUP BY MONTH(DOJ) HAVING COUNT(MONTH(DOJ)) >= ALL(SELECT COUNT(MONTH(DOJ))
FROM PROGRAMMER GROUP BY MONTH(DOJ))

---78. In which language are most of the programmer’s proficient. 
SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING COUNT(PROF1)=(SELECT MAX(COUNT(PROF1)) FROM
PROGRAMMER GROUP BY PROF1) and COUNT(PROF2)=(SELECT MAX(COUNT(PROF2)) FROM PROGRAMMER GROUP BY
PROF2)

---79. Who are the male programmers earning below the AVG salary of Female Programmers?

SELECT PNAME FROM PROGRAMMER WHERE GENDER='M' AND SALARY <(SELECT AVG(SALARY) FROM PROGRAMMER WHERE GENDER='F')

---80. Who are the Female Programmers earning more than the Highest Paid? 

SELECT PNAME FROM PROGRAMMER WHERE GENDER = 'F' AND SALARY > (SELECT(MAX(SALARY)) FROM PROGRAMMER
WHERE GENDER = 'M')

---81. Which language has been stated as the proficiency by most of the Programmers? 

SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 = (SELECT MAX(PROF1) FROM PROGRAMMER)

---82. Display the details of those who are drawing the same salary. 

SELECT * FROM PROGRAMMER WHERE SALARY = ANY(SELECT SALARY FROM PROGRAMMER P GROUP BY SALARY HAVING
SALARY=P.SALARY AND COUNT(*)>1) ORDER BY SALARY

---83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-. 

SELECT * FROM SOFTWARE S,PROGRAMMER P WHERE P.PNAME=S.PNAME AND SALARY>3000 AND GENDER='M'

---84. Display the details of the packages developed in Pascal by the Female Programmers.

SELECT * FROM SOFTWARE as S,PROGRAMMER as P WHERE P.PNAME=S.PNAME AND DEVELOPIN='PASCAL' AND GENDER='F'

---85. Display the details of the Programmers who joined before 1990. 

SELECT * FROM PROGRAMMER WHERE YEAR(DOJ)<1990

---86. Display the details of the Software Developed in C By female programmers of Pragathi.

SELECT * FROM SOFTWARE as S,STUDIES as ST WHERE S.PNAME=ST.PNAME AND DEVELOPIN='C' AND INSTITUTE='PRAGATHI'

---87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise. 

SELECT STUDIES.INSTITUTE, COUNT(SOFTWARE.DEVELOPIN) AS NO_OF_PACKAGES,
SUM(SOFTWARE.SOLD) AS NO_OF_COPIES_SOLD, 
SUM(SOFTWARE.SOLD*SOFTWARE.SCOST) AS SALES_VALUE FROM SOFTWARE,STUDIES 
WHERE SOFTWARE.PNAME=STUDIES.PNAME GROUP BY STUDIES.INSTITUTE

---88. Display the details of the software developed in DBASE by Male Programmers, 
---who belong to the institute in which most number of Programmers studied

SELECT S.* FROM SOFTWARE AS S,STUDIES AS ST,PROGRAMMER AS P WHERE S.PNAME=ST.PNAME AND
ST.PNAME=P.PNAME AND  GENDER='M' AND DEVELOPIN='DBASE' AND INSTITUTE= (SELECT top 1 INSTITUTE FROM STUDIES GROUP BY INSTITUTE
HAVING count(pname) =(SELECT MAX(COUNT(PNAME))FROM STUDIES GROUP BY INSTITUTE))

---89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.

SELECT S.* FROM SOFTWARE AS S, PROGRAMMER AS P where S.PNAME=P.PNAME 
AND (GENDER='F' AND YEAR(DOB)>1975)or (GENDER='M' AND YEAR(DOB)<1965)

---90. Display the details of the software that has developed in the language which is
--neither the first nor the second proficiency of the programmers. 

SELECT S.* FROM SOFTWARE S, PROGRAMMER P where S.PNAME=S.PNAME and
(S.DEVELOPIN<>P.PROF1 AND S.DEVELOPIN <>P.PROF2) 

---91. Display the details of the software developed by the male students of Sabhari

SELECT S.TITLE FROM SOFTWARE AS S,STUDIES AS ST,PROGRAMMER AS P WHERE S.PNAME=ST.PNAME
AND ST.PNAME=P.PNAME AND GENDER='M' AND INSTITUTE ='SABHARI'

---92. Display the names of the programmers who have not developed any packages. 

SELECT PNAME FROM PROGRAMMER WHERE PNAME NOT IN(SELECT PNAME FROM SOFTWARE)
---93. What is the total cost of the Software developed by the programmers of Apple? SELECT SUM(SCOST) AS COST_OF_SOFTWARE_DEVELOPED FROM SOFTWARE S, STUDIES STWHERE S.PNAME=ST.PNAME AND INSTITUTE='APPLE'---94. Who are the programmers who joined on the same day? SELECT A.PNAME,A.DOJ FROM PROGRAMMER A,PROGRAMMER B WHERE A.DOJ=B.DOJ AND A.PNAME <> B.PNAME order by DOJ---95. Who are the programmers who have the same Prof2?SELECT distinct A.PNAME,A.PROF2 FROM PROGRAMMER A,PROGRAMMER BWHERE A.PROF2=B.PROF2 AND A.PNAME <> B.PNAME order by PROF2---96. Display the total sales value of the software, institute wiseSELECT ST.INSTITUTE,SUM(S.SCOST*S.SOLD) TOTAL_SALES FROM STUDIES ST, SOFTWARE SWHERE ST.PNAME=S.PNAME GROUP BY INSTITUTE---97. In which institute does the person who developed the costliest package studied. SELECT INSTITUTE FROM SOFTWARE S, STUDIES ST WHERE S.PNAME=ST.PNAME AND DCOST=(SELECT MAX(DCOST) FROM SOFTWARE)---98. Which language listed in prof1, prof2 has not been used to develop any packageSELECT TITLE FROM SOFTWARE S,PROGRAMMER P WHERE S.PNAME=P.PNAME AND (DEVELOPIN<>PROF1 AND DEVELOPIN<>PROF2)---99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. SELECT S.PNAME,ST.COURSE FROM SOFTWARE S,STUDIES ST,PROGRAMMER P WHERE S.PNAME=ST.PNAME AND ST.PNAME=P.PNAMEAND SOLD=(SELECT MAX(SOLD) FROM SOFTWARE)---100. What is the AVG salary for those whose software sales is more than 50,000/SELECT AVG(SALARY) AS AVERAGE_SALARY FROM PROGRAMMER P, SOFTWARE S WHERE (SOLD*SCOST)>50000---101. How many packages were developed by students, who studied in institute that charge the lowest course fee?SELECT COUNT(TITLE) FROM SOFTWARE S,STUDIES ST WHERE S.PNAME=ST.PNAME AND [COURSE FEE]=(SELECT MIN([COURSE FEE]) FROM STUDIES)---102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study? SELECT COUNT(*),INSTITUTE FROM SOFTWARE S,STUDIES ST WHERE S.PNAME=ST.PNAME GROUP BY INSTITUTE HAVING MIN(DCOST)=(SELECT
MIN(DCOST) FROM SOFTWARE)

---103. How many packages were developed by the female programmers earning more than the highest paid male programmer?

SELECT COUNT(TITLE) AS NO_OF_PACKAGES FROM SOFTWARE S, PROGRAMMER P WHERE S.PNAME=P.PNAME AND GENDER='F' AND 
SALARY>(SELECT MAX(SALARY) FROM PROGRAMMER P,SOFTWARE S WHERE S.PNAME=P.PNAME AND GENDER='M')

---104. How many packages are developed by the most experienced programmer form BDPS. 

SELECT COUNT(TITLE) AS NO_OF_PACKAGES FROM SOFTWARE S,STUDIES ST,PROGRAMMER P WHERE S.PNAME=ST.PNAME AND ST.PNAME=P.PNAME
AND INSTITUTE='BDPS' AND DOJ=(SELECT MAX(DOJ) FROM PROGRAMMER)

---105. List the programmers (form the software table) and the institutes they studied.

SELECT DISTINCT ST.PNAME,ST.INSTITUTE FROM SOFTWARE S, STUDIES ST WHERE S.PNAME=ST.PNAME 

---106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF.

SELECT COUNT(*) AS NO_OF_PROGRAMMERS,SUM(SCOST*SOLD-DCOST) "PROFIT" FROM SOFTWARE WHERE DEVELOPIN IN (SELECT PROF1 FROM PROGRAMMER) GROUP BY DEVELOPIN

---107. List the programmer names (from the programmer table) and No. Of Packages each has developed

SELECT P.PNAME,COUNT(TITLE) AS NO_OF_PACKAGES_DEVELOPED FROM PROGRAMMER P,SOFTWARE S 
WHERE S.PNAME=P.PNAME GROUP BY P.PNAME



