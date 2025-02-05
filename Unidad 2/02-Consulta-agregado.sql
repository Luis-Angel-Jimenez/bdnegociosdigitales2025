-- Consultas de Agregados 
-- Nota: Solo devuelven un solo registro sum, avg, count(*), max, min

--Cuantos clientes tengo

Select count(*) as 'Número de clientes' from Customers;

-- Cuantas regiones hay
Select COUNT(*) from Customers where Region is null;

select count (distinct Region) from Customers where Region is not null;