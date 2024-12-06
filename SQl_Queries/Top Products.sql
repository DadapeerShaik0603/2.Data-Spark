SELECT 
    p.ProductKey,
    p.ProductName,
    SUM(s.Quantity) AS TotalUnitsSold,
    SUM(p.UnitPriceUSD * s.Quantity) AS TotalRevenue
FROM 
    Sales s
JOIN 
    Products p ON s.ProductKey = p.ProductKey
GROUP BY 
    p.ProductKey, p.ProductName
ORDER BY 
    TotalRevenue DESC
LIMIT 10;
