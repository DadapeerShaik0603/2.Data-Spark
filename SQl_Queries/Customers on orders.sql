WITH CustomerOrders AS (
    SELECT 
        s.CustomerKey,
        COUNT(s.OrderNumber) AS OrderCount
    FROM 
        Sales s
    GROUP BY 
        s.CustomerKey
)
SELECT 
    c.CustomerKey,
    COALESCE(co.OrderCount, 0) AS OrderCount,
    CASE
        WHEN COALESCE(co.OrderCount, 0) > 10 THEN 'Loyal Customer'
        WHEN COALESCE(co.OrderCount, 0) BETWEEN 5 AND 10 THEN 'Periodic Buyer'
        WHEN COALESCE(co.OrderCount, 0) BETWEEN 1 AND 4 THEN 'Normal Customer'
        ELSE 'No Orders'
    END AS CustomerOrderingType
FROM 
    Customers c
LEFT JOIN
    CustomerOrders co ON c.CustomerKey = co.CustomerKey
	ORDER BY OrderCount DESC;
