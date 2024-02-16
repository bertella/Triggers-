
## En esta clase Nº 17  desarrollamos el concepto de Triggers. 
## A modo de ejemplo creamos una base de datos 

Create database TRIGGERS;
USE  TRIGGERS;

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cliente VARCHAR(50)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    total_pedido DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Insertar clientes
INSERT INTO Clientes (id_cliente, nombre_cliente) VALUES
(1, 'Cliente A'),
(2, 'Cliente B'),
(3, 'Cliente C');

-- Insertar pedidos
INSERT INTO Pedidos (id_pedido, id_cliente, total_pedido) VALUES
(101, 1, 50.00),
(102, 2, 30.00),
(103, 3, 45.50);


# SUPONGAMOS QUE QUEREMOS ELIMINAR UN CLIENTE DE NUESTRA TABLA PEDIDOS
# ¿Que sucede si intentamos eliminar un cliente?
DELETE FROM Clientes WHERE id_cliente = 1;	
/*El error que estás viendo (Error Code: 1451) indica que estás
 intentando eliminar un cliente de la tabla Clientes que tiene registros 
 asociados en la tabla Pedidos,y hay una restricción 
 de clave foránea (FOREIGN KEY) que está impidiendo la operación.
*/

/*Para resolver esto, tienes dos opciones:
Eliminar Pedidos Asociados Manualmente:
Antes de eliminar el cliente, debes eliminar manualmente 
los registros asociados en la tabla Pedidos. Puedes hacerlo con la siguiente instrucción:
*/
DELETE FROM Pedidos WHERE id_cliente = 1;

DELIMITER //
CREATE TRIGGER `borrar_pedidos_por_cliente`
BEFORE DELETE ON `Clientes`
FOR EACH ROW
BEGIN
    DELETE FROM Pedidos WHERE id_cliente = OLD.id_cliente;
END;
//
DELIMITER ;

select * from pedidos; 

 