-- Lenguaje SQL-LMD (Insert, Update, Delete, Select CRUD)
--Consultas Simples 
use Northwind;
--Mostrar todos los clientes, prveedores, categorias, prodcutos, ordenes, detalle de orden con todas las columnas de datos de la empresa

Select * from Customers;

Select * from Employees;

Select * from Orders;

Select * from Suppliers;

Select * from Products;

Select * from Shippers;

Select * from Categories;

Select * from [Order Details];

-- Proyeccion
Select ProductID, ProductName, UnitPrice, UnitsInStock from Products;

--Seleccionar o mostrar el numero d eempleado su primer nombre, su cargo, ciudad y pais
Select EmployeeID, FirstName, Title, City, Country from Employees;

--Alias de columna

--En base de la consulta anterior, visualizar el employeeID como numero empleado, el firstname como primerNombre, Title como cargo, city como ciudad, country como pais.

Select EmployeeID as [Numero Empleado], FirstName as primerNombre, Title as Cargo, City as Ciudad, Country 'Pais' from Employees;

--Campo calculado, seleccionar el importe de cada uno de los productos vendidos en una orden 
select *,(UnitPrice * Quantity) as Import from [Order Details];

--Seleccionar las fechas de orden, año, dia, cliente que las ordeno y el empleado que las realizo

select OrderDate as 'Fecha de Orden', 
year(OrderDate) as 'Año de la Orden', 
MONTH(OrderDate) as 'Mes de la Orden', 
day(OrderDate) as 'Dia de la Orden', 
CustomerID, 
EmployeeID  
from Orders;

-- Clausula Where
-- Operadores Relacionales (<,>,=,<=,>=,!= o <>)
Select * from Customers;

--Seleccionar el cliente BOLID

select CustomerID as 'Numero Cliente', CompanyName as 'Nombre Compañia', City as 'Ciudad', Country as Pais from Customers where CustomerID = 'BOLID';

Select CustomerID as Identificador, CompanyName as 'Nombre Compañia', ContactName as Contacto, City as Ciudad, Country as Pais from Customers where Country = 'Germany';

-- Seleccionar todos los clientes que no sean de alemania

Select CustomerID as Identificador, CompanyName as 'Nombre Compañia', ContactName as Contacto, City as Ciudad, Country as Pais from Customers where Country != 'Germany';

-- Seleccionar su nombre de producto, categoria ala que pertenece,  unidad de existencia, precio, pero solo donde su precio sea mayor a 100

select ProductName as 'Nombre del Producto', UnitsInStock as Existencia, CategoryID as Categoria, UnitPrice as Precio, (UnitPrice * UnitsInStock) as 'Costo Inventario' from Products where UnitPrice > 100;

--Seleccionar las ordenes de compra mostrando la fecha de orden, fecha de entrega, fecha de envio, el clientea quien se vendio de 1996

select OrderDate as 'Fecha de Orden', RequiredDate as 'Fecha de Entrega' , ShippedDate as 'Fecha de Envio', CustomerID as Cliente from Orders where year (OrderDate) ='1996';

select * from Orders;