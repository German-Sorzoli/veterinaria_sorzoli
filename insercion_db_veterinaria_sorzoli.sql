-- ASIGNACION DE LA BASE DE DATOS

USE veterinaria_sorzoli;

-- ////////////////// CLIENTES //////////////////

INSERT INTO clientes (nombre, apellido, telefono, email, direccion) VALUES
('Juan','Perez','1514567890','juanperez@gmail.com','Calle 12 345'),
('Maria','Gomez','1515678901','mariagomez@gmail.com','Av 7 122'),
('Carlos','Rodriguez','1516789012','carlosrodriguez@gmail.com','Calle 50 900'),
('Lucia','Fernandez','1517890123','luciaf@gmail.com','Calle 25 1450'),
('Martin','Lopez','1518901234','martinlopez@gmail.com','Av 44 650'),
('Sofia','Martinez','1519012345','sofia@gmail.com','Calle 60 222'),
('Diego','Suarez','1513456789','diegosuarez@gmail.com','Av 13 890'),
('Valentina','Castro','1512345678','valecastro@gmail.com','Calle 8 130'),
('Pedro','Ramirez','1511122334','pedro@gmail.com','Calle 70 450'),
('Camila','Torres','1519988776','camila@gmail.com','Av 19 321');

-- ////////////////// VETERINARIOS //////////////////

INSERT INTO veterinarios (nombre, apellido, matricula, especialidad) VALUES
('Roberto','Alvarez','VET1001','Clinica general'),
('Ana','Martinez','VET1002','Cirugia'),
('Fernando','Gutierrez','VET1003','Dermatologia'),
('Carolina','Diaz','VET1004','Cardiologia'),
('Miguel','Rojas','VET1005','Traumatologia'),
('Laura','Silva','VET1006','Clinica general'),
('Pablo','Benitez','VET1007','Cirugia'),
('Julieta','Sosa','VET1008','Dermatologia'),
('Gustavo','Acosta','VET1009','Cardiologia'),
('Marina','Luna','VET1010','Clinica general');

-- ////////////////// MASCOTAS //////////////////

INSERT INTO mascotas (nombre, especie, raza, fecha_nacimiento, sexo, id_cliente) VALUES
('Firulais','Perro','Labrador','2019-03-10','Macho',1),
('Michi','Gato','Siames','2020-06-15','Hembra',2),
('Rocky','Perro','Boxer','2018-01-20','Macho',3),
('Luna','Perro','Caniche','2021-09-05','Hembra',4),
('Simba','Gato','Persa','2017-12-11','Macho',5),
('Toby','Perro','Golden Retriever','2022-02-01','Macho',6),
('Nala','Gato','Mestizo','2021-05-30','Hembra',7),
('Max','Perro','Pastor Aleman','2019-11-10','Macho',8),
('Kiara','Gato','Angora','2020-08-18','Hembra',1),
('Bruno','Perro','Bulldog','2018-04-22','Macho',2),
('Mora','Perro','Border Collie','2021-03-12','Hembra',3),
('Felix','Gato','Mestizo','2019-10-30','Macho',4);

-- ////////////////// TURNOS //////////////////

INSERT INTO turnos (fecha, hora, estado, id_mascota, id_veterinario) VALUES
('2025-06-01','09:00:00','completado',1,1),
('2025-06-01','10:00:00','completado',2,2),
('2025-06-02','11:00:00','completado',3,1),
('2025-06-02','12:00:00','completado',4,3),
('2025-06-03','09:30:00','completado',5,2),
('2025-06-03','10:30:00','completado',6,1),
('2025-06-04','11:30:00','completado',7,4),
('2025-06-04','12:30:00','pendiente',8,3),
('2025-06-05','09:15:00','completado',9,2),
('2025-06-05','10:15:00','completado',10,1),
('2025-06-06','11:15:00','completado',11,4),
('2025-06-06','12:15:00','pendiente',12,3),
('2025-06-07','09:45:00','pendiente',1,2),
('2025-06-07','10:45:00','pendiente',2,1),
('2025-06-08','11:45:00','pendiente',3,4),
('2025-06-10','09:00:00','completado',1,3),
('2025-06-15','10:00:00','completado',1,2),
('2025-06-12','11:00:00','completado',2,1),
('2025-06-18','12:00:00','completado',3,4),
('2025-06-20','09:30:00','completado',4,2),
('2025-06-21','10:30:00','completado',5,3),
('2025-06-22','11:30:00','completado',6,1),
('2025-06-23','12:30:00','completado',7,4);

