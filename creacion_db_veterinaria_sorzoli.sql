-- ///////////// CREACION DE LA BASE DE DATOS /////////////

CREATE DATABASE IF NOT EXISTS veterinaria_sorzoli;

-- ASIGNACION DE LA BASE DE DATOS
USE veterinaria_sorzoli;

-- ///////////// CREACION DE LAS TABLAS /////////////

-- CREACION DE LA TABLA CLIENTES
CREATE TABLE IF NOT EXISTS clientes(
id_cliente INT AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
telefono VARCHAR(20),
email VARCHAR(120),
direccion VARCHAR(100),
PRIMARY KEY (id_cliente)
);

-- CREACION DE LA TABLA MASCOTAS
CREATE TABLE IF NOT EXISTS mascotas(
id_mascota INT AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL,
especie VARCHAR(100) NOT NULL,
raza VARCHAR(100),
fecha_nacimiento DATE,
sexo VARCHAR(20),
id_cliente INT NOT NULL,
PRIMARY KEY (id_mascota),
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- CREACION DE LA TABLA VETERINARIOS
CREATE TABLE IF NOT EXISTS veterinarios(
id_veterinario INT AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
matricula VARCHAR(30) NOT NULL,
especialidad VARCHAR(100),
PRIMARY KEY (id_veterinario)
);

-- CREACION DE LA TABLA TURNOS
CREATE TABLE IF NOT EXISTS turnos(
id_turno INT AUTO_INCREMENT,
fecha DATE NOT NULL,
hora TIME NOT NULL,
estado VARCHAR(20) NOT NULL,
id_mascota INT NOT NULL,
id_veterinario INT NOT NULL,
PRIMARY KEY (id_turno),
FOREIGN KEY (id_mascota) REFERENCES mascotas(id_mascota),
FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id_veterinario)
);

-- CREACION DE LA TABLA CONSULTAS
CREATE TABLE IF NOT EXISTS consultas(
id_consulta INT AUTO_INCREMENT,
fecha_consulta DATE NOT NULL,
diagnostico VARCHAR(100),
observaciones VARCHAR(200),
id_turno INT NOT NULL,
PRIMARY KEY (id_consulta),
FOREIGN KEY (id_turno) REFERENCES turnos(id_turno)
);

-- CREACION DE LA TABLA SERVICIOS
CREATE TABLE IF NOT EXISTS servicios(
id_servicio INT AUTO_INCREMENT,
nombre_servicio VARCHAR(100) NOT NULL,
descripcion VARCHAR(200),
costo DECIMAL(10,2) NOT NULL,
PRIMARY KEY (id_servicio)
);

-- CREACION DE LA TABLA PAGOS
CREATE TABLE IF NOT EXISTS pagos(
id_pago INT AUTO_INCREMENT,
fecha_pago DATE NOT NULL,
monto DECIMAL(10,2) NOT NULL,
medio_pago VARCHAR(30) NOT NULL,
estado_pago VARCHAR(20) NOT NULL,
id_consulta INT NOT NULL,
id_cliente INT NOT NULL,
PRIMARY KEY (id_pago),
FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta),
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- CREACION DE LA TABLA HISTORIAL MEDICO
CREATE TABLE IF NOT EXISTS historial_medico(
id_historial INT AUTO_INCREMENT,
fecha_registro DATE,
descripcion VARCHAR(100),
id_mascota INT,
id_consulta INT,
PRIMARY KEY (id_historial),
FOREIGN KEY (id_mascota) REFERENCES mascotas(id_mascota),
FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta)
);

-- CREACION DE LA TABLA INTERMEDIA CONSULTAS SERVICIOS QUE RELACIONA A AMBAS
-- Tiene una Clave Primaria Compuesta

CREATE TABLE IF NOT EXISTS consultas_servicios(
id_consulta INT NOT NULL,
id_servicio INT NOT NULL,
PRIMARY KEY (id_consulta, id_servicio),
FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta),
FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);

-- ///////////// CREACION DE LOS INDICES /////////////

CREATE INDEX idx_cliente_email
ON clientes(email);

CREATE INDEX idx_mascota_nombre
ON mascotas(nombre);

CREATE INDEX idx_veterinario_matricula
ON veterinarios(matricula);

CREATE INDEX idx_turno_fecha
ON turnos(fecha);

CREATE INDEX idx_pago_fecha
ON pagos(fecha_pago);

CREATE INDEX idx_consulta_fecha
ON consultas(fecha_consulta);