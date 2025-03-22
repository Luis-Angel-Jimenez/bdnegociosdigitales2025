# MongoBD Crud

## Crear una base de datos

**Solo se crea si contiene por lo menos una colecion**

```json
use basededatos
```

# Crear una collection

`usedb1
db.createCollection('Empleado')`

## Mostrar Coleciones 
`show collections`

## Insercion de un documento
db.Empleado.insertOne(
    {

    nombre: 'Soyla',
    apellido: 'Vaca',
    edad: 32,
    ciudad: 'San Miguel de las Piedras'
    }
)