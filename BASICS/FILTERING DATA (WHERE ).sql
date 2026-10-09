-- FILTERING DATA 
-- WHERE OPERATORS 
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