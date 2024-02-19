**************************************************************************************************************
**************************************************************************************************************
***	Author: William Hoffmann                                                     *************************
***	Project: Sales Team Dashboard                                                *************************
***	Tools: MSSQL and PowerBI                                                     *************************
**************************************************************************************************************
**************************************************************************************************************



Setup - For this project we are using MSSQL database AdventureWorksDW2019. After updating the database, we read the example Business Request and analyze Sales Teams needs.
We then make a Business Demand Overview rubric. We are also given the SalesBudget for the years 2022 and 2023.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Data Cleaning - Create five views 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FACT_InternetSales - Create a view from FactInternetSales that returns the columns
[ProductKey] 
[OrderDateKey] 
[DueDateKey] 
[ShipDateKey] 
[CustomerKey]
[SalesOrderNumber] 
[SalesAmount] 
WHERE OrderDateKey is the last 2 years and ORDER BY OrderDateKey ASC

We then save our query and table created for PowerBI
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DIM_Products - Create a view from DimProduct as p then LEFT JOINs with DimProductSubCategory as ps and DimProductCategory as pc that returns the cloumns
p.[ProductKey]
p.[ProductAlternateKey] AS ProductItemCode
p.[EnglishProductName] AS [Product Name] 
ps.EnglishProductSubcategoryName AS [Sub Category]
pc.EnglishProductCategoryName AS [Product Category]
p.[Color] AS [Product Color]
p.[Size] AS [Product Size]
p.[ProductLine] AS [Product Line]
p.[ModelName] AS [Product Model Name]
p.[EnglishDescription] AS [Product Description]
If p.Status ISNULL then set NULL to 'outdated'

We then save our query and table created for PowerBI
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DIM_Customers - Create a view from DimCustomer as c then LEFT JOIN DimGeography as g so we can match Customer and Geaography by geoagraphykey
that returns the columns
c.customerkey AS CustomerKey
c.firstname AS [First Name]
c.lastname AS [Last Name]
c.firstname + ' ' + c.lastname AS [Full Name]
CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender
c.datefirstpurchase AS DateFirstPurchase
g.city AS [Customer City]
WHERE Date is the last 2 years
ORDER BY CustomerKey ASC

We then save our query and table created for PowerBI
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DIM_Calendar - Create a view from DimCalendar that returns 
[DateKey]
[FullDateAlternateKey] AS Date
[EnglishDayNameOfWeek] AS Day
[EnglishMonthName] AS Month
Left([EnglishMonthName], 3) AS MonthShort
[MonthNumberOfYear] AS MontheNO
[CalendarQuarter] AS Quarter
[CalendarYear] AS Year
WHERE CalendarYear is greater than or equal to 2022

We then save our query and table created for PowerBI
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DIM_SalesPerCustomer - Create a view from FactInternetSales as f then LEFT JOIN DimCustomer as c that returns the columns
c.CustomerKey
SUM(SalesAmount) AS SalesPerCustomer
GROUP BY c.CustomerKey

We then save our query and table created for PowerBI
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PowerBI Dashboard
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Sales Overview - Dashboard that shows Sales Team the top 10 customers and products bar chart, customer location on map, sales vs budget KPI, sales by product category donut chart,
and sales vs budget line chart with interactive slicers for year, month, city, product name, product  category and product  subcategory
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Customer details - Dashboard that shows Sales Team the top 10 customers bar chart, customer location on map, sales and budget card, customer sales/total sales pivot table,
and sales vs budget line chart with interactive slicers for year, month, city, product name, product  category and product  subcategory
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Product details - Dashboard that shows Sales Team the top 10 products bar chart, customer location on map, sales and budget card, product category and name sales/total sales pivot table,
and sales vs budget line chart with interactive slicers for year, month, city, product name, product  category and product  subcategory























