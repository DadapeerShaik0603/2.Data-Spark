SELECT 
    StoreKey,
    OpenDate,
    TIMESTAMPDIFF(YEAR, OpenDate, CURDATE()) AS StoreAge
FROM 
    Stores
ORDER BY  StoreAge DESC