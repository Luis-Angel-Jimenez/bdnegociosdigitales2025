
# Tareas de Consultas Simples  
**Autor:** Luis Ángel Jiménez  
**Base de datos utilizada:** `Northwind`

---

## Consulta general:  
- Pedidos con un flete mayor a 100, enviados a Brasil o Argentina, pero no enviados por el transportista 1 
> **Resultado esperado:** 8 registros

```sql
USE Northwind;

SELECT OrderID, OrderDate, Freight, ShipVia, ShipCountry
FROM Orders
WHERE Freight >= 100 
  AND ShipCountry IN ('Brazil', 'Argentina') 
  AND ShipVia <> 1;
```

---

- 1. Productos con categoría 1, 3 o 5  
> **Resultado esperado:** 32 registros

```sql
SELECT ProductName, CategoryID, UnitPrice
FROM Products
WHERE CategoryID IN (1, 3, 5)
ORDER BY CategoryID;
```

---

- 2. Clientes de México, Brasil o Argentina  
>  **Resultado esperado:** 17 registros

```sql
SELECT CustomerID, ContactName, CompanyName, City, Country, Phone
FROM Customers
WHERE Country IN ('Mexico', 'Brazil', 'Argentina');
```

---

- 3. Pedidos enviados por transportistas 1, 2 o 3 y con flete mayor a 50  
> **Resultado esperado:** 360 registros

```sql
SELECT OrderID, OrderDate, ShipVia, Freight, ShipCountry
FROM Orders
WHERE ShipVia IN (1, 2, 3) 
  AND Freight > 50;
```

---

- 4. Empleados que trabajan en Londres, Seattle o Buenos Aires  
> **Resultado esperado:** 6 registros

```sql
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS 'Nombre Completo', Title, City, Country, ReportsTo
FROM Employees
WHERE City IN ('London', 'Seattle', 'Buenos Aires');
```

---

- 5. Pedidos de clientes en Francia o Alemania con flete menor a 100  
> **Resultado esperado:** 154 registros

```sql
SELECT OrderID, CustomerID, OrderDate, Freight, ShipCountry
FROM Orders
WHERE ShipCountry IN ('France', 'Germany') 
  AND Freight < 100;
```

---

- 6. Productos de categoría 2, 4 o 6 que **no** están descontinuados  
> **Resultado esperado:** 23 registros

```sql
SELECT ProductID, ProductName, CategoryID, UnitPrice, UnitsInStock, Discontinued
FROM Products
WHERE CategoryID IN (2, 4, 6) 
  AND Discontinued = 0;
```

---

- 7. Clientes que **no** son de Alemania, Reino Unido ni Canadá  
> **Resultado esperado:** 73 registros  
> *Corrección: el país 'Cananda' estaba mal escrito*

```sql
SELECT CustomerID, CompanyName, ContactName, Country
FROM Customers
WHERE Country NOT IN ('Germany', 'UK', 'Canada');
```

---

- 8. Pedidos enviados por transportistas 2 o 3, pero que **no** sean a USA ni Canadá  
> **Resultado esperado:** 464 registros

```sql
SELECT OrderID, CustomerID, OrderDate, ShipVia, ShipCountry
FROM Orders
WHERE ShipVia IN (2, 3) 
  AND ShipCountry NOT IN ('USA', 'Canada');
```

---

- 9. Empleados en Londres o Seattle contratados **después de 1995**  
> Todos los empleados fueron contratados antes de 1995

```sql
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS 'Nombre Completo', Title, HireDate, City, Country
FROM Employees
WHERE City IN ('London', 'Seattle') 
  AND YEAR(HireDate) > 1995;
```

---

- 10. Productos de categorías 1, 3 o 5 con stock > 50 y no descontinuados

```sql
SELECT ProductID, ProductName, CategoryID, UnitPrice, UnitsInStock, Discontinued
FROM Products
WHERE CategoryID IN (1, 3, 5) 
  AND UnitsInStock > 50 
  AND Discontinued = 0;
```

---
