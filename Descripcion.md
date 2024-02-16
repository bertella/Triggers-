# Descripción del Script SQL - "Desarrollo de Triggers en MySQL"

En la clase número 17, se abordó el concepto de Triggers en MySQL, explorando su aplicación mediante un ejemplo práctico. En este script SQL, se creó una base de datos llamada `TRIGGERS` con dos tablas principales: `Clientes` y `Pedidos`.

## Estructura de la Base de Datos

La tabla `Clientes` contiene información sobre los clientes, mientras que la tabla `Pedidos` almacena detalles de los pedidos asociados a esos clientes. Estas tablas están interconectadas mediante una clave foránea.

## Ejemplo de Datos

Se insertaron datos de ejemplo en ambas tablas para ilustrar el funcionamiento del sistema:

- La tabla `Clientes` tiene registros de clientes identificados por un ID único y su respectivo nombre.
- La tabla `Pedidos` registra pedidos con información sobre el cliente asociado, el total del pedido y una clave foránea que vincula los pedidos a clientes específicos.

## Problema y Solución

En el escenario donde se desea eliminar un cliente de la tabla `Clientes`, se identificó un problema al encontrarse con un error (Error Code: 1451) debido a la existencia de registros asociados en la tabla `Pedidos`. 

La solución propuesta consiste en dos enfoques:

1. **Solución Manual:**
   Antes de eliminar un cliente, se debe realizar manualmente la eliminación de los registros asociados en la tabla `Pedidos`.

2. **Solución con Trigger:**
   Se implementó un Trigger llamado `borrar_pedidos_por_cliente`, que se activa antes de la eliminación de un cliente. Este Trigger se encarga automáticamente de eliminar los registros asociados en la tabla `Pedidos`.

## Verificación

Se incluye una sección para verificar la efectividad del Trigger, donde se puede ejecutar una consulta que muestra los registros actuales en la tabla `Pedidos`. Esto sirve para confirmar que los pedidos asociados al cliente eliminado han sido borrados automáticamente.

Este script proporciona una visión general del desarrollo de Triggers en MySQL y cómo abordar situaciones específicas al trabajar con bases de datos relacionales.
