Use Northwind

-- 3.1

SELECT ee.employeeID,CONCAT(ee.FirstName,' ',ee.LastName) AS "Employee Name",
    CONCAT(e.FirstName,' ',e.LastName) AS "Reports to" 
    FROM Employees ee
    LEFT JOIN Employees e ON ee.reportsTO = e.employeeID

-- 3.2

SELECT s.CompanyName, SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) AS "Supplier Total"
    FROM Suppliers s
    INNER JOIN Products p ON p.SupplierID = s.SupplierID
    INNER JOIN [Order Details] od ON od.ProductID = p.ProductID
    GROUP BY s.CompanyName
    HAVING (SUM(od.Quantity*od.UnitPrice*(1-od.Discount))) > 10000
    ORDER BY 'Supplier Total' DESC

-- 3.3

SELECT TOP 10 c.CompanyName, ROUND(SUM(od.UnitPrice*od.Quantity*(1-od.Discount)),2) AS "Total Spent"
    FROM Orders o
    INNER JOIN Customers c ON c.CustomerID = o.CustomerID
    INNER JOIN [Order Details] od ON od.OrderID = o.OrderID 
    WHERE YEAR(o.ShippedDate) = (SELECT MAX(YEAR(o.ShippedDate)) FROM Orders o) -- could do order date then a not null for shipped date in this subquery to make sure its valid
    GROUP BY c.CompanyName
    ORDER BY 'Total Spent' DESC

-- 3.4

SELECT CONCAT(LEFT(DATENAME(MONTH,DATEADD( month, MONTH(OrderDate),-1)),3),'-',YEAR(OrderDate)) AS "Date",
    AVG(CAST(DATEDIFF(dd,OrderDate,ShippedDate)AS decimal(4,2)) ) AS "Average Ship Time By Month"
    FROM Orders
    GROUP BY  YEAR(OrderDate), MONTH(OrderDate)
    ORDER BY  YEAR(OrderDate), MONTH(OrderDate)

