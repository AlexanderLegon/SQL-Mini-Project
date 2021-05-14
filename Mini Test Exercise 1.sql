USE northwind;

--1.1

SELECT CustomerID,CompanyName,Address,City,Region,PostalCode 
    FROM Customers
    WHERE City IN ('London', 'Paris');

--1.2

SELECT  p.ProductName, p.QuantityPerUnit 
    FROM Products p 
    WHERE QuantityPerUnit LIKE '%bottle%'

--1.3

SELECT p.ProductName, p.QuantityPerUnit, s.CompanyName AS "Supplier Name" , s.Country AS "Supplier Country" 
    FROM Products p 
    INNER JOIN Suppliers s ON s.SupplierID = p.supplierID 
    WHERE QuantityPerUnit LIKE '%bottle%'

--1.4

SELECT c.CategoryName, count(p.CategoryID) 
    AS 'Number of Catergory Occurances' FROM Categories c
    INNER JOIN Products p ON p.CategoryID = c.CategoryID
    GROUP BY c.CategoryName
    ORDER BY 'Number of Catergory Occurances' DESC


--1.5

SELECT CONCAT(TitleOfCourtesy,' ',FirstName,' ',LastName), City 
    FROM Employees 
    WHERE Country = 'UK'

--1.6

SELECT t.RegionID AS "Region", 
    FORMAT(SUM(od.Quantity*od.UnitPrice*(1-od.Discount)),'########.##') AS "Total Sales" 
    FROM [Order Details] od 
    INNER JOIN  Orders o ON od.orderID = o.OrderID
    INNER JOIN  Employees e ON  o.EmployeeID = e.EmployeeID
    INNER JOIN  EmployeeTerritories et ON e.EmployeeID = et.EmployeeID 
    INNER JOIN  Territories t ON et.TerritoryID = t.TerritoryID
    GROUP BY t.RegionID
    HAVING SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) > 1000000

--1.7

SELECT COUNT(*) AS "Total orders from the US or UK with freight amount being over 100" 
    FROM Orders 
    WHERE ShipCountry IN ('USA', 'UK') AND Freight > 100.0000;

--1.8

SELECT TOP 1 OrderID,SUM(Discount*UnitPrice*Quantity) AS "Highest Discount Value" 
    FROM [Order Details]
    GROUP BY OrderID
    ORDER BY 'Highest Discount Value' DESC
    
