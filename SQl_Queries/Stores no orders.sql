SELECT s.StoreKey
	FROM stores s
	LEFT JOIN Sales sa ON s.StoreKey = sa.StoreKey
	WHERE sa.StoreKey IS NULL;
