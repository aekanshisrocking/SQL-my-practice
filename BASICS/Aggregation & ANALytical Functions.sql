-- Aggregation & Analytical Functions  
-- Q1 - ANALYZE sales in the table ordes in all way COUNT, SUM, AVG, MAX, MIN 

SELECT 
customer_id,
COUNT(*) AS total_orders,
SUM(sales) AS total_sales,
AVG(sales) AS avg_sales,             -- EX 
MAX(sales) AS highest_sales,
MIN(sales) AS lowest_sales
FROM orders
GROUP BY customer_id

-- Q1- Find the total Sales for each product. Additionally provide details such order Id, order date 

SELECT 
OrderID,
OrderDate,
ProductID,
SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY                                       -- BY doing this we can see total sales are destroyed so 
       OrderID,                                -- this way is wrong
       OrderDate,
       ProductID

-- now the correct way with the help of - WINDOW Function 
SELECT 
    OrderID,
    OrderDate,
    ProductID,
    SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProduct 
FROM Sales.Orders

-- Find the highest and lowest sales of all orders 
-- Find the highest and lowest sales for each product
-- Additionally provide details such order Id, order date 

SELECT 
OrderID,
OrderDate,
ProductID,
MAX(Sales) OVER() HighestSales,
MIN(Sales) OVER() LowestSales,
MAX(Sales) OVER(PARTITION BY ProductID) HighestSalesByProduct,
MIN(Sales) OVER(PARTITION BY ProductID) LowestSalesByProduct
FROM Sales.Orders

-- Show the employees who have the highest salaries 

SELECT *
FROM (
SELECT *,
MAX(Salary) OVER() HighestSalary
FROM Sales.Employees
)t WHERE Salary =  HighestSalary

-- Find the deviation of each sales from the minimum and maximum sales amounts 

SELECT 
     OrderID,
     OrderDate,
     ProductID,
     Sales,
     MAX(Sales) OVER() HighestSales,
     MIN(Sales) OVER() LowestSales,
     Sales - MIN(Sales) OVER() DeviationFromMin
FROM Sales.Orders