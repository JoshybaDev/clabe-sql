# clabe-sql
Librería para calcular un número CLABE basado en https://es.wikipedia.org/wiki/CLABE


## Uso básico

Obtener el dígito de control de un número CLABE

una ves ejecutado el create de la funcion en la Base de datos.

```sql
select DB.dbo.Fn_computeControlDigit('07291600213326353') as digito
```

Dará como resultado 3
