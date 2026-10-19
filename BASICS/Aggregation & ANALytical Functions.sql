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

-- PARTITION BY -- EXamples 
--Q1 - Find the total sales across all orders Additionally provide details such order Id, order date 

SELECT 
OrderID,
OrderDate,
SUM(Sales) OVER() TotalSales
FROM Sales.Orders 

/* Q2- Find the total sales for each product ,Find the total sales for each combination of product and 
orde status Additionally provide details such order Id, order date  */

SELECT 
OrderID,
OrderDate,
ProductID,
OrderStatus,
Sales,
SUM(Sales) OVER(PARTITION BY ProductID) TotalProductSales,
SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus) SalesByPandS
FROM Sales.Orders

-- ORDER BY - 
-- Q1- Rank each order based on their sales from highest to lowest 
-- ADditionally provide details such order Id, order date 

SELECT 
OrderID,
OrderDate,
Sales,
RANK() OVER(ORDER BY Sales DESC) RankSales
FROM Sales.Orders


-- WINDOW FRAME -- EXamples 

SELECT
OrderID,
OrderDate,
OrderStatus,
Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate 
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) TotalSales 
FROM Sales.Orders

-- WINDOW Function RULE 3 --
-- Find the total sales for each order status, only for two products 101 and 102

SELECT 
OrderID,
OrderStatus,
Sales,
SUM(Sales) OVER (PARTITION BY OrderStatus) Totalorderst
FROM Sales.Orders
WHERE ProductID IN (101,102)

-- 4th RULE Ex- 
-- RANK Customers based on their total sales 

SELECT 
CustomerID,
SUM(Sales) TotalSales,
RANK() OVER(ORDER BY SUM(Sales) DESC) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID

-- Aggregate WINDOW Functions - 
-- COUNT --
-- Q1- Find The total no. of orders - Find the total no. of Orders for each customers ,
-- Additionally provide details such order Id, Order date 

SELECT 
OrderID,
OrderDate,
CustomerID,
COUNT(*) OVER() TotalOrders,
COUNT(*) OVER(PARTITION BY CustomerID) TotalOrderByCust
FROM Sales.Orders

-- Q2- Q1- Find The total no. of Customers - Find the total no. of Scors from the customers ,
-- Additionally provide All customers details 

SELECT *,
COUNT(*) OVER() TotalCustomers,
COUNT(Score) OVER() TotalScores
FROM Sales.Customers

--Q3- Check wheather the table 'orders' contains any duplicate rows 

SELECT 
OrderID,
COUNT(*) OVER(PARTITION BY OrderID) CheckPK
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