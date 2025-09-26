-- 1. Total sales amount
SELECT SUM(Amount) AS TotalSales
FROM Orders;

-- 2. Average order amount
SELECT AVG(Amount) AS AvgOrderValue
FROM Orders;

-- 3. Number of orders per customer
SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID;

-- 4. Total amount spent per customer
SELECT CustomerID, SUM(Amount) AS TotalSpent
FROM Orders
GROUP BY CustomerID;

-- 5. Customers with total spending greater than 500 (HAVING)
SELECT CustomerID, SUM(Amount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
HAVING SUM(Amount) > 500;

-- 6. Orders grouped by city
SELECT C.City, COUNT(O.OrderID) AS OrdersCount, SUM(O.Amount) AS TotalSales
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.City;

-- 7. Orders per month (GROUP BY with DATE functions)
SELECT strftime('%m', OrderDate) AS Month, SUM(Amount) AS MonthlySales
FROM Orders
GROUP BY Month;

-- 8. Orders per city with average order value
SELECT C.City, AVG(O.Amount) AS AvgOrderValue
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.City;

-- 9. Customers from New York only (GROUP BY + WHERE)
SELECT C.City, C.CustomerID, SUM(O.Amount) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE C.City = 'New York'
GROUP BY C.CustomerID;

-- 10. Cities with more than 2 customers having placed orders (HAVING)
SELECT C.City, COUNT(DISTINCT C.CustomerID) AS UniqueCustomers
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.City
HAVING COUNT(DISTINCT C.CustomerID) > 2;

-- 11. Top spending customer per city (GROUP BY city, HAVING + subquery)
SELECT C.City, C.CustomerID, SUM(O.Amount) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.City, C.CustomerID
HAVING SUM(O.Amount) = (
    SELECT MAX(SumAmt)
    FROM (
        SELECT SUM(O2.Amount) AS SumAmt
        FROM Customers C2
        JOIN Orders O2 ON C2.CustomerID = O2.CustomerID
        WHERE C2.City = C.City
        GROUP BY C2.CustomerID
    )
);
