 drop database if exists DB_Peri;
create database DB_Peri;
use DB_Peri;

create table Periferico(
codigoPeriferico int not null auto_increment,
Nombre varchar(250)not null,
Marca varchar(250)not null,
Precio Decimal(10, 2)not null,
 primary key PK_codigoPeriferico(codigoPeriferico)
);

create table Cliente(
	codigoCliente int not null auto_increment,
    codigoPeriferico int not null,
    nombreCliente varchar(250) not null,
    telefonoCliente varchar(8)not null unique,
    correoCliente varchar(250) not null unique,
    direccion varchar(250),	   
    primary key PK_codigoCliente(codigoCliente),
	constraint FK_Cliente_Periferico foreign key (codigoPeriferico)
		references Periferico (codigoPeriferico)
);

-- -------------Crud Periferico-------
-- Agregar --
DELIMITER //
CREATE PROCEDURE sp_AgregarPeriferico(
    IN pNombre VARCHAR(250),
    IN pMarca VARCHAR(8),
    IN pPrecio Decimal(10, 2)
)
BEGIN
    INSERT INTO Periferico (Nombre, Marca, Precio)
    VALUES (pNombre, pMarca, pPrecio);
END //
DELIMITER ;

call sp_AgregarPeriferico("Teclado","logitech", 205.00);
call sp_AgregarPeriferico("Mouse","XFG200", 100.00);
call sp_AgregarPeriferico("Monitor","Dell", 1200.00);
call sp_AgregarPeriferico("Escaner","Future", 5000.00);
call sp_AgregarPeriferico("Camara Web","Visited", 505.00);
call sp_AgregarPeriferico("Impresora","Canon", 1250.00);
call sp_AgregarPeriferico("Microfono","Status", 700.00);
call sp_AgregarPeriferico("Audifonos","JBL", 1500.00);
call sp_AgregarPeriferico("Parlantes","Maven", 5205.00);
call sp_AgregarPeriferico("Disco Duro","Mar", 850.00);


-- Listar --
DELIMITER //
CREATE PROCEDURE sp_ListarPeriferico()
BEGIN
    SELECT  codigoPeriferico, Nombre, Marca, Precio FROM Periferico;
END //
DELIMITER ;
CALL sp_ListarPeriferico();

-- Editar --
DELIMITER //
CREATE PROCEDURE sp_EditarPeriferico(
	IN cPeriferico INT,
    IN nNombre VARCHAR(250),
    IN nMarca VARCHAR(250),
    IN pPrecio DECIMAL(10,2)
)
BEGIN
    UPDATE Periferico
    SET Nombre = nNombre,
        Marca = nMarca,
        Precio = pPrecio
    WHERE codigoPeriferico = cPeriferico;
END //
DELIMITER ;
 -- CALL sp_EditarPeriferico(1, 'Teclado Gamer', 'Logitech', 75.50);

-- Buscar --
DELIMITER //
CREATE PROCEDURE sp_BuscarPeriferico(IN cPeriferico INT)
BEGIN
    SELECT codigoPeriferico, Nombre, Marca, Precio 
    FROM Periferico 
    WHERE codigoPeriferico = cPeriferico;
END //
DELIMITER ;
-- CALL sp_BuscarPeriferico(1);

-- Eliminar --
DELIMITER //
CREATE PROCEDURE sp_EliminarPeriferico(IN cPeriferico INT)
BEGIN
	DELETE FROM Periferico WHERE codigoPeriferico = cPeriferico;
END //
DELIMITER ;-
-- CALL sp_EliminarPeriferico(3);



-- -------------Crud Cliente-------
-- Agregar --
DELIMITER //
CREATE PROCEDURE sp_AgregarCliente(
    IN  codPeriferico int,
    IN nCliente VARCHAR(250),
    IN tCliente Varchar(8),
	IN Cliente VARCHAR(250),
	IN cDireccion VARCHAR(250)
)
BEGIN
    INSERT INTO Cliente (codigoPeriferico, nombreCliente, telefonoCliente, correoCliente, direccion )
    VALUES (codPeriferico, nCliente, tCliente, Cliente, cDireccion  );
END //
DELIMITER ;

CALL sp_AgregarCliente(1, 'Juan', '33778596', 'juan.perez@example.com', 'zona 1');
CALL sp_AgregarCliente(2, 'Ana Gómez', '44223366', 'ana.gomez@example.com', 'zona 2');
CALL sp_AgregarCliente(3, 'Carlos Rodríguez', '77889966', 'carlos.rodriguez@example.com', 'zona 3');
CALL sp_AgregarCliente(4, 'María López', '33002255', 'maria.lopez@example.com', 'zona 4');
CALL sp_AgregarCliente(5, 'Pedro Sánchez', '11223344', 'pedro.sanchez@example.com', 'zona 5');
CALL sp_AgregarCliente(6, 'Laura Martínez', '55549966', 'laura.martinez@example.com', 'zona 6');
CALL sp_AgregarCliente(7, 'Luis Fernández', '33727865', 'luis.fernandez@example.com', 'zona 7');
CALL sp_AgregarCliente(8, 'Carla Hernández', '57835781', 'carla.hernandez@example.com', 'zona 8');
CALL sp_AgregarCliente(9, 'Javier González', '32867826', 'javier.gonzalez@example.com', 'zona 9');
CALL sp_AgregarCliente(10, 'Marta Ruiz', '47391349', 'marta.ruiz@example.com', 'zona 10');


-- Listar --
DELIMITER //
CREATE PROCEDURE sp_ListarCliente()
BEGIN
    SELECT  codigoCliente, codigoPeriferico, nombreCliente, telefonoCliente, correoCliente, direccion FROM Cliente;
END //
DELIMITER ;
CALL sp_ListarCliente();

-- Editar --
DELIMITER //
CREATE PROCEDURE sp_EditarCliente(
	IN cCliente INT,
    IN nNombreCliente VARCHAR(250),
    IN nTelefonoCliente VARCHAR(8),
    IN nCorreoCliente VARCHAR(250),
    IN nDireccion VARCHAR(250),
    IN nCodigoPeriferico INT
)
BEGIN
    UPDATE Cliente
    SET nombreCliente = nNombreCliente,
        telefonoCliente = nTelefonoCliente,
        correoCliente = nCorreoCliente,
        direccion = nDireccion,
        codigoPeriferico = nCodigoPeriferico
    WHERE codigoCliente = cCliente;
END //
DELIMITER ;
-- CALL sp_EditarCliente(4, 'Juan Pérez', '44998877', 'juanperez@gmail.com', 'Zona 12', 2);

-- Buscar --
DELIMITER //
CREATE PROCEDURE sp_BuscarCliente(IN cCliente INT)
BEGIN
    SELECT codigoCliente, codigoPeriferico, nombreCliente, telefonoCliente, correoCliente, direccion 
    FROM Cliente 
    WHERE codigoCliente = cCliente;
END //
DELIMITER ;
-- CALL sp_BuscarCliente(5);

-- Eliminar --
DELIMITER //
CREATE PROCEDURE sp_EliminarCliente(IN cCliente INT)
BEGIN
	DELETE FROM Cliente WHERE codigoCliente = cCliente;
END //
DELIMITER ;
-- CALL sp_EliminarCliente(3);



