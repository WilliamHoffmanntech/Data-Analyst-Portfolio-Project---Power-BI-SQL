SELECT 
  c.CustomerKey, 
  SUM(SalesAmount) AS SalesPerCustomer
FROM 
  [AdventureWorksDW2019].[dbo].[FactInternetSales] AS f 
  LEFT JOIN dbo.DimCustomer AS c ON f.CustomerKey = c.CustomerKey 
GROUP BY 
  c.CustomerKey;
