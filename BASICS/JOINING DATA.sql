-- JOINING DATA 

-- NO JOIN 
-- 1st Question
/* Retrieve all data from customers and orders in two different results */

SELECT *
FROM customers

SELECT *
FROM orders

-- INNER JOIN
/* 1st Ques- Get all customers along with their orders , but only for customers
who have placed an order */

SELECT *
FROM customers
INNER JOIN orders 
ON id = customer_id