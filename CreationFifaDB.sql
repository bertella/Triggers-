#SENTENCIA TRIGGER
#INS,UPD, DEL
#AFT, BEF

#CREAR TABLA PARA EL TRIGGER
CREATE TABLE `new_jugadores` (
  `ID` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `NombreCompleto` varchar(150) NOT NULL,
  `Club` varchar(100) DEFAULT NULL,
  `Liga` varchar(100) DEFAULT NULL,
  `FechaNacimiento` date NOT NULL,
  `AlturaCM` int NOT NULL,
  `PesoKG` int NOT NULL,
  `Nacionalidad` varchar(100) NOT NULL,
  `ValorEuropa` float NOT NULL,
  `PiePreferido` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#SENTENCIA TRIGGER
CREATE TRIGGER AFT_INS_Jugadores_espejo
AFTER INSERT ON jugadores
FOR EACH ROW
INSERT INTO new_jugadores
VALUES (NEW.ID, NEW.Nombre, NEW.NombreCompleto, NEW.Club, NEW.Liga,
	NEW.FechaNacimiento, NEW.AlturaCM, NEW.PesoKG, NEW.Nacionalidad,
    NEW.ValorEuropa, NEW.PiePreferido);
    
#INSERCCION PARA TEST
INSERT INTO jugadores
VALUES(20000, "Diego", "Gabriel Luciano", "River", "Argentina", "1994-07-21",
	180, 80, "Argentina", 10000000, "Left");
    
 SELECT * FROM new_jugadores;   

#FUNCIONES DATETIME
SELECT NOW(); #FECHA Y HORA ACTUAL
SELECT CURRENT_DATE();
SELECT CURDATE();
SELECT CURRENT_TIME();
SELECT CURTIME();
SELECT CURRENT_TIMESTAMP(); #FECHA Y HORA ACTUAL

#FUNCIONES USUARIOS
SELECT SESSION_USER();
SELECT SYSTEM_USER();
SELECT USER();
#FUNCIONES PLATAFORMAS
SELECT DATABASE();
SELECT VERSION();

#CREACIÓN TABLA LOGS
CREATE TABLE logs(
	fecha_hora DATETIME,
    usuario VARCHAR(100),
    bd VARCHAR(100),
    version VARCHAR(20)
    );
    
CREATE TRIGGER BEF_DEL_jugadores_logs
BEFORE DELETE ON jugadores
FOR EACH ROW
INSERT INTO logs (fecha_hora, usuario, bd, version)
VALUES (NOW(), USER(), DATABASE(), VERSION());

##Visualizamos el registro a eliminar
select * from jugadores WHERE ID =  20801;

DELETE FROM jugadores
WHERE ID = 20801;

	

-- Eliminar un trigger llamado BEF_DEL_jugadores_logs en el esquema actual
DROP TRIGGER IF EXISTS BEF_DEL_jugadores_logs;

#Habilitar eliminación y actualización en cascada
SET sql_safe_updates=0;



	
    
