-- ASIGNACION DE LA BASE DE DATOS

USE veterinaria_sorzoli;

-- ////////////////// CLIENTES //////////////////

INSERT INTO clientes (nombre, apellido, telefono, email, direccion) VALUES
('JUAN','PEREZ','1514567890','juan.perez@yahoo.com','Calle 12 345'),
('Maria','Gomez','1515678901',NULL,'Av 7 122'),
('carlos','rodriguez','1516789012','c.rodriguez@outlook.com','Calle 50 900'),
('LUCIA','FERNANDEZ','1517890123','luciaf@hotmail.com','Calle 25 1450'),
('martin','lopez','1518901234',NULL,'Av 44 650'),
('SOFIA','MARTINEZ','1519012345','sofia.martinez@icloud.com','Calle 60 222'),
('Diego','Suarez','1513456789',NULL,'Av 13 890'),
('valentina','castro','1512345678','vale.castro@protonmail.com','Calle 8 130'),
('PeDro','RaMiRez','1511122334','pedro.ramirez@outlook.com','Calle 70 450'),
('cAmiLa','tOrRes','1519988776',NULL,'Av 19 321'),
('andres','mendez','1512233445',NULL,'Calle 100 123'),
('LAURA','paz','1513344556','laura.paz@gmail.com','Av 55 456'),
('eStEbAn','ruiz','1514455667',NULL,'Calle 20 890'),
('florencia','diaz','1515566778','flor.diaz@yahoo.com','Av 10 222'),
('RICARDO','sosa','1516677889',NULL,'Calle 33 333'),
('julian','pereyra','1517788990','julianp@gmail.com','Av 80 100'),
('Micaela','lozano','1518899001',NULL,'Calle 44 210'),
('tomas','arias','1519900112','tomas.a@hotmail.com','Av 90 555'),
('BRUNO','navarro','1521011223',NULL,'Calle 77 777'),
('camila','vega','1522122334','camivega@gmail.com','Av 22 888');

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
('Marina','Luna','VET1010','Clinica general'),
('Sergio','Molina','VET1011','Clinica general'),
('Paula','Herrera','VET1012','Cirugia'),
('Martin','Castillo','VET1013','Dermatologia'),
('Luciana','Ortega','VET1014','Cardiologia'),
('Andres','Ibarra','VET1015','Traumatologia'),
('Cecilia','Nuñez','VET1016','Clinica general'),
('Diego','Campos','VET1017','Cirugia'),
('Valeria','Vargas','VET1018','Dermatologia'),
('Hector','Cabrera','VET1019','Cardiologia'),
('Natalia','Reyes','VET1020','Clinica general');

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
('Felix','Gato','Mestizo','2019-10-30','Macho',4),
('bobby','Perro','Beagle','2020-01-10','Macho',11),
('lola','Gato','Siames','2021-07-15','Hembra',12),
('thor','Perro','Pitbull','2019-05-20','Macho',13),
('Kira','Perro','Caniche','2022-03-05','Hembra',14),
('garfield','Gato','Persa','2018-09-11','Macho',15),
('simona','Perro','Golden','2023-02-01','Hembra',16),
('cleo','Gato','Mestizo','2022-06-30','Hembra',17),
('zeus','Perro','Pastor','2020-11-10','Macho',18),
('oliver','Gato','Angora','2021-08-18','Macho',19),
('rex','Perro','Doberman','2019-04-22','Macho',20);

-- ////////////////// TURNOS //////////////////

INSERT INTO turnos (fecha, hora, estado, id_mascota, id_veterinario) VALUES
('2026-01-02','09:00:00','completado',1,1),
('2026-01-03','10:00:00','completado',2,2),
('2026-01-04','11:00:00','completado',3,1),
('2026-01-05','12:00:00','completado',4,3),
('2026-01-06','09:30:00','completado',5,2),
('2026-01-07','10:30:00','completado',6,1),
('2026-01-08','11:30:00','completado',7,4),
('2026-01-09','12:30:00','pendiente',8,3),
('2026-01-10','09:15:00','completado',9,2),
('2026-01-11','10:15:00','completado',10,1),
('2026-02-01','11:15:00','completado',11,4),
('2026-02-02','12:15:00','pendiente',12,3),
('2026-02-03','09:45:00','pendiente',1,2),
('2026-02-04','10:45:00','pendiente',2,1),
('2026-02-05','11:45:00','pendiente',3,4),
('2026-02-06','09:00:00','completado',1,3),
('2026-02-07','10:00:00','completado',1,2),
('2026-02-08','11:00:00','completado',2,1),
('2026-02-09','12:00:00','completado',3,4),
('2026-02-10','09:30:00','completado',4,2),
('2026-02-11','10:30:00','completado',5,3),
('2026-02-12','11:30:00','completado',6,1),
('2026-02-13','12:30:00','completado',7,4),
('2026-03-01','09:00:00','pendiente',13,11),
('2026-03-02','10:00:00','pendiente',14,12),
('2026-03-03','11:00:00','pendiente',15,13),
('2026-03-04','12:00:00','pendiente',16,14),
('2026-03-05','09:30:00','completado',17,15),
('2026-03-06','10:30:00','completado',18,16),
('2026-03-07','11:30:00','completado',19,17),
('2026-03-08','12:30:00','pendiente',20,18),
('2026-03-09','09:15:00','pendiente',21,19),
('2026-03-10','10:15:00','pendiente',22,20);

