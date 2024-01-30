
------------------------------------------Assignment 2------------------------------------------------


--1. Create a customer table which comprises of these columns: ‘customer_id’, ‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’ 
create table customer(customer_id int,first_name varchar(30),last_name varchar(30),email varchar(30),
address varchar(30),city varchar(30),state varchar(30),zip int)

--2. Insert 5 new records into the table

insert into customer values(101,'riya','jain','riya@12gmail.com','towerb','hyderabad','andrapradesh',57890)
insert into customer values(102,'govind','seth','govind@12gmail.com','towerc','san jose','california',11345)
insert into customer values(103,'jayanth','rao','jyanth.com','towern','chennai','tamilnadu',59090)
insert into customer values(104,'anand','shrama','anand.com','towerf','hyderabad','andrapradesh',89890)
insert into customer values(105,'arunima','gowda','arunima@12gmail.com','towerh','bangalore','karnataka',577690)

select * from customer

--3. Select only the ‘first_name’ and ‘last_name’ columns fromthe customer table
select first_name,last_name from customer

--4. Select those records where ‘first_name’ starts with “G” and city is ‘SanJose’. 
select * from customer where first_name like 'g%' and city='san jose'
--_, %
