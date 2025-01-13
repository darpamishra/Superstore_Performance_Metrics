CREATE DATABASE Superstore_DB;

USE Superstore_DB;

SELECT * FROM Superstore;



--- 1. Identify the top 5 products contributing to the highest profits

SELECT TOP 5 Product_Name, CAST(SUM(Profit) AS DECIMAL (10,2)) AS Total_Profit
FROM Superstore
GROUP BY Product_Name
ORDER BY Total_Profit DESC;



-- 2. Find the states with the highest total sales


SELECT TOP 5 State, CAST (SUM(Sales)AS DECIMAL(10,2)) AS Total_Sales
FROM Superstore
GROUP BY State
ORDER BY Total_Sales DESC;



-- 3. Determine the total profit percentage by each category


SELECT Category, CAST(SUM(Profit) AS DECIMAL(10,2)) AS Sum_Profit,
CAST((SUM(Profit) * 100.0 / SUM(SUM(Profit)) OVER ()) AS DECIMAL(10,2)) AS Profit_Percentage
FROM Superstore
GROUP BY Category;



-- 4. Identify the top 3 customer segments by total sales


SELECT TOP 3 Segment, CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER ()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM Superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;



-- 5. Calculate the total profit and sales for each shipping mode


SELECT Ship_Mode, CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(Profit) AS DECIMAL(10,2)) AS Total_Profit
FROM Superstore
GROUP BY Ship_Mode;



-- 6. Find the product sub-category with the highest total quantity sold


SELECT TOP 5 Sub_Category, SUM(Quantity) AS Total_Quantity
FROM Superstore
GROUP BY Sub_Category
ORDER BY Total_Quantity DESC;



-- 7. Determine the sales trend over time (monthly)


SELECT FORMAT(Order_Date, 'yyyy-MM') AS Month, FORMAT(SUM(Sales), 'N2') AS Total_Sales
FROM Superstore
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY Month;

