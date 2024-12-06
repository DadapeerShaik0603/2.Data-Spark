SELECT
	StoreKey,
        COUNT(DISTINCT s.CustomerKey) AS NumberOfCustomers,
        COUNT(s.OrderNumber) AS NumberOfOrders,
        SUM(p.UnitPriceUSD * s.Quantity) AS TotalRevenue
    FROM 
        Sales s
    JOIN 
        Products p ON s.ProductKey = p.ProductKey
    WHERE 
        s.StoreKey = 0
