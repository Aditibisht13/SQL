---------------------------------------------assignment 3--------------------------------------------------

--1. Create an ‘Orders’ table which comprises of these columns: ‘order_id’,‘order_date’, ‘amount’, ‘customer_id’. 
CREATE TABLE ORDERS(ORDER_ID INT,ORDER_DATE DATE,AMOUNT INT,CUSTOMER_ID INT)

SELECT * FROM CUSTOMER

--Inserting 5 new records. 
INSERT INTO ORDERS VALUES(101,'2022-03-15',40000,1)
INSERT INTO ORDERS VALUES(102,'2020-03-15',10000,2)
INSERT INTO ORDERS VALUES(103,'2021-03-15',70000,3)
INSERT INTO ORDERS VALUES(104,'2023-03-15',6000,4)
INSERT INTO ORDERS VALUES(105,'2022-08-22',13000,5)

SELECT * FROM ORDERS

--2. Make an inner join on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column. 
SELECT * FROM CUSTOMER INNER JOIN ORDERS ON CUSTOMER.CUSTOMER_ID=ORDERS.CUSTOMER_ID

--3. Make left and right joins on ‘Customer’ and ‘Orders’ tables on the‘customer_id’ column.
SELECT * FROM CUSTOMER LEFT JOIN ORDERS ON CUSTOMER.CUSTOMER_ID=ORDERS.CUSTOMER_ID

SELECT * FROM CUSTOMER RIGHT JOIN ORDERS ON CUSTOMER.CUSTOMER_ID=ORDERS.CUSTOMER_ID


--4. Update the ‘Orders’ table and set the amount to be 100 where ‘customer_id’ is 3.

UPDATE ORDERS SET AMOUNT=100 WHERE CUSTOMER_ID=3

SELECT * FROM ORDERS1