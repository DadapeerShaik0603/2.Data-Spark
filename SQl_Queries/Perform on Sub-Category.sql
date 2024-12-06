SELECT
        p.SubcategoryKey,
        SUM((pr.UnitPriceUSD - pr.UnitCostUSD) * s.Quantity) AS ProfitUSD,
        SUM((pr.UnitPriceUSD) * s.Quantity) AS RevenueUSD
    FROM
        Sales s
    JOIN
        Products pr ON s.ProductKey = pr.ProductKey
    JOIN
        Products p ON pr.CategoryKey = p.CategoryKey
    GROUP BY
        p.SubcategoryKey
    ORDER BY RevenueUSD    
