-- SQL first basic queries 

-- 1st SELECT Query
-- 1st question- Retrive all Order Data  

SELECT *
FROM customers

-- 2nd question - Retrive each customer's name, country, and score. 

SELECT 
first_name,
country,
score
FROM customers

-- 2nd WHERE Query
-- 1st question - Retrive customers with a score not equal to 0

SELECT *
FROM customers
WHERE score != 0

-- 2nd Question - Retrive customers from Germmany 

SELECT *
FROM customers
WHERE country = 'Germany' 

-- 3rd ORDER BY Query
-- 1st question - Retrive all customers and sort the results by the highest score first. */

SELECT *
FROM customers
ORDER BY score DESC 

/* 2nd question for nested ORDER BY- Retrive all customers and sort the results by the country and then 
by the highest score . */

SELECT *
FROM customers
ORDER BY country ASC, score DESC