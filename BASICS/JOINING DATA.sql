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
--or in a good manner 

SELECT 
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id

-- LEFT JOIN
/* 2nd Ques- Get all customers along with their orders , including those without orders */

SELECT 
   c.id,
   c.first_name,
   o.order_id,
   o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id

-- RIGHT JOIN
/* 3rd Ques- Get all customers along with their orders , 
including orders  without matching customers */

SELECT 
   c.id,
   c.first_name,
   o.order_id,
   o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON  c.id = o.customer_id 

-- FULL JOIN
/* 4th Ques- Get all customers and all orders ,even if there's no match */

SELECT 
   c.id,
   c.first_name,
   o.order_id,
   o.sales
FROM customers AS c
FULL JOIN orders AS o
ON  c.id = o.customer_id 