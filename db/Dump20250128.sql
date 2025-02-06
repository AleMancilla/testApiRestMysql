CREATE DATABASE  IF NOT EXISTS `railway` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `railway`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: monorail.proxy.rlwy.net    Database: railway
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `ADMINISTRADOR`
--

DROP TABLE IF EXISTS `ADMINISTRADOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMINISTRADOR` (
  `idAdministrador` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idAdministrador`),
  CONSTRAINT `ADMINISTRADOR_ibfk_1` FOREIGN KEY (`idAdministrador`) REFERENCES `EMPLEADO` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMINISTRADOR`
--

LOCK TABLES `ADMINISTRADOR` WRITE;
/*!40000 ALTER TABLE `ADMINISTRADOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMINISTRADOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ALQUILER`
--

DROP TABLE IF EXISTS `ALQUILER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ALQUILER` (
  `idAlquiler` int NOT NULL AUTO_INCREMENT,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  PRIMARY KEY (`idAlquiler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALQUILER`
--

LOCK TABLES `ALQUILER` WRITE;
/*!40000 ALTER TABLE `ALQUILER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ALQUILER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `APRUEBA`
--

DROP TABLE IF EXISTS `APRUEBA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `APRUEBA` (
  `idAdministrador` int NOT NULL,
  `idCita` int NOT NULL,
  PRIMARY KEY (`idAdministrador`,`idCita`),
  KEY `idCita` (`idCita`),
  CONSTRAINT `APRUEBA_ibfk_1` FOREIGN KEY (`idAdministrador`) REFERENCES `ADMINISTRADOR` (`idAdministrador`),
  CONSTRAINT `APRUEBA_ibfk_2` FOREIGN KEY (`idCita`) REFERENCES `CITA` (`idCita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APRUEBA`
--

LOCK TABLES `APRUEBA` WRITE;
/*!40000 ALTER TABLE `APRUEBA` DISABLE KEYS */;
/*!40000 ALTER TABLE `APRUEBA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CITA`
--

DROP TABLE IF EXISTS `CITA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CITA` (
  `idCita` int NOT NULL AUTO_INCREMENT,
  `fechaCita` int DEFAULT NULL,
  `descripcion` text,
  `idUsuario` int DEFAULT NULL,
  `idEspecialista` int DEFAULT NULL,
  `numeroCelular` varchar(10) DEFAULT NULL,
  `nombrePaciente` varchar(100) DEFAULT NULL,
  `idSucursal` int DEFAULT NULL,
  `estadoConfirmacion` varchar(45) DEFAULT 'pendiente',
  PRIMARY KEY (`idCita`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idEspecialista` (`idEspecialista`),
  CONSTRAINT `CITA_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `USUARIO` (`idUsuario`),
  CONSTRAINT `CITA_ibfk_2` FOREIGN KEY (`idEspecialista`) REFERENCES `ESPECIALISTA` (`idEspecialista`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CITA`
--

LOCK TABLES `CITA` WRITE;
/*!40000 ALTER TABLE `CITA` DISABLE KEYS */;
INSERT INTO `CITA` VALUES (1,1231223,'esta es la descripcion',1,NULL,'65537461','test nombre',1,'pendiente'),(2,1231223,'esta es la descripcion',1,NULL,'65537461','test nombre',1,'pendiente');
/*!40000 ALTER TABLE `CITA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONTIENE`
--

DROP TABLE IF EXISTS `CONTIENE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONTIENE` (
  `idOrden` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`idOrden`,`idProducto`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `CONTIENE_ibfk_1` FOREIGN KEY (`idOrden`) REFERENCES `ORDEN` (`idOrden`),
  CONSTRAINT `CONTIENE_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `PRODUCTO` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONTIENE`
--

LOCK TABLES `CONTIENE` WRITE;
/*!40000 ALTER TABLE `CONTIENE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONTIENE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLEADO`
--

DROP TABLE IF EXISTS `EMPLEADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLEADO` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLEADO`
--

LOCK TABLES `EMPLEADO` WRITE;
/*!40000 ALTER TABLE `EMPLEADO` DISABLE KEYS */;
/*!40000 ALTER TABLE `EMPLEADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESPECIALISTA`
--

DROP TABLE IF EXISTS `ESPECIALISTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ESPECIALISTA` (
  `idEspecialista` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idEspecialista`),
  CONSTRAINT `ESPECIALISTA_ibfk_1` FOREIGN KEY (`idEspecialista`) REFERENCES `EMPLEADO` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESPECIALISTA`
--

LOCK TABLES `ESPECIALISTA` WRITE;
/*!40000 ALTER TABLE `ESPECIALISTA` DISABLE KEYS */;
/*!40000 ALTER TABLE `ESPECIALISTA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FAVORITO`
--

DROP TABLE IF EXISTS `FAVORITO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FAVORITO` (
  `idUsuario` int NOT NULL,
  `idProducto` int NOT NULL,
  PRIMARY KEY (`idUsuario`,`idProducto`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `FAVORITO_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `USUARIO` (`idUsuario`),
  CONSTRAINT `FAVORITO_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `PRODUCTO` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FAVORITO`
--

LOCK TABLES `FAVORITO` WRITE;
/*!40000 ALTER TABLE `FAVORITO` DISABLE KEYS */;
/*!40000 ALTER TABLE `FAVORITO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDEN`
--

DROP TABLE IF EXISTS `ORDEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORDEN` (
  `idOrden` int NOT NULL AUTO_INCREMENT,
  `nit` varchar(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idOrden`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `ORDEN_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `USUARIO` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDEN`
--

LOCK TABLES `ORDEN` WRITE;
/*!40000 ALTER TABLE `ORDEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO`
--

DROP TABLE IF EXISTS `PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCTO` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `descripcion` text,
  `tipoVenta` varchar(50) DEFAULT NULL,
  `tallas` varchar(100) DEFAULT NULL,
  `opcionAmedida` varchar(10) DEFAULT NULL,
  `colores` varchar(255) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `categorias` varchar(150) DEFAULT NULL,
  `indicacion` text,
  `material` text,
  `dimension` varchar(100) DEFAULT NULL,
  `otros` text,
  `precio` decimal(10,2) DEFAULT NULL,
  `efectos` text,
  `silueta` varchar(50) DEFAULT NULL,
  `urlImages` text,
  `activo` varchar(10) DEFAULT '1',
  `stock` int DEFAULT NULL,
  `peso` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO`
--

LOCK TABLES `PRODUCTO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO` DISABLE KEYS */;
INSERT INTO `PRODUCTO` VALUES (48,'','','','','','','','','','','','',0.00,'','','https://static.vecteezy.com/system/resources/thumbnails/022/191/132/small/colorful-cat-white-background-dripping-art-free-photo.jpg,https://concepto.de/wp-content/uploads/2018/09/arte-visual1-e1537976624707.jpg,','false',NULL,NULL),(53,'asdasdasd','asdasdasd','asda','d','no','','','','','','','',0.00,'','','https://media.istockphoto.com/id/1414159406/es/vector/multicolor-abstracto-rojo-naranja-verde-p%C3%BArpura-amarillo-colorido-ondulado-papelcut.jpg?s=612x612&w=0&k=20&c=UNjQErYytEZGkh72OyyN0XvryBi_G7_NUmQGwmK34jg=','true',12,''),(61,'Mentonera','Sujeción y Ajuste Perfectos para Problemas Maxilofaciales.\nNuestra mentonera ofrece sujeción y ajuste óptimos del mentón hacia la cabeza, ideal para problemas maxilofaciales.\n\nCaracterísticas Principales:\n\nAjuste Preciso: Se adapta perfectamente a la anatomía del mentón.\nMaterial Confortable: Fabricada con materiales suaves y transpirables.\nCorrección y Prevención: Perfecta para terapias postoperatorias y corrección postural.\nFácil de Usar: Correas ajustables para una colocación sencilla y segura.\nBeneficios:\n\nEstabilidad y Seguridad: Mantiene el mentón en posición adecuada.\nConfort Duradero: Uso prolongado sin irritaciones.\nVersatilidad: Ideal para rehabilitación maxilofacial y soporte diario.\n','receta','a medida','24-48hrs','correa beige, mentonera color piel','01-MENT','null','Post operatorio, corregir las maloclusiones de clase III con prognatismo mandibular','Correa resistente regulable, cuero.','Ultraligero','null',130.00,'Protección y sujeción','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/Mentonera.webp?alt=media&token=b08828ad-27ff-4f90-a582-371006fce67b,null','true',100,'Ultraligero'),(62,'Collarín filadelfia','Collarín anatómico fabricado en materiales semirrígidos, puede ser de una o dos piezas, siendo este último regulable en altura. Proporciona soporte para la columna cervical, apoyándose en el mentón, occipucio, clavículas; cuenta  con cierre de velcro en la parte posterior.','receta','Regulable','null','piel/blanco','08-40402','null','Traumatismo directo del raquis cervical, postquirúrgico','Confeccionado de goma semirrígida','Ligero','null',175.00,'Protección y sujeción','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CollarinFiladelfia.webp?alt=media&token=d9e656ea-79b2-4110-9f81-f4cdfb03647d,null','true',100,'Ligero'),(63,'Casco para Plagiocefalia','Las ortesis hechas de termoplástico, con acolchado interior y sujeción por correas, son ideales para tratar plagiocefalia, una deformidad del cráneo. Estas ortesis están diseñadas a medida, moldeadas para ajustarse exactamente a la cabeza del paciente, proporcionando soporte y promoviendo un desarrollo craneal adecuado.','receta','a medida','null','diseño personalizado','S/C','null','Plagiacefalia','null','Ultraligero','Órtesis Craneal',800.00,'Correción','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CascoParaPlagiocefalia.webp?alt=media&token=107b7183-ead3-4fe5-a347-4cfc4f5bbea5,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CascoParaPlagiocefalia2.webp?alt=media&token=7499e6e9-e3a9-48f7-b58d-168e6dc08f39','true',100,'Ultraligero'),(64,'Mentonera','Sujeción y Ajuste Perfectos para Problemas Maxilofaciales.\nNuestra mentonera ofrece sujeción y ajuste óptimos del mentón hacia la cabeza, ideal para problemas maxilofaciales.\n\nCaracterísticas Principales:\n\nAjuste Preciso: Se adapta perfectamente a la anatomía del mentón.\nMaterial Confortable: Fabricada con materiales suaves y transpirables.\nCorrección y Prevención: Perfecta para terapias postoperatorias y corrección postural.\nFácil de Usar: Correas ajustables para una colocación sencilla y segura.\nBeneficios:\n\nEstabilidad y Seguridad: Mantiene el mentón en posición adecuada.\nConfort Duradero: Uso prolongado sin irritaciones.\nVersatilidad: Ideal para rehabilitación maxilofacial y soporte diario.\n','receta','a medida','24-48hrs','correa beige, mentonera color piel','01-MENT','null','Post operatorio, corregir las maloclusiones de clase III con prognatismo mandibular','Correa resistente regulable, cuero.','Ultraligero','null',130.00,'Protección y sujeción','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/Mentonera.webp?alt=media&token=b08828ad-27ff-4f90-a582-371006fce67b,null','true',100,'Ultraligero'),(65,'Collarín filadelfia','Collarín anatómico fabricado en materiales semirrígidos, puede ser de una o dos piezas, siendo este último regulable en altura. Proporciona soporte para la columna cervical, apoyándose en el mentón, occipucio, clavículas; cuenta  con cierre de velcro en la parte posterior.','receta','Regulable','null','piel/blanco','08-40402','null','Traumatismo directo del raquis cervical, postquirúrgico','Confeccionado de goma semirrígida','Ligero','null',175.00,'Protección y sujeción','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CollarinFiladelfia.webp?alt=media&token=d9e656ea-79b2-4110-9f81-f4cdfb03647d,null','true',100,'Ligero'),(66,'Casco para Plagiocefalia','Las ortesis hechas de termoplástico, con acolchado interior y sujeción por correas, son ideales para tratar plagiocefalia, una deformidad del cráneo. Estas ortesis están diseñadas a medida, moldeadas para ajustarse exactamente a la cabeza del paciente, proporcionando soporte y promoviendo un desarrollo craneal adecuado.','receta','a medida','null','diseño personalizado','S/C','null','Plagiacefalia','null','Ultraligero','Órtesis Craneal',800.00,'Correción','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CascoParaPlagiocefalia.webp?alt=media&token=107b7183-ead3-4fe5-a347-4cfc4f5bbea5,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CascoParaPlagiocefalia2.webp?alt=media&token=7499e6e9-e3a9-48f7-b58d-168e6dc08f39','true',100,'Ultraligero');
/*!40000 ALTER TABLE `PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLICITA`
--

DROP TABLE IF EXISTS `SOLICITA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOLICITA` (
  `idUsuario` int NOT NULL,
  `idAlquiler` int NOT NULL,
  PRIMARY KEY (`idUsuario`,`idAlquiler`),
  KEY `idAlquiler` (`idAlquiler`),
  CONSTRAINT `SOLICITA_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `USUARIO` (`idUsuario`),
  CONSTRAINT `SOLICITA_ibfk_2` FOREIGN KEY (`idAlquiler`) REFERENCES `ALQUILER` (`idAlquiler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLICITA`
--

LOCK TABLES `SOLICITA` WRITE;
/*!40000 ALTER TABLE `SOLICITA` DISABLE KEYS */;
/*!40000 ALTER TABLE `SOLICITA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUCURSAL`
--

DROP TABLE IF EXISTS `SUCURSAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SUCURSAL` (
  `idSucursal` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(200) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `cel` varchar(45) DEFAULT NULL,
  `sucursal` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUCURSAL`
--

LOCK TABLES `SUCURSAL` WRITE;
/*!40000 ALTER TABLE `SUCURSAL` DISABLE KEYS */;
INSERT INTO `SUCURSAL` VALUES (1,'Calle Díaz Romero No 1704\nesq. República Dominicana lado Hospital Materno Infantil Zona Miraflores','2-2246411','71509638','CASA MATRIZ'),(2,'Av. 6 de Agosto No 2635\nEdif. Torre Elizabeth entre Pinilla y Pasaje Pascoe (Frente al Seguro Universitario)','2-2430832',NULL,'SUCURSAL LA PAZ'),(3,'Calle Jorge Carrasco entre Calle 10 y Av. Ladislao Cabrera Centro Comercial Rena Nº1070, local 8A  (Frente al Banco Unión o Parqueo Cielo Mall)','2-2829139',NULL,'SUCURSAL EL ALTO'),(4,'Av. Aniceto Arce Nº913 esq. Calle Colombia\n(Frente a la Plaza de La Mujer)','4-4363157',NULL,'SUCURSAL COCHABAMBA:'),(5,'Calle Costa Rica Nº74 casi Esq. Av. Busch entre 1ro. y 2do. Anillo.','3-3377402','71545361','SUCURSAL SANTA CRUZ');
/*!40000 ALTER TABLE `SUCURSAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIO` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `foto` varchar(255) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `uid` varchar(150) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` VALUES (1,'test.jpg','ale test22','test@gmail.com','adsasfr2134s','65537461','admin'),(2,'test2.jpg','ale test2','test@gmail2.com','adsasfr2134sasdasd','65537461','user'),(3,NULL,NULL,'test@gmail2.com','adsasfr2134sasdasd',NULL,'user'),(4,NULL,NULL,'aletest4@gmail.com','jG41nxExO1hI1QGhHriiVrFi32Q2',NULL,'user'),(5,'https://lh3.googleusercontent.com/a/ACg8ocI9kx-r7-8QR96WJ7PLghOcv4-wI36UlM9cl6wENPH8Sahga0Je=s96-c','Alejandro Mancilla','alejandro.mancilla.umsa@gmail.com','wpxbY1XVKBWNfcyaR2KdHxtKH0j2',NULL,'user'),(6,NULL,NULL,'aletest10@gmail.com','AXtPAgtEmqg6mDTDLUHsVA0K1Pi1',NULL,'user'),(7,NULL,NULL,'aletest9@gmail.com','EbCIROwEtrTr5hXJIKoMNSpXJb02',NULL,'user'),(8,NULL,NULL,'test@gmail3.com','adsasfr2134sasdasd',NULL,'user'),(9,NULL,NULL,'test@gmail4.com','adsasfr2134sasdasd',NULL,'user'),(10,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,NULL,'alee5@test.com','xYjFvWoTStNwguBrPlifHkaZOKF2',NULL,'user'),(13,NULL,NULL,'aletest101@gmail.com','6IuAvDOtXdSeufoWdhB6xC0mOzL2',NULL,'user'),(14,NULL,NULL,'aleale6@gmail.com','Svj1YuHKYKYaY50Q0cgFoBxspfj2',NULL,'user'),(15,NULL,NULL,'aletest104@gmail.com','sXMoQMbTt3WEfu4HHHqsaC0UHdy2',NULL,'user');
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-28 13:24:32
