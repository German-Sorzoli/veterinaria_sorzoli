CREATE DATABASE  IF NOT EXISTS `veterinaria_sorzoli` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `veterinaria_sorzoli`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: veterinaria_sorzoli
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `idx_cliente_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Perez','1514567890','juan.perez@yahoo.com','Calle 12 345'),(2,'Maria','Gomez','1515678901','mariagomez@default.com','Av 7 122'),(3,'Carlos','Rodriguez','1516789012','c.rodriguez@outlook.com','Calle 50 900'),(4,'Lucia','Fernandez','1517890123','luciaf@hotmail.com','Calle 25 1450'),(5,'Martin','Lopez','1518901234','martinlopez@default.com','Av 44 650'),(6,'Sofia','Martinez','1519012345','sofia.martinez@icloud.com','Calle 60 222'),(7,'Diego','Suarez','1513456789','diegosuarez@default.com','Av 13 890'),(8,'Valentina','Castro','1512345678','vale.castro@protonmail.com','Calle 8 130'),(9,'Pedro','Ramirez','1511122334','pedro.ramirez@outlook.com','Calle 70 450'),(10,'Camila','Torres','1519988776','camilatorres@default.com','Av 19 321'),(11,'Andres','Mendez','1512233445','andresmendez@default.com','Calle 100 123'),(12,'Laura','Paz','1513344556','laura.paz@gmail.com','Av 55 456'),(13,'Esteban','Ruiz','1514455667','estebanruiz@default.com','Calle 20 890'),(14,'Florencia','Diaz','1515566778','flor.diaz@yahoo.com','Av 10 222'),(15,'Ricardo','Sosa','1516677889','ricardososa@default.com','Calle 33 333'),(16,'Julian','Pereyra','1517788990','julianp@gmail.com','Av 80 100'),(17,'Micaela','Lozano','1518899001','micaelalozano@default.com','Calle 44 210'),(18,'Tomas','Arias','1519900112','tomas.a@hotmail.com','Av 90 555'),(19,'Bruno','Navarro','1521011223','brunonavarro@default.com','Calle 77 777'),(20,'Camila','Vega','1522122334','camivega@gmail.com','Av 22 888');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_revision_nombre_apellido_cliente` BEFORE INSERT ON `clientes` FOR EACH ROW BEGIN
	SET NEW.nombre = CONCAT(UPPER(LEFT (NEW.nombre,1)), LOWER(SUBSTRING(NEW.nombre,2)));
    
    SET NEW.apellido = CONCAT(UPPER(LEFT (NEW.apellido,1)), LOWER(SUBSTRING(NEW.apellido,2)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_revision_mail` BEFORE INSERT ON `clientes` FOR EACH ROW BEGIN
	IF NEW.email IS NULL THEN
		SET NEW.email = CONCAT(lower(NEW.nombre),lower(NEW.apellido),'@default.com');
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultas` (
  `id_consulta` int NOT NULL AUTO_INCREMENT,
  `fecha_consulta` date NOT NULL,
  `diagnostico` varchar(100) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `id_turno` int NOT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `id_turno` (`id_turno`),
  KEY `idx_consulta_fecha` (`fecha_consulta`),
  CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id_turno`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
INSERT INTO `consultas` VALUES (1,'2026-01-02','Control general','Mascota en buen estado',1),(2,'2026-01-03','Infeccion leve','Se receta antibiotico',2),(3,'2026-01-04','Dolor estomacal','Dieta especial por 7 dias',3),(4,'2026-01-05','Vacunacion','Vacuna antirrabica aplicada',4),(5,'2026-01-06','Dermatitis','Tratamiento con crema',5),(6,'2026-01-07','Control dental','Limpieza recomendada',6),(7,'2026-01-10','Control general','Sin problemas detectados',9),(8,'2026-01-11','Problema respiratorio','Se indican estudios',10),(9,'2026-02-01','Dolor muscular','Reposo por 5 dias',11),(10,'2026-02-06','Control general','Chequeo anual',16),(11,'2026-02-07','Vacunacion','Refuerzo de vacuna',17),(12,'2026-02-08','Problema digestivo','Se recomienda dieta especial',18),(13,'2026-02-09','Dolor articular','Tratamiento antiinflamatorio',19),(14,'2026-02-10','Control general','Mascota en buen estado',20),(15,'2026-02-11','Alergia','Tratamiento antihistaminico',21),(16,'2026-02-12','Infeccion leve','Antibiotico por 5 dias',22),(17,'2026-02-13','Chequeo general','Sin observaciones',23);
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_registro_historial_medico` AFTER INSERT ON `consultas` FOR EACH ROW BEGIN
    DECLARE _id_mascota INT;
    -- Obtener id de mascota
    SELECT id_mascota
    INTO _id_mascota
    FROM turnos t
    WHERE t.id_turno = NEW.id_turno;
	-- Solo insertar si se encontró la mascota
    IF _id_mascota IS NOT NULL THEN
		-- Evitar duplicados
		IF NOT EXISTS (SELECT 1 FROM historial_medico WHERE id_consulta = NEW.id_consulta)
			THEN
			INSERT INTO historial_medico (fecha_registro, descripcion,id_mascota,id_consulta) VALUES
			(NEW.fecha_consulta,NEW.diagnostico,_id_mascota,NEW.id_consulta);
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `consultas_servicios`
--

DROP TABLE IF EXISTS `consultas_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultas_servicios` (
  `id_consulta` int NOT NULL,
  `id_servicio` int NOT NULL,
  PRIMARY KEY (`id_consulta`,`id_servicio`),
  KEY `id_servicio` (`id_servicio`),
  CONSTRAINT `consultas_servicios_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consultas` (`id_consulta`) ON DELETE CASCADE,
  CONSTRAINT `consultas_servicios_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas_servicios`
--

LOCK TABLES `consultas_servicios` WRITE;
/*!40000 ALTER TABLE `consultas_servicios` DISABLE KEYS */;
INSERT INTO `consultas_servicios` VALUES (1,1),(7,1),(9,1),(10,1),(14,1),(17,1),(4,2),(11,2),(3,3),(6,4),(2,5),(8,5),(12,5),(16,5),(5,6),(15,6),(13,7);
/*!40000 ALTER TABLE `consultas_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_medico`
--

DROP TABLE IF EXISTS `historial_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_medico` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `fecha_registro` date DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `id_mascota` int DEFAULT NULL,
  `id_consulta` int DEFAULT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_mascota` (`id_mascota`),
  KEY `id_consulta` (`id_consulta`),
  CONSTRAINT `historial_medico_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`) ON DELETE CASCADE,
  CONSTRAINT `historial_medico_ibfk_2` FOREIGN KEY (`id_consulta`) REFERENCES `consultas` (`id_consulta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_medico`
--

LOCK TABLES `historial_medico` WRITE;
/*!40000 ALTER TABLE `historial_medico` DISABLE KEYS */;
INSERT INTO `historial_medico` VALUES (1,'2026-01-02','Control general',1,1),(2,'2026-01-03','Infeccion leve',2,2),(3,'2026-01-04','Dolor estomacal',3,3),(4,'2026-01-05','Vacunacion',4,4),(5,'2026-01-06','Dermatitis',5,5),(6,'2026-01-07','Control dental',6,6),(7,'2026-01-10','Control general',9,7),(8,'2026-01-11','Problema respiratorio',10,8),(9,'2026-02-01','Dolor muscular',11,9),(10,'2026-02-06','Control general',1,10),(11,'2026-02-07','Vacunacion',1,11),(12,'2026-02-08','Problema digestivo',2,12),(13,'2026-02-09','Dolor articular',3,13),(14,'2026-02-10','Control general',4,14),(15,'2026-02-11','Alergia',5,15),(16,'2026-02-12','Infeccion leve',6,16),(17,'2026-02-13','Chequeo general',7,17);
/*!40000 ALTER TABLE `historial_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `especie` varchar(100) NOT NULL,
  `raza` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_mascota`),
  KEY `id_cliente` (`id_cliente`),
  KEY `idx_mascota_nombre` (`nombre`),
  CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` VALUES (1,'Firulais','Perro','Labrador','2019-03-10','Macho',1),(2,'Michi','Gato','Siames','2020-06-15','Hembra',2),(3,'Rocky','Perro','Boxer','2018-01-20','Macho',3),(4,'Luna','Perro','Caniche','2021-09-05','Hembra',4),(5,'Simba','Gato','Persa','2017-12-11','Macho',5),(6,'Toby','Perro','Golden Retriever','2022-02-01','Macho',6),(7,'Nala','Gato','Mestizo','2021-05-30','Hembra',7),(8,'Max','Perro','Pastor Aleman','2019-11-10','Macho',8),(9,'Kiara','Gato','Angora','2020-08-18','Hembra',1),(10,'Bruno','Perro','Bulldog','2018-04-22','Macho',2),(11,'Mora','Perro','Border Collie','2021-03-12','Hembra',3),(12,'Felix','Gato','Mestizo','2019-10-30','Macho',4),(13,'bobby','Perro','Beagle','2020-01-10','Macho',11),(14,'lola','Gato','Siames','2021-07-15','Hembra',12),(15,'thor','Perro','Pitbull','2019-05-20','Macho',13),(16,'Kira','Perro','Caniche','2022-03-05','Hembra',14),(17,'garfield','Gato','Persa','2018-09-11','Macho',15),(18,'simona','Perro','Golden','2023-02-01','Hembra',16),(19,'cleo','Gato','Mestizo','2022-06-30','Hembra',17),(20,'zeus','Perro','Pastor','2020-11-10','Macho',18),(21,'oliver','Gato','Angora','2021-08-18','Macho',19),(22,'rex','Perro','Doberman','2019-04-22','Macho',20);
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `fecha_pago` date NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `medio_pago` varchar(30) NOT NULL,
  `estado_pago` varchar(20) NOT NULL DEFAULT 'pendiente',
  `id_consulta` int NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_consulta` (`id_consulta`),
  KEY `id_cliente` (`id_cliente`),
  KEY `idx_pago_fecha` (`fecha_pago`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consultas` (`id_consulta`) ON DELETE CASCADE,
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,'2026-01-02',5000.00,'Efectivo','Pagado',1,1),(2,'2026-01-03',6000.00,'Tarjeta','Pagado',2,2),(3,'2026-01-04',6000.00,'Transferencia','Pagado',3,3),(4,'2026-01-05',3500.00,'Efectivo','Pagado',4,4),(5,'2026-01-06',7000.00,'Tarjeta','Pagado',5,5),(6,'2026-01-07',8000.00,'Efectivo','Pagado',6,6),(7,'2026-01-10',5000.00,'Transferencia','Pagado',7,1),(8,'2026-01-11',6000.00,'Tarjeta','Pagado',8,2),(9,'2026-02-01',5000.00,'Tarjeta','Pendiente',9,3),(10,'2026-02-06',5000.00,'Efectivo','Pagado',10,1),(11,'2026-02-07',5000.00,'Efectivo','Pagado',11,1),(12,'2026-02-08',4500.00,'Tarjeta','Pagado',12,2),(13,'2026-02-09',7000.00,'Transferencia','Pagado',13,3),(14,'2026-02-10',8500.00,'Efectivo','Pendiente',14,4),(15,'2026-02-11',6000.00,'Tarjeta','Pagado',15,5),(16,'2026-02-12',9000.00,'Transferencia','Pagado',16,6),(17,'2026-02-13',10000.00,'Efectivo','Pendiente',17,7);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_validar_pago` BEFORE INSERT ON `pagos` FOR EACH ROW BEGIN
	IF NEW.monto < 0 THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Error: el monto del pago debe ser mayor a 0';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `costo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Consulta general','Revision completa de la mascota',5000.00),(2,'Vacunacion','Aplicacion de vacunas',3500.00),(3,'Cirugia menor','Intervencion quirurgica simple',20000.00),(4,'Limpieza dental','Higiene bucal para mascotas',8000.00),(5,'Analisis de sangre','Estudios de laboratorio',6000.00),(6,'Tratamiento dermatologico','Tratamiento de afecciones en piel',7000.00),(7,'Radiografia','Estudio por imagen',9000.00),(8,'Ecografia','Diagnostico por ultrasonido',10000.00),(9,'Internacion','Cuidado intensivo',15000.00),(10,'Desparasitacion','Tratamiento antiparasitario',4000.00),(11,'Control cardiologico','Revision del corazon',8500.00),(12,'Tratamiento digestivo','Problemas estomacales',6500.00),(13,'Cirugia mayor','Operacion compleja',50000.00),(14,'Control postoperatorio','Seguimiento',4000.00),(15,'Vacuna triple','Vacuna combinada',4500.00),(16,'Control ocular','Revision de ojos',3000.00),(17,'Terapia fisica','Rehabilitacion',7000.00),(18,'Analisis hormonal','Estudios hormonales',9500.00),(19,'Consulta urgente','Atencion inmediata',10000.00),(20,'Baño medicado','Higiene especial',3500.00);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos` (
  `id_turno` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado` varchar(20) NOT NULL,
  `id_mascota` int NOT NULL,
  `id_veterinario` int NOT NULL,
  PRIMARY KEY (`id_turno`),
  KEY `id_mascota` (`id_mascota`),
  KEY `id_veterinario` (`id_veterinario`),
  KEY `idx_turno_fecha` (`fecha`),
  CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`) ON DELETE CASCADE,
  CONSTRAINT `turnos_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinarios` (`id_veterinario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` VALUES (1,'2026-01-02','09:00:00','completado',1,1),(2,'2026-01-03','10:00:00','completado',2,2),(3,'2026-01-04','11:00:00','completado',3,1),(4,'2026-01-05','12:00:00','completado',4,3),(5,'2026-01-06','09:30:00','completado',5,2),(6,'2026-01-07','10:30:00','completado',6,1),(7,'2026-01-08','11:30:00','completado',7,4),(8,'2026-01-09','12:30:00','pendiente',8,3),(9,'2026-01-10','09:15:00','completado',9,2),(10,'2026-01-11','10:15:00','completado',10,1),(11,'2026-02-01','11:15:00','completado',11,4),(12,'2026-02-02','12:15:00','pendiente',12,3),(13,'2026-02-03','09:45:00','pendiente',1,2),(14,'2026-02-04','10:45:00','pendiente',2,1),(15,'2026-02-05','11:45:00','pendiente',3,4),(16,'2026-02-06','09:00:00','completado',1,3),(17,'2026-02-07','10:00:00','completado',1,2),(18,'2026-02-08','11:00:00','completado',2,1),(19,'2026-02-09','12:00:00','completado',3,4),(20,'2026-02-10','09:30:00','completado',4,2),(21,'2026-02-11','10:30:00','completado',5,3),(22,'2026-02-12','11:30:00','completado',6,1),(23,'2026-02-13','12:30:00','completado',7,4),(24,'2026-03-01','09:00:00','pendiente',13,11),(25,'2026-03-02','10:00:00','pendiente',14,12),(26,'2026-03-03','11:00:00','pendiente',15,13),(27,'2026-03-04','12:00:00','pendiente',16,14),(28,'2026-03-05','09:30:00','completado',17,15),(29,'2026-03-06','10:30:00','completado',18,16),(30,'2026-03-07','11:30:00','completado',19,17),(31,'2026-03-08','12:30:00','pendiente',20,18),(32,'2026-03-09','09:15:00','pendiente',21,19),(33,'2026-03-10','10:15:00','pendiente',22,20);
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinarios`
--

DROP TABLE IF EXISTS `veterinarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinarios` (
  `id_veterinario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `matricula` varchar(30) NOT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_veterinario`),
  KEY `idx_veterinario_matricula` (`matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinarios`
--

LOCK TABLES `veterinarios` WRITE;
/*!40000 ALTER TABLE `veterinarios` DISABLE KEYS */;
INSERT INTO `veterinarios` VALUES (1,'Roberto','Alvarez','VET1001','Clinica general'),(2,'Ana','Martinez','VET1002','Cirugia'),(3,'Fernando','Gutierrez','VET1003','Dermatologia'),(4,'Carolina','Diaz','VET1004','Cardiologia'),(5,'Miguel','Rojas','VET1005','Traumatologia'),(6,'Laura','Silva','VET1006','Clinica general'),(7,'Pablo','Benitez','VET1007','Cirugia'),(8,'Julieta','Sosa','VET1008','Dermatologia'),(9,'Gustavo','Acosta','VET1009','Cardiologia'),(10,'Marina','Luna','VET1010','Clinica general'),(11,'Sergio','Molina','VET1011','Clinica general'),(12,'Paula','Herrera','VET1012','Cirugia'),(13,'Martin','Castillo','VET1013','Dermatologia'),(14,'Luciana','Ortega','VET1014','Cardiologia'),(15,'Andres','Ibarra','VET1015','Traumatologia'),(16,'Cecilia','Nuñez','VET1016','Clinica general'),(17,'Diego','Campos','VET1017','Cirugia'),(18,'Valeria','Vargas','VET1018','Dermatologia'),(19,'Hector','Cabrera','VET1019','Cardiologia'),(20,'Natalia','Reyes','VET1020','Clinica general');
/*!40000 ALTER TABLE `veterinarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_clientes_mascotas`
--

DROP TABLE IF EXISTS `vista_clientes_mascotas`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes_mascotas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes_mascotas` AS SELECT 
 1 AS `Nombre_Mascota`,
 1 AS `Especie`,
 1 AS `Raza`,
 1 AS `Sexo`,
 1 AS `Apellido_Cliente`,
 1 AS `Nombre_Cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_historial_mascota`
--

DROP TABLE IF EXISTS `vista_historial_mascota`;
/*!50001 DROP VIEW IF EXISTS `vista_historial_mascota`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_historial_mascota` AS SELECT 
 1 AS `ID_Mascota`,
 1 AS `Nombre_Mascota`,
 1 AS `Especie`,
 1 AS `Raza`,
 1 AS `Apellido_Dueno`,
 1 AS `Nombre_Dueno`,
 1 AS `Fecha_Consulta`,
 1 AS `Diagnostico`,
 1 AS `Observaciones`,
 1 AS `Apellido_Veterinario`,
 1 AS `Nombre_Veterinario`,
 1 AS `Especialidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_pagos_clientes`
--

DROP TABLE IF EXISTS `vista_pagos_clientes`;
/*!50001 DROP VIEW IF EXISTS `vista_pagos_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_pagos_clientes` AS SELECT 
 1 AS `ID_Pago`,
 1 AS `Fecha_Pago`,
 1 AS `Monto`,
 1 AS `Apellido_Cliente`,
 1 AS `Nombre_Cliente`,
 1 AS `Concepto`,
 1 AS `Medio_Pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_turnos_detalle`
--

DROP TABLE IF EXISTS `vista_turnos_detalle`;
/*!50001 DROP VIEW IF EXISTS `vista_turnos_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_turnos_detalle` AS SELECT 
 1 AS `Fecha`,
 1 AS `Hora`,
 1 AS `Mascota`,
 1 AS `Apellido_Veterinario`,
 1 AS `Nombre_Veterinario`,
 1 AS `Especialidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'veterinaria_sorzoli'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_calculo_edad_mascota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_calculo_edad_mascota`(_fecha_nac DATE) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE _edad_mascota INT;
    -- TIMESTAMPDIFF es una funcion que me permite restar dos fechas y expresarlas en años (en este caso)
    -- Resto la fecha de nacimiento por la fecha actual y devuelvo ese resultado
	SET _edad_mascota = TIMESTAMPDIFF(YEAR, _fecha_nac, CURDATE());
	RETURN _edad_mascota;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_cantidad_consultas_mascota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_cantidad_consultas_mascota`(_id_mascota INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE _cantidad_consultas INT;
    -- Usando la funcion interna COUNT cuento la cantidad de filas que cumplen la condicion de ser el mismo ID, o sea, la cantidad de consultas en el historial
	SELECT COUNT(*) INTO _cantidad_consultas FROM veterinaria_sorzoli.historial_medico AS hm WHERE hm.id_mascota = _id_mascota;
	RETURN _cantidad_consultas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_pagos_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_pagos_cliente`(_id_cliente INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
	DECLARE _total_pagos DECIMAL(10,2);
    -- En este caso el resultado de la consulta sera una suma de montos, el resultado se muestra en un solo registro
    SELECT SUM(monto) INTO _total_pagos FROM veterinaria_sorzoli.pagos WHERE veterinaria_sorzoli.pagos.id_cliente = _id_cliente AND estado_pago='Pagado';
    -- La funcion interna IFNULL muestra el valor deseado, y si el valor devuelve NULL, lo reemplaza por un valor por defecto= 0
	RETURN IFNULL(_total_pagos,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mascotas_de_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mascotas_de_cliente`(IN _cliente INT)
BEGIN
	-- Verifico que el Cliente existe
	IF NOT EXISTS (SELECT 1 FROM clientes WHERE id_cliente = _cliente) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el cliente no existe';
    END IF;
SELECT
	m.nombre,
    m.especie,
    m.raza,
    m.sexo
FROM mascotas AS m WHERE m.id_cliente = _cliente ORDER BY m.nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_consulta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_consulta`(
IN _id_turno INT,
IN _diagnostico VARCHAR(100),
IN _observaciones VARCHAR(200)
)
BEGIN
    DECLARE _estado_turno VARCHAR(20);
    -- Si no hay resultado, descarto la opcion de ingresar consulta
    IF NOT EXISTS (SELECT 1 FROM turnos WHERE id_turno = _id_turno) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el turno no existe';
    END IF;
    -- Obtener estado del turno
    -- Filtro datos de los turnos previamente ingresados, comparando el numero de turno reservado
    SELECT estado
    INTO _estado_turno
    FROM turnos
    WHERE id_turno = _id_turno;
    -- Validar estado
    IF _estado_turno <> 'pendiente' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el turno ya fue realizado o cancelado';
    END IF;
    
    START TRANSACTION;   
    
    -- Insertar consulta
    INSERT INTO consultas (fecha_consulta, diagnostico, observaciones, id_turno)
    VALUES (CURDATE(), _diagnostico, _observaciones, _id_turno);
    -- Actualizar estado del turno
    UPDATE turnos
    SET estado = 'completado'
    WHERE id_turno = _id_turno;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_pago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_pago`(
	IN _fecha DATE,
	IN _monto DECIMAL (10,2),
	IN _medio VARCHAR(30),
	IN _estado VARCHAR(30),
	IN _id_consulta INT,
	IN _id_cliente INT
	)
BEGIN
		-- Valido monto mayor que 0
		IF _monto <= 0 THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: el monto debe ser mayor a 0';
		END IF;
    -- Validar cliente
		IF NOT EXISTS (SELECT 1 FROM clientes WHERE id_cliente = _id_cliente) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: el cliente no existe';
		END IF;
    -- Validar consulta
		IF NOT EXISTS (SELECT 1 FROM consultas WHERE id_consulta = _id_consulta) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: la consulta no existe';
		END IF;
	-- Inserto datos si todo esta correcto
		START TRANSACTION;
        -- Si ya existe un pago para esa consulta, se actualiza
		IF EXISTS (SELECT 1 FROM pagos WHERE id_consulta = _id_consulta) THEN
			  UPDATE pagos
				SET 
					fecha_pago = _fecha,
					monto = _monto,
					medio_pago = _medio,
					estado_pago = _estado,
					id_cliente = _id_cliente
				WHERE id_consulta = _id_consulta;
		ELSE
			INSERT INTO pagos (fecha_pago, monto, medio_pago, estado_pago, id_consulta, id_cliente)
			VALUES (_fecha, _monto, _medio, _estado, _id_consulta, _id_cliente);
		END IF;
        
		COMMIT;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_turno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_turno`(
    IN _fecha DATE,
    IN _hora TIME,
    IN _estado VARCHAR(20),
    IN _nombre_mascota VARCHAR(100),
    IN _nombre_veterinario VARCHAR(100),
    IN _apellido_veterinario VARCHAR(100)
)
BEGIN
	-- Declaro variables para luego en base a los parámetros encontrar esos datos e insertar el nuevo turno
    -- Me resulta mas comodo ingresar nombres antes que IDs
    DECLARE _id_mascota INT;
    DECLARE _id_veterinario INT;
    
    -- Si ocurre cualquier error → rollback automático
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    
		-- Obtener ID de la mascota a partir del nombre
		SELECT id_mascota 
		INTO _id_mascota
		FROM mascotas
		WHERE nombre = _nombre_mascota
		LIMIT 1;
        -- Valido si se encontro mascota
          IF _id_mascota IS NULL THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: mascota no encontrada';
		END IF;
		-- Obtener ID del veterinario a partir de nombre y apellido
		SELECT id_veterinario
		INTO _id_veterinario
		FROM veterinarios
		WHERE nombre = _nombre_veterinario
		  AND apellido = _apellido_veterinario
		LIMIT 1;
        -- Valido si se encontro veterinario
        IF _id_veterinario IS NULL THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: veterinario no encontrado';
		END IF;
		-- Insertar el turno usando los IDs encontrados
		INSERT INTO turnos (fecha, hora, estado, id_mascota, id_veterinario)
		VALUES (_fecha, _hora, _estado, _id_mascota, _id_veterinario);
		
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_clientes_mascotas`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes_mascotas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes_mascotas` AS select `m`.`nombre` AS `Nombre_Mascota`,`m`.`especie` AS `Especie`,`m`.`raza` AS `Raza`,`m`.`sexo` AS `Sexo`,`c`.`apellido` AS `Apellido_Cliente`,`c`.`nombre` AS `Nombre_Cliente` from (`mascotas` `m` join `clientes` `c` on((`c`.`id_cliente` = `m`.`id_cliente`))) order by `m`.`nombre`,`c`.`apellido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_historial_mascota`
--

/*!50001 DROP VIEW IF EXISTS `vista_historial_mascota`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_historial_mascota` AS select `m`.`id_mascota` AS `ID_Mascota`,`m`.`nombre` AS `Nombre_Mascota`,`m`.`especie` AS `Especie`,`m`.`raza` AS `Raza`,`c`.`apellido` AS `Apellido_Dueno`,`c`.`nombre` AS `Nombre_Dueno`,`co`.`fecha_consulta` AS `Fecha_Consulta`,`co`.`diagnostico` AS `Diagnostico`,`co`.`observaciones` AS `Observaciones`,`v`.`apellido` AS `Apellido_Veterinario`,`v`.`nombre` AS `Nombre_Veterinario`,`v`.`especialidad` AS `Especialidad` from (((((`historial_medico` `h` join `mascotas` `m` on((`h`.`id_mascota` = `m`.`id_mascota`))) join `consultas` `co` on((`h`.`id_consulta` = `co`.`id_consulta`))) join `turnos` `t` on((`co`.`id_turno` = `t`.`id_turno`))) join `veterinarios` `v` on((`t`.`id_veterinario` = `v`.`id_veterinario`))) join `clientes` `c` on((`m`.`id_cliente` = `c`.`id_cliente`))) order by `m`.`nombre`,`co`.`fecha_consulta` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pagos_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vista_pagos_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pagos_clientes` AS select `p`.`id_pago` AS `ID_Pago`,`p`.`fecha_pago` AS `Fecha_Pago`,`p`.`monto` AS `Monto`,`c`.`apellido` AS `Apellido_Cliente`,`c`.`nombre` AS `Nombre_Cliente`,`co`.`diagnostico` AS `Concepto`,`p`.`medio_pago` AS `Medio_Pago` from ((`pagos` `p` join `clientes` `c` on((`p`.`id_cliente` = `c`.`id_cliente`))) join `consultas` `co` on((`p`.`id_consulta` = `co`.`id_consulta`))) where (`p`.`estado_pago` = 'Pagado') order by `p`.`fecha_pago` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_turnos_detalle`
--

/*!50001 DROP VIEW IF EXISTS `vista_turnos_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_turnos_detalle` AS select `t`.`fecha` AS `Fecha`,`t`.`hora` AS `Hora`,`m`.`nombre` AS `Mascota`,`v`.`apellido` AS `Apellido_Veterinario`,`v`.`nombre` AS `Nombre_Veterinario`,`v`.`especialidad` AS `Especialidad` from ((`turnos` `t` join `mascotas` `m` on((`t`.`id_mascota` = `m`.`id_mascota`))) join `veterinarios` `v` on((`t`.`id_veterinario` = `v`.`id_veterinario`))) order by `t`.`fecha` desc,`t`.`hora` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-16 19:18:53