-- ////////////////// CONSULTAS //////////////////

INSERT INTO consultas (fecha_consulta, diagnostico, observaciones, id_turno) VALUES
('2025-06-01','Control general','Mascota en buen estado',1),
('2025-06-01','Infeccion leve','Se receta antibiotico',2),
('2025-06-02','Dolor estomacal','Dieta especial por 7 dias',3),
('2025-06-03','Vacunacion','Vacuna antirrabica aplicada',5),
('2025-06-04','Dermatitis','Tratamiento con crema',7),
('2025-06-05','Control general','Sin problemas detectados',9),
('2025-06-05','Problema respiratorio','Se indican estudios',10),
('2025-06-03','Control dental','Limpieza recomendada',6),
('2025-06-02','Chequeo general','Buen estado general',4),
('2025-06-06','Dolor muscular','Reposo por 5 dias',11),
('2025-06-10','Control general','Chequeo anual',16),
('2025-06-15','Vacunacion','Refuerzo de vacuna',17),
('2025-06-12','Problema digestivo','Se recomienda dieta especial',18),
('2025-06-18','Dolor articular','Tratamiento antiinflamatorio',19),
('2025-06-20','Control general','Mascota en buen estado',20),
('2025-06-21','Alergia','Tratamiento antihistaminico',21),
('2025-06-22','Infeccion leve','Antibiotico por 5 dias',22),
('2025-06-23','Chequeo general','Sin observaciones',23);

-- ////////////////// SERVICIOS //////////////////

INSERT INTO servicios (nombre_servicio, descripcion, costo) VALUES
('Consulta general','Revision completa de la mascota',5000),
('Vacunacion','Aplicacion de vacunas',3500),
('Cirugia menor','Intervencion quirurgica simple',20000),
('Limpieza dental','Higiene bucal para mascotas',8000),
('Analisis de sangre','Estudios de laboratorio',6000),
('Tratamiento dermatologico','Tratamiento de afecciones en piel',7000),
('Radiografia','Estudio por imagen',9000),
('Ecografia','Diagnostico por ultrasonido',10000),
('Internacion','Cuidado intensivo',15000),
('Desparasitacion','Tratamiento antiparasitario',4000);

-- ////////////////// CONSULTAS SERVICIOS //////////////////

INSERT INTO consultas_servicios VALUES
(1,1),(2,1),(3,1),(4,2),(5,6),
(6,1),(7,5),(8,4),(9,1),(10,1);

-- ////////////////// PAGOS //////////////////

INSERT INTO pagos (fecha_pago, monto, medio_pago, estado_pago, id_consulta, id_cliente) VALUES
('2025-06-01',5000,'Efectivo','Pagado',1,1),
('2025-06-01',5000,'Tarjeta','Pagado',2,2),
('2025-06-02',5000,'Transferencia','Pagado',3,3),
('2025-06-03',3500,'Efectivo','Pagado',4,5),
('2025-06-04',7000,'Tarjeta','Pagado',5,7),
('2025-06-05',5000,'Transferencia','Pagado',6,1),
('2025-06-05',6000,'Tarjeta','Pagado',7,2),
('2025-06-03',8000,'Efectivo','Pagado',8,6),
('2025-06-02',5000,'Transferencia','Pagado',9,4),
('2025-06-06',5000,'Tarjeta','Pendiente',10,3);

-- ////////////////// HISTORIAL MEDICO //////////////////

INSERT INTO historial_medico (fecha_registro, descripcion, id_mascota, id_consulta) VALUES
('2025-06-01','Control general anual',1,1),
('2025-06-01','Tratamiento por infeccion',2,2),
('2025-06-02','Problema digestivo',3,3),
('2025-06-03','Vacuna aplicada',5,4),
('2025-06-04','Dermatitis tratada',7,5),
('2025-06-05','Chequeo general',9,6),
('2025-06-05','Problema respiratorio',10,7),
('2025-06-03','Control dental',6,8),
('2025-06-02','Chequeo general',4,9),
('2025-06-06','Dolor muscular',11,10),
('2025-06-10','Chequeo anual',1,11),
('2025-06-15','Vacuna aplicada',1,12),
('2025-06-12','Problema digestivo tratado',2,13),
('2025-06-18','Dolor articular controlado',3,14),
('2025-06-20','Control general',4,15),
('2025-06-21','Tratamiento alergia',5,16),
('2025-06-22','Infeccion tratada',6,17),
('2025-06-23','Chequeo general',7,18);