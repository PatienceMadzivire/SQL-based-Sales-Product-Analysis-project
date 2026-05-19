SELECT * FROM train;
-----Data quality check
SELECT COUNT(*) FROM train WHERE Product_ID IS NULL OR Sales IS NULL;

-----Top products
SELECT Product_Name, SUM(Sales) AS TotalSales
FROM train
GROUP BY Product_Name
ORDER BY TotalSales DESC
LIMIT 10;

-----Category performance
SELECT Category, SUM(Sales) AS CategorySales
FROM train
GROUP BY Category
ORDER BY CategorySales DESC;

-------Sub-category performance
SELECT Sub_Category, SUM(Sales) AS SubCategorySales
FROM train
GROUP BY Sub_Category
ORDER BY SubCategorySales DESC;

-----Regional insights
SELECT Region, SUM(Sales) AS RegionalSales
FROM train
GROUP BY Region
ORDER BY RegionalSales DESC;

-- Top 10 products by sales
SELECT Product_Name, SUM(Sales) AS Revenue
FROM train
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 10;

-- Segment-level performance
SELECT Segment, SUM(Sales) AS SegmentRevenue
FROM train
GROUP BY Segment
ORDER BY SegmentRevenue DESC;

-- Monthly trends
SELECT 
    strftime('%Y', Order_Date) AS Year,
    strftime('%m', Order_Date) AS Month,
    ROUND(SUM(Sales), 2) AS MonthlyRevenue
FROM train
GROUP BY Year, Month
ORDER BY Year, Month;