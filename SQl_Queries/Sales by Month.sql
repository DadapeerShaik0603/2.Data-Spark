SELECT 
    s.Month AS SaleMonth,
    SUM(s.Quantity) AS TotalUnitsSold,
    SUM(p.UnitPriceUSD * s.Quantity) AS TotalRevenue
FROM 
    merged_data s
JOIN 
    Products p ON s.ProductKey = p.ProductKey
GROUP BY 
    SaleMonth
ORDER BY 
    TotalRevenue ;
