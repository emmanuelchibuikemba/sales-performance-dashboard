--CREATE DATABASE SalesAnalysis
--GO
USE SalesAnalysis
GO

SELECT * FROM SalesData

--1. Compute average revenue by Region and Segment
SELECT Region, Segment, AVG(Sales) AS AvgRevenue FROM SalesData
GROUP BY Region, Segment

--2. Which product generate the highest total revenue (to identify the company's star products)
SELECT TOP 10 Product_Name, SUM(Sales) AS TotalRevenue FROM SalesData
GROUP BY Product_Name
ORDER BY TotalRevenue DESC

--3. Which product categories contribute the most to the total sales? (to know which business units drive growth)
SELECT Category, SUM(Sales) AS TotalRevenue FROM SalesData
GROUP BY Category
ORDER BY TotalRevenue DESC

--4. Which sub-category are the best performers? (Helps optimize inventory and marketing)
SELECT Sub_Category, SUM(Sales) AS TotalRevenue FROM SalesData
GROUP BY Sub_Category
ORDER BY TotalRevenue DESC

--5. Which regions generate the highest revenue? (identify the strongest markets)
SELECT Region, SUM(Sales) AS TotalRevenue FROM SalesData
GROUP BY Region
ORDER BY TotalRevenue DESC

--6. Which customer segments spend the most? (helps prioritize customer acquisition strategies)
SELECT Segment, SUM(Sales) AS TotalRevenue FROM SalesData
GROUP BY Segment
ORDER BY TotalRevenue DESC

--7. Who are the top 10 customers by total purchase? (Identify VIP customers)
SELECT TOP 10 Customer_Name, SUM(Sales) AS TotalSpent FROM SalesData
GROUP BY Customer_Name
ORDER BY TotalSpent DESC

--8. How does revenue change across different years? (Measure business growth over time)
SELECT Year, SUM(Sales) AS TotalRevenue FROM SalesData
GROUP BY Year
ORDER BY Year DESC

--9. Which quarter records the highest Sales? (To uderstand seasonality)
SELECT Quarter, SUM(Sales) AS TotalRevenue FROM SalesData
GROUP BY Quarter
ORDER BY TotalRevenue DESC

--10. Which states contribute the highest revenue? (Identify key geographic markets)
SELECT TOP 10 State, SUM(Sales) AS TotalRevenue FROM SalesData
GROUP BY State
ORDER BY TotalRevenue DESC

--11. Which shipping mode is used for the highest value orders? (evalute logistics preferneces)
SELECT Ship_Mode, SUM(Sales) AS TotalRevenue FROM SalesData
GROUP BY Ship_Mode
ORDER BY TotalRevenue DESC

--12. Which category perfoms best within each region?
SELECT Region,Category, SUM(Sales) AS TotalRevenue FROM SalesData
GROUP BY Region,Category
ORDER BY Region, TotalRevenue DESC

--13. Which cities generate the most revenue?
SELECT TOP 10 City, SUM(Sales) AS TotalRevenue FROM SalesData
GROUP BY City
ORDER BY TotalRevenue DESC

--14. Which customers purchase across multiple product categories? (identifies diversified customers who may be valueable for loyalty programs)
SELECT Customer_Name, COUNT(DISTINCT Category) AS CategoriesPurchased from SalesData
GROUP BY Customer_Name
ORDER BY CategoriesPurchased DESC

--15. Which customers contribute the highest percentage of total revenue? (identify customer concentration risk)
SELECT TOP 10 Customer_Name, SUM(Sales) AS Revenue, ROUND(SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM SalesData),2) AS RevenuePercentage
FROM SalesData
GROUP BY Customer_Name
ORDER BY Revenue DESC

--16. Which states have the highest average order value? (shows where premium purchasing occurs)
SELECT State, AVG(Sales) AS AverageOrderValue FROM SalesData
GROUP BY State
ORDER BY AverageOrderValue DESC

--17. What are the sales trends across quarters over multiple years? (detect seasonality)
SELECT Year, Quarter, SUM(Sales) as Revenue FROM SalesData
GROUP BY Year, Quarter 
ORDER BY Year, Quarter

--18. Which ship mode handles the greatest number of orders? 
SELECT Ship_Mode, COUNT(DISTINCT Order_ID) AS TotalOrders FROM SalesData
GROUP BY Ship_Mode
ORDER BY TotalOrders DESC

--19. Which products are purchased by the largest number of unique customers? (identifies product with broad customer appeal)
SELECT TOP 10 Product_Name, COUNT(DISTINCT Customer_ID) AS UniqueCustomers FROM SalesData
GROUP BY Product_Name
ORDER BY UniqueCustomers DESC

--20. Which customers buy from the widest range of sub-categories? (identifies highly engaged customers)
SELECT TOP 20 Customer_Name, COUNT(DISTINCT Sub_Category) AS DiversityofPurchase FROM SalesData
GROUP BY Customer_Name
ORDER BY DiversityofPurchase DESC

