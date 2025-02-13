--Join (Juntar) INNER (Default), LEFT (), RIGHT (), CROSS (), FULL (). 
use Northwind;
--Seleccionar todas las categorias y productos
Select * from 
Categories 
INNER JOIN 
Products 
on Categories.CategoryID = Products.CategoryID;

Select Categories.CategoryID,CategoryName, ProductName, UnitsInStock, UnitPrice from 
Categories 
INNER JOIN 
Products 
on Categories.CategoryID = Products.CategoryID;

Select C.CategoryID,CategoryName as 'Nombre de la Categoria', ProductName as 'Nombre del Producto', UnitsInStock as 'Existencia', UnitPrice as 'Precio' from 
Categories as C
INNER JOIN 
Products as P
on C.CategoryID = P.CategoryID;

-- Seleccionar los productos de la categoria beverages y condiments donde la existencia este entre 18 y 30

Select P.ProductID as 'Numero de Producto', P.ProductName as 'Nombre del Producto', C.CategoryID as 'Numero de Categoria',C.CategoryName as 'Nombre Categoria', UnitPrice as 'Precio', UnitsInStock as 'Existencia'
from Products as P inner join Categories as C on C.CategoryID = P.CategoryID
where (C.CategoryName in('Beverages','Condiments')) and P.UnitsInStock between 18 and 30;

-- Seleccionar los productos y sus importes realizados de marzo a junio de 1996,
-- mostrando la fecha de la orden, el id del producto y el importe

Select O.OrderDate, OD.ProductID, OD.OrderID, (OD.UnitPrice * OD.Discount)  from Orders as O inner join [Order Details] AS OD 
ON OD.OrderID = O.OrderID WHERE O.OrderDate between '1996-01-07' and '1996-30-10'

--Mostrar total de ventas de la sonsulta anterior

Select concat('$', ' ', sum(OD.Quantity * OD.UnitPrice)) as 'Importe' from Orders as O inner join [Order Details] AS OD 
ON OD.OrderID = O.OrderID WHERE O.OrderDate between '1996-01-07' and '1996-30-10'

--Consultas Basicas con Inner Join

--1. Obtener los nombres de los clientes y los paises a los que se enviaron sus pedidos

Select C.CompanyName as 'Nombre', O.ShipCountry as 'Pais de Envio' from Customers as C inner join Orders as O on C.CustomerID = O.CustomerID order by 2 desc ;

Select C.CompanyName as 'Nombre', O.ShipCountry as 'Pais de Envio' from Orders as O INNER JOIN Customers as C on O.CustomerID = C.CustomerID order by 2 desc ;

--2. Obtener los productos y sus respectivos proveedores

Select P.ProductName as 'Nombre Producto', S.CompanyName as 'Nombre del Proveedor' from Products as P inner join Suppliers as S on P.SupplierID = S.SupplierID;

Select P.ProductName as 'Nombre Producto', S.CompanyName as 'Nombre del Proveedor' from Products as P inner join Suppliers as S on P.SupplierID = S.SupplierID;

--3. Obtener los pedidos y los empleados que los gestionaron

Select * from Employees

Select O.OrderID, concat(E.Title,'-', E.FirstName, '-', E.LastName) as 'Nombre', O.OrderDate from Orders as O inner join Employees as E on O.EmployeeID = E.EmployeeID;

Select O.OrderID, concat(E.Title,'-', E.FirstName, '-', E.LastName) as 'Nombre' from Orders as O inner join Employees as E on O.EmployeeID = E.EmployeeID;

--4. Listarlos productos junto con sus precios y la categoria que pertenecen

Select P.ProductName, P.UnitPrice, C.CategoryName from Products as P inner join Categories as C on P.CategoryID = C.CategoryID;

--5. Obtener el nombre del cliente, numero de orden y la fecha de orden

Select C.CompanyName, O.OrderID, O.OrderDate from Customers as C inner join Orders as O on C.CustomerID = O.CustomerID;

--6. Listar las ordenes mostrando el numero de orden, el nombre de producto y la cantidad del producto

Select O.OrderID, OD.ProductID, OD.Quantity from Orders as O inner join [Order Details] as OD on OD.OrderID = O.OrderID;
--Correcto
Select OD.OrderID as 'Numero de orden', P.ProductName as 'Nombre del Producto', OD.Quantity as 'Cantidad' from Products as P inner join [Order Details] as OD on OD.ProductID = P.ProductID;

Select top 5 OD.OrderID as 'Numero de orden', P.ProductName as 'Nombre del Producto', OD.Quantity as 'Cantidad' from Products as P inner join [Order Details] as OD on OD.ProductID = P.ProductID order by OD.Quantity desc;

Select OD.OrderID as 'Numero de orden', P.ProductName as 'Nombre del Producto', OD.Quantity as 'Cantidad' from Products as P inner join [Order Details] as OD on OD.ProductID = P.ProductID where OD.OrderID = 11031 order by OD.Quantity desc;

Select OD.OrderID ,COUNT(*) as 'Cantidad de productos vendidos' from Products as P inner join [Order Details] as OD on OD.ProductID = P.ProductID group by OD.OrderID order by OD.OrderID desc;

Select * from [Order Details] as OD where OD.OrderID = 1107;

--7. Obtener los empleados y sus respectivos jefes

Select EJ.EmployeeID, concat(E.Title,' - ', E.FirstName, ' - ', E.LastName) as 'Nombre', EJ.ReportsTo as 'Numero de Jefe', concat(E.Title,' - ', E.FirstName, ' - ', E.LastName) as 'Nombre Jefe' from Employees as E inner join Employees as EJ on E.EmployeeID = EJ.ReportsTo;

Select EJ.EmployeeID, concat(E.Title,' - ', E.FirstName, ' - ', E.LastName) as 'Nombre', CONCAT(EJ.ReportsTo,' - ', EJ.FirstName,' - ', EJ.LastName) as 'Numero de Jefe' from Employees as E inner join Employees as EJ on E.EmployeeID = EJ.ReportsTo;

--8. Listar los pedidos y el nombre de la empresa de transporte utilizada

Select O.OrderID as 'Numero de Pedido', S.CompanyName as 'Nombre de la compania' from Orders as O inner join Shippers as S on O.ShipVia = S.ShipperID;

-- Consultas inner join Intermedias 

--9. Obtener la cantidad total de prodcutos vendidos por categoria

Select * from Products as P inner join Categories as C on ;

Select C.CategoryName as 'Nombre Categoria', sum (Quantity) as 'Productos Vendidos'  from Categories as C INNER JOIN Products as P on C.CategoryID = P.CategoryID INNER JOIN [Order Details] as OD on OD.ProductID = P.ProductID group by C.CategoryName order by C.CategoryName;


--10. Obtener el total de ventas por empleado


Select CONCAT(E.FirstName, E.LastName) as 'Nombre' , 
sum(((OD.Quantity * OD.UnitPrice)) - (OD.Quantity * OD.UnitPrice) * OD.Discount) as Ventas
from Orders as O INNER JOIN Employees as E on O.EmployeeID = E.EmployeeID 
INNER JOIN [Order Details] as OD on O.OrderID = OD.OrderID group by E.FirstName, E.LastName; 

Select COUNT(O.OrderID) as ventas, E.EmployeeID from Orders as O INNER JOIN Employees as E on O.EmployeeID = E.EmployeeID group by E.EmployeeID; 


Select GETDATE()