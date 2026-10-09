-- FILTERING DATA 
--  WHERE OPERATORS --

-- Comparison Operators 
-- 1st Ques- Retrive all customers from Germany ( = Operator )

SELECT *
FROM customers
WHERE country = 'Germany'

-- 2nd Ques- Retrive all customers who are not from Germany ( !=/ <> Operator )

SELECT *
FROM customers
WHERE country != 'Germany'

-- 3rd Ques- Retrive all customers with a score greater than 500 ( > Operator )

SELECT *
FROM customers
WHERE score > 500

-- 4th Ques- Retrive all customers with a score less than 500 ( < Operator )

SELECT *
FROM customers
WHERE score < 500

-- 5th Ques- Retrive all customers with a score of 500 or more ( >= Operator )

SELECT *
FROM customers
WHERE score >= 500

-- 6th Ques- Retrive all customers with a score of 500 or less ( <= Operator )

SELECT *
FROM customers
WHERE score <= 500

-- Logical Operators
/* 1st Ques- Retrive all customers who are from USA and 
have a score greater than 500 ( AND - Operator ) */

SELECT *
FROM customers
WHERE country = 'USA' AND score > 500

/* 2nd Ques- Retrive all customers who are either from USA or 
have a score greater than 500 ( OR - Operator ) */

SELECT *
FROM customers
WHERE country = 'USA' OR score > 500

/* 3rd Ques- Retrive all customers with a score not less than 500 ( OR - Operator ) */

SELECT *
FROM customers
WHERE NOT score < 500 

-- RANGE  Operators
/* 1st Ques- Retrive all customers whose score falls 
in the range between 100 and 500 ( BETWEEN - Operator ) */

SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500
--or 
SELECT *
FROM customers
WHERE score >= 100 AND score <= 500

-- MEMBERSHIP Operators
/* 1st Ques- Retrive all customers from either Germany or USA ( IN - Operator ) */

SELECT *
FROM customers
WHERE country IN ('Germany', 'USA')

/* 2nd Ques- Retrive all customers neither from Germany  nor USA ( NOT IN - Operator ) */

SELECT *
FROM customers
WHERE country NOT IN ('Germany', 'USA')

--SEARCH Operators 
-- 1st question - Find all customers whose first name start with 'M' (LIKE - Operator)

SELECT *
FROM customers
WHERE first_name LIKE 'M%'

-- 2nd question - Find all customers whose first name ends with 'n' (LIKE - Operator)

SELECT *
FROM customers
WHERE first_name LIKE '%n'

-- 3rd question - Find all customers whose first name contains 'r' (LIKE - Operator)

SELECT *
FROM customers
WHERE first_name LIKE '%r%'

/* 4th question - Find all customers whose first
name has 'r' in the 3rd position  (LIKE - Operator) */

SELECT *
FROM customers
WHERE first_name LIKE '__r%'