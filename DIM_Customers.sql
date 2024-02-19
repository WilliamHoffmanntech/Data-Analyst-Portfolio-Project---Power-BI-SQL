-- Cleansed DIM_Customer Table --
SELECT 
  c.customerkey AS CustomerKey, 
  -- ,[GeographyKey]
  -- ,[CustomerAlternateKey]
  -- ,[Title]
  c.firstname AS [First Name], 
  -- ,[MiddleName]
  c.lastname AS [Last Name], 
  c.firstname + ' ' + c.lastname AS [Full Name], 
  -- ,[NameStyle]
  -- ,[BirthDate]
  -- ,[MaritalStatus]
  -- ,[Suffix]
  CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender,
  -- ,[EmailAddress]
  -- ,[YearlyIncome]
  -- ,[TotalChildren]
  -- ,[NumberChildrenAtHome]
  -- ,[EnglishEducation]
  -- ,[SpanishEducation]
  -- ,[FrenchEducation]
  -- ,[EnglishOccupation]
  -- ,[SpanishOccupation]
  -- ,[FrenchOccupation]
  -- ,[HouseOwnerFlag]
  -- ,[NumberCarsOwned]
  -- ,[AddressLine1]
  -- ,[AddressLine2]
  -- ,[Phone] 
  c.datefirstpurchase AS DateFirstPurchase, 
  -- ,[CommuteDistance]
  g.city AS [Customer City] -- Joined in Customer City from Geography Table
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] AS c
  LEFT JOIN dbo.DimGeography AS g ON g.geographykey = c.geographykey
WHERE 
  LEFT (DateFirstPurchase, 4) >= YEAR(GETDATE()) - 2 -- Ensures we always only bring two years of date from extraction.
ORDER BY
  CustomerKey ASC -- Order List by CustomerKey
