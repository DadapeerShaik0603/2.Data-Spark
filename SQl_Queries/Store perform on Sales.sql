WITH SalesData AS (
    SELECT
        s.StoreKey,
        SUM(p.UnitPriceUSD * s.Quantity) AS TotalRevenue,
	SUM((p.UnitPriceUSD - p.UnitCostUSD)* s.Quantity) As TotalProfit
    FROM
        sales s
    JOIN
        products p ON s.ProductKey = p.ProductKey
    GROUP BY
        s.StoreKey
        ORDER BY TotalProfit
)

SELECT
    s.StoreKey,
    TotalRevenue,
    TotalProfit
FROM
    SalesData s
JOIN
    stores st ON s.StoreKey = st.StoreKey
ORDER BY
    TotalRevenue DESC;

