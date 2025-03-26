# INNER JOIN

## Hecho por : Luis Angel Jimenez

![Inner Join](../img/descarga.jpeg)


- Join (Juntar) INNER (Default), LEFT (), RIGHT (), CROSS (), FULL (). 
```SQL
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
```

- Seleccionar los productos de la categoria beverages y condiments donde la existencia este entre 18 y 30

```SQL
Select P.ProductID as 'Numero de Producto', P.ProductName as 'Nombre del Producto', C.CategoryID as 'Numero de Categoria',C.CategoryName as 'Nombre Categoria', UnitPrice as 'Precio', UnitsInStock as 'Existencia'
from Products as P inner join Categories as C on C.CategoryID = P.CategoryID
where (C.CategoryName in('Beverages','Condiments')) and P.UnitsInStock between 18 and 30;
```
- Seleccionar los productos y sus importes realizados de marzo a junio de 1996, mostrando la fecha de la orden, el id del producto y el importe
```SQL
Select O.OrderDate, OD.ProductID, OD.OrderID, (OD.UnitPrice * OD.Discount)  from Orders as O inner join [Order Details] AS OD 
ON OD.OrderID = O.OrderID WHERE O.OrderDate between '1996-01-07' and '1996-30-10'
```
- Mostrar total de ventas de la sonsulta anterior
```SQL
Select concat('$', ' ', sum(OD.Quantity * OD.UnitPrice)) as 'Importe' from Orders as O inner join [Order Details] AS OD 
ON OD.OrderID = O.OrderID WHERE O.OrderDate between '1996-01-07' and '1996-30-10'
```
- Consultas Basicas con Inner Join

- 1. Obtener los nombres de los clientes y los paises a los que se enviaron sus pedidos
```SQL
Select C.CompanyName as 'Nombre', O.ShipCountry as 'Pais de Envio' from Customers as C inner join Orders as O on C.CustomerID = O.CustomerID order by 2 desc ;

Select C.CompanyName as 'Nombre', O.ShipCountry as 'Pais de Envio' from Orders as O INNER JOIN Customers as C on O.CustomerID = C.CustomerID order by 2 desc ;
```
- 2. Obtener los productos y sus respectivos proveedores
```SQL
Select P.ProductName as 'Nombre Producto', S.CompanyName as 'Nombre del Proveedor' from Products as P inner join Suppliers as S on P.SupplierID = S.SupplierID;

Select P.ProductName as 'Nombre Producto', S.CompanyName as 'Nombre del Proveedor' from Products as P inner join Suppliers as S on P.SupplierID = S.SupplierID;
```
- 3. Obtener los pedidos y los empleados que los gestionaron
```SQL
Select * from Employees

Select O.OrderID, concat(E.Title,'-', E.FirstName, '-', E.LastName) as 'Nombre', O.OrderDate from Orders as O inner join Employees as E on O.EmployeeID = E.EmployeeID;

Select O.OrderID, concat(E.Title,'-', E.FirstName, '-', E.LastName) as 'Nombre' from Orders as O inner join Employees as E on O.EmployeeID = E.EmployeeID;
```
- 4. Listarlos productos junto con sus precios y la categoria que pertenecen
```SQL
Select P.ProductName, P.UnitPrice, C.CategoryName from Products as P inner join Categories as C on P.CategoryID = C.CategoryID;
```
- 5. Obtener el nombre del cliente, numero de orden y la fecha de orden
```SQL
Select C.CompanyName, O.OrderID, O.OrderDate from Customers as C inner join Orders as O on C.CustomerID = O.CustomerID;
```
- 6. Listar las ordenes mostrando el numero de orden, el nombre de producto y la cantidad del producto
```SQL
Select O.OrderID, OD.ProductID, OD.Quantity from Orders as O inner join [Order Details] as OD on OD.OrderID = O.OrderID;
--Correcto
Select OD.OrderID as 'Numero de orden', P.ProductName as 'Nombre del Producto', OD.Quantity as 'Cantidad' from Products as P inner join [Order Details] as OD on OD.ProductID = P.ProductID;

Select top 5 OD.OrderID as 'Numero de orden', P.ProductName as 'Nombre del Producto', OD.Quantity as 'Cantidad' from Products as P inner join [Order Details] as OD on OD.ProductID = P.ProductID order by OD.Quantity desc;

Select OD.OrderID as 'Numero de orden', P.ProductName as 'Nombre del Producto', OD.Quantity as 'Cantidad' from Products as P inner join [Order Details] as OD on OD.ProductID = P.ProductID where OD.OrderID = 11031 order by OD.Quantity desc;

Select OD.OrderID ,COUNT(*) as 'Cantidad de productos vendidos' from Products as P inner join [Order Details] as OD on OD.ProductID = P.ProductID group by OD.OrderID order by OD.OrderID desc;

Select * from [Order Details] as OD where OD.OrderID = 1107;
```
- 7. Obtener los empleados y sus respectivos jefes
```SQL
Select EJ.EmployeeID, concat(E.Title,' - ', E.FirstName, ' - ', E.LastName) as 'Nombre', EJ.ReportsTo as 'Numero de Jefe', concat(E.Title,' - ', E.FirstName, ' - ', E.LastName) as 'Nombre Jefe' from Employees as E inner join Employees as EJ on E.EmployeeID = EJ.ReportsTo;

Select EJ.EmployeeID, concat(E.Title,' - ', E.FirstName, ' - ', E.LastName) as 'Nombre', CONCAT(EJ.ReportsTo,' - ', EJ.FirstName,' - ', EJ.LastName) as 'Numero de Jefe' from Employees as E inner join Employees as EJ on E.EmployeeID = EJ.ReportsTo;
```
- 8. Listar los pedidos y el nombre de la empresa de transporte utilizada
```SQL
Select O.OrderID as 'Numero de Pedido', S.CompanyName as 'Nombre de la compania' from Orders as O inner join Shippers as S on O.ShipVia = S.ShipperID;
```
- Consultas inner join Intermedias 

