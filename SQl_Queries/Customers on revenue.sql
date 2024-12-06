WITH CustomerRevenue AS (
    SELECT 
        s.CustomerKey,
        SUM(p.UnitPriceUSD * s.Quantity) AS TotalRevenue,
	SUM((p.UnitPriceUSD - p.UnitCostUSD)* s.Quantity) As TotalProfit
    FROM 
        Sales s
    JOIN 
        Products p ON s.ProductKey = p.ProductKey
    GROUP BY 
        s.CustomerKey
)
SELECT 
    c.CustomerKey,
    COALESCE(cr.TotalRevenue, 0) AS TotalRevenue,
    COALESCE(cr.TotalProfit, 0) AS TotalProfit
FROM 
    Customers c
LEFT JOIN
    CustomerRevenue cr ON c.CustomerKey = cr.CustomerKey
    ORDER BY TotalProfit DESC
    
