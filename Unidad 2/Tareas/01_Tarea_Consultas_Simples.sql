-- TAREAS DE CONSULTAS SIMPLES

--Seleccionar los pedidos con  un flete mayor a 100 enviados a brasil o  argentina, pero no enviados por el transportista1

Select OrderID, OrderDate, Freight, ShipVia, ShipCountry from Orders where Freight >= 100 and (ShipCountry = 'Brazil' or ShipCountry = 'Argentina') and  NOT ShipVia = 1;

--1. Productos con categoría 1, 3 o 5 32

select * from Products where CategoryID = 1 or CategoryID = 3 or CategoryID = 5 order by CategoryID; 

--2. Clientes de México, Brasil o Argentina

select CustomerID from Customers;

--3. Pedidos enviados por los transportistas 1, 2 o 3 y con flete mayor a 50



--4. Empleados que trabajan en Londres, Seattle o Buenos Aires



--5. Pedidos de clientes en Francia o Alemania, pero con un flete menor a 100



--6. Productos con categoría 2, 4 o 6 y que NO estén descontinuados



--7. Clientes que NO son de Alemania, Reino Unido ni Canadá



--8. Pedidos enviados por transportistas 2 o 3, pero que NO sean a USA ni Canadá



--9. Empleados que trabajan en 'London' o 'Seattle' y fueron contratados después de 1995



--10. Productos de categorías 1, 3 o 5 con stock mayor a 50 y que NO están descontinuados