- 9. Obtener la cantidad total de prodcutos vendidos por categoria
```SQL
Select * from Products as P inner join Categories as C on p.CategoryID = C.CategoryID;

Select C.CategoryName as 'Nombre Categoria', sum (Quantity) as 'Productos Vendidos'  from Categories as C INNER JOIN Products as P on C.CategoryID = P.CategoryID INNER JOIN [Order Details] as OD on OD.ProductID = P.ProductID group by C.CategoryName order by C.CategoryName;
```

- 10. Obtener el total de ventas por empleado

```SQL
Select CONCAT(E.FirstName, E.LastName) as 'Nombre' , 
sum(((OD.Quantity * OD.UnitPrice)) - (OD.Quantity * OD.UnitPrice) * OD.Discount) as Ventas
from Orders as O INNER JOIN Employees as E on O.EmployeeID = E.EmployeeID 
INNER JOIN [Order Details] as OD on O.OrderID = OD.OrderID group by E.FirstName, E.LastName; 

Select COUNT(O.OrderID) as ventas, E.EmployeeID from Orders as O INNER JOIN Employees as E on O.EmployeeID = E.EmployeeID group by E.EmployeeID; 
```
- 11. Listar los clientes y la cantidad de pedidos que han realizado

```SQL
Select COUNT(*), CU.CompanyName, O.OrderID from Customers as CU inner join Orders as O on CU.CustomerID = O.CustomerID group by O.OrderID;

Select c.CompanyName as 'Cliente', COUNT(*) as 'Pedidos' from Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
group by c.CompanyName
```
- 12. Obtener los empleados que han gestionado pedidos enviados a alemania
```SQL
Select distinct CONCAT(E.FirstName, E.LastName) as 'Nombre', ShipCountry 
from Employees as E 
inner join Orders as O 
on E.EmployeeID = O.EmployeeID where ShipCountry = 'Germany';
```
- 13. Listar lod produtos junto con el nombre del proveedor y el pais de origen 
```SQL
Select p.ProductName as 'Nombre del producto', s.CompanyName as 'Proveedor', s.Country as 'Pais de Origen' from Products AS p inner join Suppliers AS s on p.SupplierID = s.SupplierID order by 1 asc;
```
- 14. Obtener los pedidos agrupados por pais de envio
```SQL
Select * from orders

Select COUNT(*) as 'Numero de Pedidos', ShipCountry as 'Pais de Envio' from Orders group by ShipCountry;
```
- 15. Obtener los empleados y la cantidad de territorios en los que trabajan
```SQL
Select CONCAT(E.FirstName, E.LastName) as 'Nombre', COUNT(et.TerritoryID) as 'Cantidad de Territorios' from Employees as e
inner join EmployeeTerritories as et
on e.EmployeeID = et.EmployeeID group by CONCAT(E.FirstName, E.LastName);

Select CONCAT(E.FirstName, ' ', E.LastName) as 'Nombre', t.TerritoryDescription as 'Descripcion del Territorio',
COUNT(et.TerritoryID) as 'Cantidad de Territorios' from Employees as e
inner join EmployeeTerritories as et
on e.EmployeeID = et.EmployeeID 
inner join Territories as t 
on et.TerritoryID = t.TerritoryID
group by CONCAT(E.FirstName, E.LastName),t.TerritoryDescription order by 'Nombre', t.TerritoryDescription desc;

Select COUNT(et.TerritoryID) as 'Cantidad de Territorios', CONCAT(E.FirstName, E.LastName) as 'Nombre' from Employees as E inner join EmployeeTerritories as ET on E.EmployeeID = ET.EmployeeID group by E.FirstName, E.LastName;
```
- 16. Listar las categorias y la cantidad de productos que contienen
```SQL
Select COUNT(*) AS 'Cantidad de productos', C.CategoryName as 'Categoria' from Categories as C inner join Products as P on C.CategoryID = P.CategoryID group by C.CategoryID, C.CategoryName;


Select c.CategoryName as 'Categoria',
COUNT(p.ProductID) as 'cantidad de productos'
from Categories as c inner join Products as p
on c.CategoryID = p.CategoryID
group by c.CategoryName
```
- 17. Obtener la cantidad total de productos vendidos por proveedor 
```SQL
select s.CompanyName as 'Proveedor',
SUM(od.Quantity) as 'Total de productos Vendidos'
from Suppliers as s
inner join Products as p on s.SupplierID = p.SupplierID
inner join [Order Details] AS od on od.ProductID = p.ProductID
group by s.CompanyName
order by 2 desc;


Select P.ProductName, S.CompanyName, sum(OD.Quantity) from Products as P inner join Suppliers as S on P.SupplierID = S.SupplierID inner join [Order Details] as OD on P.ProductID = OD.ProductID;
```
- 18. Obtener la cantidad de pedidos enviados por cada empresa de transporte 
```SQL
Select S.CompanyName as 'Transportista', 
COUNT(OrderID) as 'Total de Pedidos'  
from Orders as O inner join Shippers as S 
on O.ShipVia = S.ShipperID 
group by S.CompanyName;
```
- 19. Obtener los clientes que han realizado pedidos m�s de un producto
```SQL
Select c.CompanyName, count(distinct ProductID) as 'Numero de Productos' from 
Customers as c
INNER JOIN Orders as o
on c.CustomerID = o.CustomerID 
INNER JOIN  [Order Details] as od
on o.OrderID = od.OrderID
group by c.CompanyName
order by 2 desc;
```
- 20. Listar los empleados con la cantidad total de pedidos que han gestionado y a que clientes les han vendido, agrupandolos por nombre completo y dentro de este nombre por cliente, ordenandolos por la cantidad de mayor pedidos 
```SQL
Select count(OrderID) as 'Numero de pedidos', CONCAT(E.FirstName, E.LastName) as 'Nombre Completo Empleado', C.CompanyName as 'Nombre Completo Cliente' from Employees as E INNER JOIN Orders as O on  E.EmployeeID = O.EmployeeID INNER JOIN Customers as C on O.CustomerID = C.CustomerID group by CONCAT(E.FirstName, E.LastName), C.CompanyName order by 1 desc;

Select CONCAT(E.FirstName, E.LastName) as 'Nombre Completo Empleado', count (OrderID) as 'Numero de Ordenes'
from Orders as o
INNER JOIN Employees as e
on o.EmployeeID = e.EmployeeID
Group by e.FirstName, e.LastName
order by 'Nombre Completo Empleado' asc;

Select CONCAT(E.FirstName, E.LastName) as 'Nombre Completo Empleado', c.CompanyName as 'Cliente' , count (OrderID) as 'Numero de Ordenes'
from Orders as o
INNER JOIN Employees as e
on o.EmployeeID = e.EmployeeID
INNER JOIN Customers as c
on o.CustomerID = c.CustomerID
Group by e.FirstName, e.LastName, c.CompanyName
order by 'Nombre Completo Empleado' asc , 'Cliente' desc;
```

