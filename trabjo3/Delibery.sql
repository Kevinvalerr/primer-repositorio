/*DDL*/
 
 /*Crea una nueva base de datos llamada delivery_db.*/
 
 create database delivery_db;
 
 use delivery_db;
 
 /*
 
 
  /*dml */
 
 
 CREATE TABLE usuarios( 
 id INT PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(100) NOT NULL,
 email VARCHAR (100) UNIQUE NOT NULL,
 telefono VARCHAR (20),
 direccion VARCHAR(255) NOT NULL
 );
 
 CREATE TABLE Restaurante ( 
 id INT PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR (100) NOT NULL,
 direccion VARCHAR (255) NOT NULL UNIQUE,
 telefeno VARCHAR(20) NOT NULL
 );
 
 CREATE TABLE productos(
 id INT PRIMARY KEY AUTO_INCREMENT,
 restaurante_id INT NOT NULL,
 nombre VARCHAR(100) NOT NULL,
 descripcion TEXT,
 precio DECIMAL(10,2) NOT NULL,
 FOREIGN KEY (restaurante_id) REFERENCES Restaurante(id)
 );
 
 CREATE TABLE Pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    restaurante_id INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) DEFAULT 'Pendiente',
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (restaurante_id) REFERENCES Restaurantes(id)
 );
 
 CREATE TABLE Detalles_Pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);