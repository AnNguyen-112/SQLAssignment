USE Northwind
GO

 --1. List all cities that have both Employees and Customers.
SELECT DISTINCT e.City
FROM Employees e JOIN Customers c ON e.City = c.City
ORDER BY e.City;

--or
SELECT DISTINCT City
FROM Employees
WHERE City in (
	SELECT City FROM Customers
)

--2.      List all cities that have Customers but no Employee.

--a.      Use sub-query
SELECT CITY 
FROM CUSTOMERS
WHERE CITY NOT IN
(
	SELECT City
	FROM Employees
)
--b.      Do not use sub-query
SELECT c.City
FROM CUSTOMERS c LEFT JOIN EMPLOYEES e On c.City = e.City
WHERE E.City is null
Order By c.City



--3.      List all products and their total order quantities throughout all orders.
SELECT p.ProductID, p.ProductName, Sum (od.Quantity) AS [Total Order Quantities]
FROM PRODUCTS p JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName

--4.      List all Customer Cities and total products ordered by that city.
SELECT c.City, Sum (od.Quantity) as [Total Products]
FROM CUSTOMERS c Join Orders o On c.CustomerID = o.CustomerID
JOIN [Order Details] OD ON o.OrderID = od.OrderID
GROUP BY c.City

--5.      List all Customer Cities that have at least two customers.


--6.      List all Customer Cities that have ordered at least two different kinds of products.

--7.      List all Customers who have ordered products, but have the ‘ship city’ on the order different from their own customer cities.

--8.      List 5 most popular products, their average price, and the customer city that ordered most quantity of it.

--9.      List all cities that have never ordered something but we have employees there.

--a.      Use sub-query

--b.      Do not use sub-query

--10.  List one city, if exists, that is the city from where the employee sold most orders (not the product quantity) is, and also the city of most total quantity of products ordered from. (tip: join  sub-query)

--11. How do you remove the duplicates record of a table?