- 21. Listar las categorias con el total de ingresos generados por sus productos
```SQL
Select C.CategoryID as 'Numero de Categoria', C.CategoryName as 'Nombre Categoria', 
sum(((OD.Quantity * OD.UnitPrice))-(OD.Quantity * OD.UnitPrice) * OD.Discount) as 'Ingresos totales por categoria' 
from Categories as C 
inner join Products as P 
on C.CategoryID = P.CategoryID 
inner join [Order Details] as OD 
on P.ProductID = OD.ProductID
group by C.CategoryID, C.CategoryName;

Select c.CategoryName, SUM(od.Quantity * od.UnitPrice) from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID
inner join [Order Details] as od
on p.ProductID = od.ProductID
group by c.CategoryName

Select c.CategoryName, p.ProductName, SUM(od.Quantity * od.UnitPrice) from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID
inner join [Order Details] as od
on p.ProductID = od.ProductID
group by c.CategoryName, p.ProductName
order by c.CategoryName
```
- 22. Listar los clientes con el total ($) gastado en pedidos 
```SQL
Select C.CompanyName, O.OrderID, /*Sum((OD.Quantity * OD.UnitPrice)-(OD.Quantity * OD.UnitPrice) * OD.Discount)*/
sum(OD.Quantity * OD.UnitPrice) from Customers as C 
inner join Orders as O 
on C.CustomerID = O.CustomerID
inner join [Order Details] as OD
on O.OrderID = OD.OrderID
group by C.CompanyName, O.OrderID;
```
- 23. Listar los pedidos realizados entre el 1 de enero de 1997 y el 30 de junio de 1997 y mostrar el total en dinero
```SQL
Select O.OrderID, O.OrderDate, SUM(OD.Quantity * OD.UnitPrice) as 'Total de dinero' from Orders AS O 
inner join [Order Details] as OD 
on O.OrderID = OD.OrderID 
where OrderDate between '1997-01-01' and '1997-30-06'
group by O.OrderID, O.OrderDate;

Select O.OrderID, O.OrderDate, SUM(((OD.Quantity * OD.UnitPrice))-(OD.Quantity * OD.UnitPrice) * OD.Discount) as 'Total de dinero' from Orders AS O 
inner join [Order Details] as OD 
on O.OrderID = OD.OrderID 
where OrderDate between '1997-01-01' and '1997-30-06'
group by O.OrderID, O.OrderDate;

Select * from Orders AS O 
inner join [Order Details] as OD 
on O.OrderID = OD.OrderID 
where OrderDate between '1997-01-01' and '1997-30-06';

Select * from Orders
```
- 24. Listar los productos con las categorias Beverages, seafood, confections
```SQL
Select C.CategoryName, P.ProductName, P.UnitPrice from Products as P 
inner join Categories as C on P.CategoryID = C.CategoryID 
where C.CategoryName in ('Beverages', 'Seafood', 'Confections') 
order by 1 asc;
```
- 25. Listar los clientes ubicados en alemania y que hayan realizado pedidos antes del 1 de enero de 1997
```SQL
Select C.CompanyName, C.Country, O.OrderDate 
from Customers as C inner join Orders as O 
on C.CustomerID = O.CustomerID 
where C.Country = 'Germany' and O.OrderDate < '1997-01-01';
```
- 26.Listar los clientes que han realizado pedidos con un total entre $500 y $2000
```SQL
Select C.CompanyName, sum(OD.Quantity * OD.UnitPrice) as 'Total'
from Customers as C 
inner join Orders as O 
on C.CustomerID = O.CustomerID 
INNER JOIN [Order Details] as OD 
on O.OrderID = OD.OrderID 
group by C.CompanyName
having sum(OD.Quantity * OD.UnitPrice) between 500 and 2000;

```

- Left join, Rigth Join, Full Join y Cross Join
