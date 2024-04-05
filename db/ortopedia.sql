-- CREATE DATABASE IF NOT EXISTS ortopediadb;

-- USE ortopediadb;
-- Tabla PRODUCTO
CREATE TABLE PRODUCTO (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    costo DECIMAL(10,2),
    tipoVenta VARCHAR(50),
    tallas VARCHAR(100),
    opcionAmedida VARCHAR(255),
    colores VARCHAR(255),
    codigo VARCHAR(50),
    categoria1 VARCHAR(50),
    categoria2 VARCHAR(50),
    indicacion TEXT,
    urlImages VARCHAR(500);
    material VARCHAR(100),
    dimensionYpeso VARCHAR(100),
    otros TEXT,
    precio DECIMAL(10,2),
    efectos TEXT,
    silueta VARCHAR(50)
);

-- INSERT INTO PRODUCTO (nombre, descripcion, costo, tipoVenta, tallas, opcionAmedida, colores, codigo, categoria1, categoria2, indicacion, material, dimensionYpeso, otros, precio, efectos, silueta) 
-- VALUES ('Camiseta de algodón', 'Camiseta básica de algodón suave', 15.99, 'Venta regular', 'S,M,L', NULL, 'Negro,Blanco,Gris', 'CMST001', 'Ropa', 'Camisetas', 'Lavar a máquina en agua fría', 'Algodón 100%', 'Dimensiones: 20x30 cm, Peso: 150g', NULL, 19.99, NULL, 'Regular');


-- Tabla ALQUILER
CREATE TABLE ALQUILER (
    idAlquiler INT AUTO_INCREMENT PRIMARY KEY,
    fechaInicio DATE,
    fechaFin DATE
);

-- Tabla EMPLEADO (Tabla base para ESPECIALISTA y ADMINISTRADOR)
CREATE TABLE EMPLEADO (
    idEmpleado INT AUTO_INCREMENT PRIMARY KEY
);

-- Tabla ESPECIALISTA (hereda de EMPLEADO)
CREATE TABLE ESPECIALISTA (
    idEspecialista INT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (idEspecialista) REFERENCES EMPLEADO(idEmpleado)
);

-- Tabla ADMINISTRADOR (hereda de EMPLEADO)
CREATE TABLE ADMINISTRADOR (
    idAdministrador INT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (idAdministrador) REFERENCES EMPLEADO(idEmpleado)
);

-- Tabla USUARIO
CREATE TABLE USUARIO (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    correo VARCHAR(100),
    foto VARCHAR(255)
);

-- Tabla ORDEN
CREATE TABLE ORDEN (
    idOrden INT AUTO_INCREMENT PRIMARY KEY,
    nit VARCHAR(10),
    fecha DATE,
    idUsuario INT,
    FOREIGN KEY (idUsuario) REFERENCES USUARIO(idUsuario)
);

-- Tabla CONTIENE (Relación N a M entre PRODUCTO y ORDEN)
CREATE TABLE CONTIENE (
    idOrden INT,
    idProducto INT,
    cantidad INT,
    PRIMARY KEY (idOrden, idProducto),
    FOREIGN KEY (idOrden) REFERENCES ORDEN(idOrden),
    FOREIGN KEY (idProducto) REFERENCES PRODUCTO(idProducto)
);

-- Tabla CITA
CREATE TABLE CITA (
    idCita INT AUTO_INCREMENT PRIMARY KEY,
    fechaCita DATETIME,
    descripcion TEXT,
    idUsuario INT,
    idEspecialista INT,
    FOREIGN KEY (idUsuario) REFERENCES USUARIO(idUsuario),
    FOREIGN KEY (idEspecialista) REFERENCES ESPECIALISTA(idEspecialista)
);

-- Relación FAVORITO entre USUARIO y PRODUCTO (N a M)
CREATE TABLE FAVORITO (
    idUsuario INT,
    idProducto INT,
    PRIMARY KEY (idUsuario, idProducto),
    FOREIGN KEY (idUsuario) REFERENCES USUARIO(idUsuario),
    FOREIGN KEY (idProducto) REFERENCES PRODUCTO(idProducto)
);

-- Relación SOLICITA entre USUARIO y ALQUILER (N a M)
CREATE TABLE SOLICITA (
    idUsuario INT,
    idAlquiler INT,
    PRIMARY KEY (idUsuario, idAlquiler),
    FOREIGN KEY (idUsuario) REFERENCES USUARIO(idUsuario),
    FOREIGN KEY (idAlquiler) REFERENCES ALQUILER(idAlquiler)
);

-- Relación APRUEBA entre ADMINISTRADOR y CITA (1 a N)
CREATE TABLE APRUEBA (
    idAdministrador INT,
    idCita INT,
    PRIMARY KEY (idAdministrador, idCita),
    FOREIGN KEY (idAdministrador) REFERENCES ADMINISTRADOR(idAdministrador),
    FOREIGN KEY (idCita) REFERENCES CITA(idCita)
);