-- ////////////////// CONSULTAS //////////////////

INSERT INTO consultas (fecha_consulta, diagnostico, observaciones, id_turno) VALUES
('2026-01-02','Control general','Mascota en buen estado',1),
('2026-01-03','Infeccion leve','Se receta antibiotico',2),
('2026-01-04','Dolor estomacal','Dieta especial por 7 dias',3),
('2026-01-05','Vacunacion','Vacuna antirrabica aplicada',4),
('2026-01-06','Dermatitis','Tratamiento con crema',5),
('2026-01-07','Control dental','Limpieza recomendada',6),
('2026-01-10','Control general','Sin problemas detectados',9),
('2026-01-11','Problema respiratorio','Se indican estudios',10),
('2026-02-01','Dolor muscular','Reposo por 5 dias',11),
('2026-02-06','Control general','Chequeo anual',16),
('2026-02-07','Vacunacion','Refuerzo de vacuna',17),
('2026-02-08','Problema digestivo','Se recomienda dieta especial',18),
('2026-02-09','Dolor articular','Tratamiento antiinflamatorio',19),
('2026-02-10','Control general','Mascota en buen estado',20),
('2026-02-11','Alergia','Tratamiento antihistaminico',21),
('2026-02-12','Infeccion leve','Antibiotico por 5 dias',22),
('2026-02-13','Chequeo general','Sin observaciones',23);

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
('Desparasitacion','Tratamiento antiparasitario',4000),
('Control cardiologico','Revision del corazon',8500),
('Tratamiento digestivo','Problemas estomacales',6500),
('Cirugia mayor','Operacion compleja',50000),
('Control postoperatorio','Seguimiento',4000),
('Vacuna triple','Vacuna combinada',4500),
('Control ocular','Revision de ojos',3000),
('Terapia fisica','Rehabilitacion',7000),
('Analisis hormonal','Estudios hormonales',9500),
('Consulta urgente','Atencion inmediata',10000),
('Baño medicado','Higiene especial',3500);

-- ////////////////// CONSULTAS SERVICIOS //////////////////

INSERT INTO consultas_servicios VALUES
(1,1),
(2,5),
(3,3),
(4,2),
(5,6),
(6,4),
(7,1),
(8,5),
(9,1),
(10,1),
(11,2),
(12,5),
(13,7),
(14,1),
(15,6),
(16,5),
(17,1);

-- ////////////////// PAGOS //////////////////

INSERT INTO pagos (fecha_pago, monto, medio_pago, estado_pago, id_consulta, id_cliente) VALUES
('2026-01-02',5000,'Efectivo','Pagado',1,1),
('2026-01-03',6000,'Tarjeta','Pagado',2,2),
('2026-01-04',6000,'Transferencia','Pagado',3,3),
('2026-01-05',3500,'Efectivo','Pagado',4,4),
('2026-01-06',7000,'Tarjeta','Pagado',5,5),
('2026-01-07',8000,'Efectivo','Pagado',6,6),
('2026-01-10',5000,'Transferencia','Pagado',7,1),
('2026-01-11',6000,'Tarjeta','Pagado',8,2),
('2026-02-01',5000,'Tarjeta','Pendiente',9,3),
('2026-02-06',5000,'Efectivo','Pagado',10,1),
('2026-02-07',5000,'Efectivo','Pagado',11,1),
('2026-02-08',4500,'Tarjeta','Pagado',12,2),
('2026-02-09',7000,'Transferencia','Pagado',13,3),
('2026-02-10',8500,'Efectivo','Pendiente',14,4),
('2026-02-11',6000,'Tarjeta','Pagado',15,5),
('2026-02-12',9000,'Transferencia','Pagado',16,6),
('2026-02-13',10000,'Efectivo','Pendiente',17,7);

-- ////////////////// HISTORIAL MEDICO //////////////////

-- Los insertara el TRIGGER automaticamente