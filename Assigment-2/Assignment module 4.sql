-------------------------------------Assignment 4------------------------------------------------

--1. Use the inbuilt functions and find the minimum, maximum and average amount from the orders table
select min(amount) as min_amount,max(amount) as max_amount,avg(amount) as avg_amount from orders

--2. Create a user-defined function which will multiply the given number with 10
create function multiply_10(@num int)
returns int
as begin
return(@num*10)
end 

select dbo.multiply_10(20)

--3. Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and print the corresponding value.
select 
case
when 100<200 then '100 is less than 200'
when 100>200 then '100 is greater than 200'
else '100 is equal to 200'
end
