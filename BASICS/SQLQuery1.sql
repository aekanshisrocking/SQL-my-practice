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

-- 4th GROUP BY Query
-- 1st question - Find the total sccore for each country

SELECT 
     country,
     SUM(score) AS total_score
FROM customers
GROUP BY country

-- 2nd question - Find the total score and total number of customers for each country

SELECT 
     country,
     SUM(score) AS total_score,
     COUNT(id) AS total_customers
FROM customers
GROUP BY country

-- 5th HAVING Query
/* 1st question -- Find the average score for each country
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430 */

SELECT
    country,
    AVG(score) AS avg_score 
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430

-- 6th DISTINCT Query
/* 1st question -- Return unique list of all country */

SELECT DISTINCT
    country 
FROM customers

-- 6th TOP Query
/* 1st question -- Retrive the TOP three customers with the Highest score */

SELECT TOP 3*
FROM customers
ORDER BY score DESC 

-- 2nd question -- Retrive the two most recent orders 

SELECT TOP 2*
FROM orders
ORDER BY order_date DESC 