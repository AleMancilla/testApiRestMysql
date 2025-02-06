CREATE DATABASE  IF NOT EXISTS `railway` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `railway`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: railway
-- ------------------------------------------------------
-- Server version	8.3.0

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
  `opcionAmedida` varchar(100) DEFAULT NULL,
  `colores` varchar(255) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `categorias` varchar(150) DEFAULT NULL,
  `indicacion` text,
  `material` text,
  `dimension` varchar(100) DEFAULT NULL,
  `otros` text,
  `precio` text,
  `efectos` text,
  `silueta` varchar(50) DEFAULT NULL,
  `urlImages` text,
  `activo` varchar(10) DEFAULT '1',
  `stock` int DEFAULT NULL,
  `peso` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO`
--

LOCK TABLES `PRODUCTO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO` DISABLE KEYS */;
INSERT INTO `PRODUCTO` VALUES (48,'','','','','','','','','','','','','0.00','','','https://static.vecteezy.com/system/resources/thumbnails/022/191/132/small/colorful-cat-white-background-dripping-art-free-photo.jpg,https://concepto.de/wp-content/uploads/2018/09/arte-visual1-e1537976624707.jpg,','false',NULL,NULL),(175,'Casco para Plagiocefalia','Las ortesis hechas de termoplástico, con acolchado interior y sujeción por correas, son ideales para tratar plagiocefalia, una deformidad del cráneo. Estas ortesis están diseñadas a medida, moldeadas para ajustarse exactamente a la cabeza del paciente, proporcionando soporte y promoviendo un desarrollo craneal adecuado.','receta','a medida','null','diseño personalizado','S/C','null','Plagiacefalia','null','Ultraligero','Órtesis Craneal','800','Correción','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CascoParaPlagiocefalia.webp?alt=media&token=107b7183-ead3-4fe5-a347-4cfc4f5bbea5,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CascoParaPlagiocefalia2.webp?alt=media&token=7499e6e9-e3a9-48f7-b58d-168e6dc08f39','true',100,'Ultraligero'),(176,'Braguero inguinal elastico','Cinturón con cubierta suave, almohadilla acolchada a nivel de la región inguinal','receta','S,M,L','null','null','01-BIE','null','Hernia inguinal','Banda elástica, soporte plástico, botón de presión, velcro.','Ligero','null','200','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/braguero-inguinal.webp?alt=media&token=c4b506a3-314b-4d3d-b155-ee597bd58b53','true',100,'Ligero'),(177,'Rodillera articulada','Barras laterales que no imposibilitan el movimiento de la articulación, con bandas de velcro que favorecen la estabilización','receta','null','null','null','null','null','Inestabilidad capsulo-ligamentosas, luxación de ligamentos laterales, post quirúrgicos','Neopreno con bandas de velcro','Ligero','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/RodilleraArticulada2.webp?alt=media&token=67443866-3213-40fc-8a35-a3801ef68948,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/RodilleraArticulada.webp?alt=media&token=337abd15-e9c5-4667-bfb1-b49c15207bbb','true',100,'Ligero'),(178,'Rodillera fija','Limita la flexoextensión de rodilla dando mayor sujeción a nivel rotuliano, con bandas de velcro a nivel del muslo y de la pierna para mayor estabilización','receta','S, M, L, a medida','inmediata, 24-48hrs','azul jean','01-RDLFJA','null','Bursitis rotuliana, tendinitis, lesiones meniscales y ligamentosas, post quirúrgicos','Tela de neopreno','Ligero','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/RodilleraFija.webp?alt=media&token=2bb364bc-3431-422c-85ca-ae3481296739','true',100,'Ligero'),(179,'Faja muslera','Faja tipo cinturón que rodea la parte baja del abdomen sobre las crestas iliacas acoplado a una faja de muslo dando una sujercion sin interrumpir la movilidad de la articulación coxofemoral','receta','a medida','24-48hrs','piel','11-COR=FMSL','null','Lesiones tendinosas, distensiones o desgarros, protesis de cadera, fractura de cadera, luxaciones de cadera','Tela resistente, barra de aluminio.','Ligero','null','750','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FajaMuslera.webp?alt=media&token=5d953317-3309-4204-acfd-d939ac0e72be,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FajaMuslera2.webp?alt=media&token=50f608f1-1a0f-48fb-a565-2f1d3873a37d','true',100,'Ligero'),(180,'Faja muslera con grados','dispositivo de soporte diseñado para inmovilizar y estabilizar el área afectada, aliviando el dolor y facilitando la recuperación. Fabricada con materiales elásticos y transpirables, la faja se ajusta firmemente alrededor del tórax mediante correas de velcro, proporcionando una compresión uniforme que ayuda a limitar el movimiento de las costillas fracturadas. Su diseño ergonómico y ligero garantiza comodidad y permite su uso prolongado bajo la ropa','null','t/u','inmediata','null','null','null','null','null','null','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FajaMusleraConGrados.webp?alt=media&token=563e6cb1-3732-4499-a1c0-f24bda03ce62,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FajaMusleraConGrados2.webp?alt=media&token=704bdc12-d5d4-45f9-b311-5dc7b0d1d55d','true',100,'null'),(181,'Rodillera articulada graduable','Articulación regulable a 0° 15° 30° 45° 60° 75° 90° de flexo extensión, con barras laterales para una estabilización  y bandas de velcro para mayor sujeción','receta','universal regulable','entrega inmediata','negro','02-KN091','null','Inestabilidad capsulo-ligamentosas, luxación de ligamentos laterales, post quirúrgicos','Neopreno, velcro, regulador por grados.','Ligero','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/RodilleraConGrados.webp?alt=media&token=ca7ef894-514e-4c56-80eb-e7b450606a62','true',100,'Ligero'),(182,'Bota walker','Promueve una inmovilización','receta','S,M,L','entrega inmediata','negro','7011-08-01T00:00:00.000Z','null','- Inmovilización de fracturas','Termoplástico, tela esponjosa, velcro y pasadores de plástico.','Ligero','null','480','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/BotaWalker.webp?alt=media&token=89cb316f-0cb0-4154-bb2e-0f20ba959cb4','true',100,'Ligero'),(183,'Protector nasal','El protector nasal de polietileno con soporte frontal y malar proporciona protección estructural precisa y confortable para la región nasal. Diseñado para distribuir uniformemente la presión, minimiza el riesgo de úlceras y garantiza la comodidad del paciente. Fabricado con materiales de alta calidad médica, es óptimo para deportes de contacto y protección postoperatoria. El diseño ergonómico asegura un ajuste anatómico perfecto, reduciendo la movilidad no deseada y mejorando la estabilidad del protector. Además, es fácil de limpiar y reutilizable, lo que lo convierte en una opción práctica y económica.','libre','A MEDIDA','24-48hrs con prueba','piel o negro','S/C','null','Fractura, protección contra golpes','PVC, bandas elásticas, velcro','Ultraligero','Protector nasal deportivo','300','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/ProtectorNasal.webp?alt=media&token=daa9c3c9-1acd-4a67-987f-cd992806292c,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/ProtectorNasal2.webp?alt=media&token=1d2bf56d-43b4-4dca-9345-b744ebd9a4c5','true',100,'Ultraligero'),(184,'Férula antiequina AFO','Diseño anatómico, con acolchado de plastazote , y una sujeción con bandas de velcro.','receta','a medida','48-72hrs','transparente, diseño personalizado','11-FMI=AFO','null','Pie equino, pie bott','Polipropileno moldeado a medida, plastazote, velcro.','Ligero','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FerulaAntiequinoAFO.webp?alt=media&token=ab439acc-a498-4e2f-a51f-cb5b48bee802','true',100,'Ligero'),(185,'Estabilizador de Tobillo - Tobillera pauhercast','Cuenta con dos varillas de alta resistencia de forma de conchas anatómicas que restringen los movimientos de inversión y eversión del tobillo. Proporcionando estabilidad y soporte','receta','null','null','null','07-AC080','null','Lesiones, traumatismos de tobillo, prevención de esguinces, indicada para práctica deportiva','Varillas resistentes, pauher cast, cojín lateral suave','Ultraligero','null','270','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/EstabilizadorDeTobillo.webp?alt=media&token=368a3688-1794-414a-8d82-ba93b7b2c02c','true',100,'Ultraligero'),(186,'Tobillera','Tiene peso, movilidad y consistencia similar a un seno, lo que le convierte de una réplica de un seno natural.','receta','null','null','null','01-TBLRATEL','null','Tendinitis aquiliana, fascitis plantar, espolón calcáneo, contusiones, osteoporosis, patologías del sistema osteo articular. Indicada para atleta, gimnastas','Tela resistente, con varillas de plástico','Ultraligero','null','100','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/Tobillera.webp?alt=media&token=63bce4b4-5a6d-4976-8c7c-ad5882102019','true',100,'Ultraligero'),(187,'Zapato para yeso','Facilita la marcha con el yeso','libre','null','null','null','01-ZPTYES','null','null','Goma dura, tela resistente','Ultraligero','null','110','Protección y sujeción','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/ZapatoParaYeso.webp?alt=media&token=a8a60d8b-bc66-4bf7-85dc-539bd59ae17f','true',100,'Ultraligero'),(188,'Férula separador de hallux valgus nocturno','Diseñado para su corrección nocturna del juanete con una placa plástica que tira hacia el lado contrario del juanete y una sujeción con bandas de velcro.','libre','null','null','null','01-FHLL','null','Hallux valgus o juanete','Fabricado de material de plástico con forro de plastazote y bandas de velcro','Ultraligero','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/SeparadorDeHalluxNocturno.webp?alt=media&token=eec702a8-f1d4-4f55-9fc2-514be10edd73','true',100,'Ultraligero'),(189,'Collarín duro','Collarín anatómico, de material semirrigido que pùede ser deuna pieza o dos, este ultimo regulable, su soporte esmentoniano, occopitalrodeando elmaxilar inferior  e inferior apoyado sobre las clavículas y entreelhombro y cuello,en la parte posterior con cierre de velcro','receta','a medida','24-48hrs','blanco','01-COL=DUR','null','Síndrome de latigazo cervical, esguince cervical, cervicalgias producidas por osteoartrosis, rectificaciones de columna cervical, hernias de disco cervical','Polietileno de alta calidad y resistencia','Ligero','collarete, cuellera','130-160','Protección y sujeción','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CollarinDuro.webp?alt=media&token=40c3fcbf-7f69-4459-9e08-9a3e8d7e5ec8,null','true',100,'Ligero'),(190,'Separador de hallux diurno','Corrige el hallux a la vez que favorece la fase de despegue de la marcha, y una alineación respectiva a su metatarsiano','libre','null','null','null','null','null','Hallux valgus o juanete','Fabricado con plastazote y goma dura','Ultraligero','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/SeparadorDeHalluxDiurno.webp?alt=media&token=08d50050-daf0-4173-833f-0a7ba7d096e2,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/SeparadorDeHalluxDiurno2.webp?alt=media&token=cbddb095-1435-4707-bd8a-33f7c357a5b0','true',100,'Ultraligero'),(191,'Talonera de silicona punto rosa y azul','Brinda confort y alivio de la región retrocalcánea, disminuyendo el impacto generado. Ideal para deportistas','libre','null','null','null','07-1002','null','Espolón calcáneo, contusión, osteoporosis, patologías, tendinitis aquiliana, fascitis plantar, bursitis retrocalcánea','Silicona','Ultraligero','null','130','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/TaloneraDeSilicona.webp?alt=media&token=39de2679-dd3e-462c-9993-0498df579b5d','true',100,'Ultraligero'),(192,'Plantillas','Elaboradas a medida y anatómicamente','libre','null','null','null','null','null','Pie plano, pie cavo, talo valgo o varo, dedos de garra, espolón calcáneo, fascitis plantar','Base de cuero, goma microporosa, forro antibacteriano, de cuero, cuero delgado o plastazote','Ligero','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/PlantillaOrtope%CC%81dica.webp?alt=media&token=3585e5c2-018e-40aa-854c-7429d684cc46','true',100,'Ligero'),(193,'Mentonera','Sujeción y Ajuste Perfectos para Problemas Maxilofaciales.\nNuestra mentonera ofrece sujeción y ajuste óptimos del mentón hacia la cabeza, ideal para problemas maxilofaciales.\n\nCaracterísticas Principales:\n\nAjuste Preciso: Se adapta perfectamente a la anatomía del mentón.\nMaterial Confortable: Fabricada con materiales suaves y transpirables.\nCorrección y Prevención: Perfecta para terapias postoperatorias y corrección postural.\nFácil de Usar: Correas ajustables para una colocación sencilla y segura.\nBeneficios:\n\nEstabilidad y Seguridad: Mantiene el mentón en posición adecuada.\nConfort Duradero: Uso prolongado sin irritaciones.\nVersatilidad: Ideal para rehabilitación maxilofacial y soporte diario.\n','receta','a medida','24-48hrs','correa beige, mentonera color piel','01-MENT','null','Post operatorio, corregir las maloclusiones de clase III con prognatismo mandibular','Correa resistente regulable, cuero.','Ultraligero','null','130','Protección y sujeción','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/Mentonera.webp?alt=media&token=b08828ad-27ff-4f90-a582-371006fce67b,null','true',100,'Ultraligero'),(194,'Placa de Silicona','null','libre','null','null','null','null','null','null','null','null','null','null','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/PlacaDeSilicona.webp?alt=media&token=9a417c4d-94e2-43ef-a3ff-62288c196afc','true',100,'null'),(195,'Esfera fisioball(Pelota de Fisioterapia)','Esfera fisioterapeutica para crear estímulos sensoriales y que relajen los músculos adoloridos o tensos y ayudar a la circulación sanguínea','libre','null','null','null','07-FG15','null','Fortalecimiento muscular para manos, edemas de mano, rehabilitación de los movimientos, secuelas AVC, terapia ocupacional,','Esferas de goma gel','Ultraligero','null','30','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/PelotaDeFisioterapia.webp?alt=media&token=0dbf4c10-e3bd-4037-88be-72c03dfd4af8','true',100,'Ultraligero'),(196,'Protesis mamaria colorida skinmama','Tiene peso, movilidad y consistencia similar a un seno, lo que le convierte de una réplica de un seno natural.','libre','null','null','null','07-SG420','null','Post-mastectomía, atrofia de seno','Skingel','Ligero','null','320','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/ProtesisDeMama.webp?alt=media&token=c4dcaed9-21c2-4dfc-bb4a-08e74686d00e','true',100,'Ligero'),(197,'Cojín abductor triangular','Triángulo abductor que va desde el pubis hasta nivel de la rodilla','libre','null','null','null','01-CJAT','null','Post operacion de protesis de cadera','Esponja, forro de cuero, pasadores y velcro','Ligero','null','450','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CojinTriangularParaCadera.webp?alt=media&token=cf11eef7-ebb0-4f2b-8dc3-cfa04531b8e1','true',100,'Ligero'),(198,'Collarín Minerva','Dispositivo cervical que proporciona un excelente soporte cervical y alivia el peso de la cabeza, distribuyendo su peso por medio de apoyo suave en el pecho y espalda unidos por correas de velcrof, ofreciendo confort y estabilidad durante su uso clínico.','receta','Regulable','entrega inmediata','gris y negro','02-NH002','null','Fracturas a nivel cervical','Barra de aluminio, placa de plástico, plastazote, neopreno.','Moderado','null','930','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CollarinMinerva.webp?alt=media&token=629a5bf6-ffc6-4048-80a8-8a1a59238165,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CollarinMinerva2.webp?alt=media&token=04114bbf-fd21-4303-878a-d4869b13c3f8','true',100,'Moderado'),(199,'Cojin Rotatorio','null','null','null','null','null','null','null','null','null','null','null','null','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CojinRotatorio.webp?alt=media&token=b3154d45-23b3-44e1-b6e0-50adf7db7af9','true',100,'null'),(200,'Cojín antiescaras tipo dona','Almohadas tipo donas, reducen la presión sobre el coxis.','libre','null','null','null','01-CJANT','null','Ulceras por decubito, hemorroides, próstata, luxación de coxis','Esponja de alta densidad y forro de cuero','Ligero','null','190','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CojinTipoDona.webp?alt=media&token=970dc6e2-0fe6-4f58-98c9-58368191417e','true',100,'Ligero'),(201,'Colchón de aire antiescaras','Compresora, colchón de goma','libre','Una plaza','null','null','08-SH2040','null','Brinda comodidad, y prevención de ulceras por presión, con una compresora que regula el aire introducido','','Ligero','null','850','Prevención','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/ColchonAntiescaras.webp?alt=media&token=79b7cace-df7b-4931-a73d-b325c732bfa1','true',100,'Ligero'),(202,'Inodoro portatil fijo pintado','Aluminio','libre','null','null','null','08-MT557','null','Practico, conómodo y fácil manejo. Fijo , regulable, con apoyabrazos, balde colector y tapa.','','Moderado','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/InodoroPortatil.webp?alt=media&token=f844de58-058e-4315-8759-b6ec5bec81e9','true',100,'Moderado'),(203,'Inmovilizador de clavícula','placa posterior acolchada, cuenta con dos cinchas acolchadas que rodean la parte axilar, permitiendo una retropulsión de hombros tolerable, con sistema de sujecion regulable permitiendo ajustar la longitud de la cincha.','receta','s,m,l, a medida ','inmediata, 24-48hrs','gris','01-C8IH','null','Fracturas de clavícula, corrección postural','Placa de plástico con correas almohadilladas','Ligero','CORREA EN OCHO','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/InmovilizadorDeClavi%CC%81cula.webp?alt=media&token=0e3a2175-741c-4243-af57-f7a5fff56038,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/InmovilizadorDeClavi%CC%81cula2.webp?alt=media&token=b9ff8733-7544-4641-b9d1-6aec4e7e9609','true',100,'Ligero'),(204,'Elevador de inodoro adaptable','Aluminio y plástico','libre','null','null','null','08-MT560','null','Permite elevar la altura del inodoro para mejor comodidad. Regulable, ajustable, con apoyabrazos','','Ultraligero','null','400','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/ElevadorDeInodoro.webp?alt=media&token=22da0cc5-c8af-4382-ac19-e11f12908bb8,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/ElevadorDeInodoro2.webp?alt=media&token=7832f4c9-517b-4fea-a49c-ab1ae1f37216','true',100,'Ultraligero'),(205,'Andador con asiento y canasta','Brinda estabilidad, seguridad e independencia para la marcha, livianos, plegables, con ruedas regulables y asiento para descansos previos para la marcha','libre','null','null','null','08-ZXGWC972','null','null','Aluminio','Pesado','null','980','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/AndadorConAsiento.webp?alt=media&token=429e82b9-e487-43b2-ad48-dbd755d09efa','true',100,'Pesado'),(206,'Andador neurologico','null','libre','t/U','null','null','1111','null','null','','Pesado','null','1200','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/AndadorNeurolo%CC%81gico.webp?alt=media&token=8b01a1b5-e6de-4724-8a95-bc5f8d6ea9f3,null','true',100,'Pesado'),(207,'Collarín filadelfia','Collarín anatómico fabricado en materiales semirrígidos, puede ser de una o dos piezas, siendo este último regulable en altura. Proporciona soporte para la columna cervical, apoyándose en el mentón, occipucio, clavículas; cuenta  con cierre de velcro en la parte posterior.','receta','Regulable','null','piel/blanco','08-40402','null','Traumatismo directo del raquis cervical, postquirúrgico','Confeccionado de goma semirrígida','Ligero','null','175','Protección y sujeción','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CollarinFiladelfia.webp?alt=media&token=d9e656ea-79b2-4110-9f81-f4cdfb03647d,null','true',100,'Ligero'),(208,'Silla de ruedas neurologica infantil','Facilitan el desplazamiento. Plegables, livianas, con apoyabrazos y pies, desmontables, brinda una estabilización a nivel torácico y craneal, manteniendo la alineación corporal','libre','null','null','null','08-LY1058LB','null','null','Cromado, cuero, ruedas de goma maciza o neumatico','Muy pesado','null','4200','Suplefunción','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/SillaDeRuedasNeurolo%CC%81gica.webp?alt=media&token=533e2f68-af00-4406-8d19-90fdbe9832c0','true',100,'Muy pesado'),(209,'Silla de ruedas fija - goma maciza','Aluminio, cuero, ruedas de goma maciza','libre','null','null','null','08-LY894','null','Facilitan el desplazamiento. Plegables, livianas, con apoyabrazos y pies, desmontables','','Pesado','null','1600','Suplefunción','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/SillaDeRuedas.webp?alt=media&token=f88e9ea6-42a0-4b68-91c2-0bdee3318ad2,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/SillaDeRuedasAluminio.webp?alt=media&token=13682ed0-db9c-4387-998a-4726db8cff90','true',100,'Pesado'),(210,'Bastón de aluminio','Aluminio','libre','null','null','null','null','null','Dan soporte y apoyo unilateral para facilitar la deambulación','','Ligero','null','120','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/BastonDeAluminio.webp?alt=media&token=3aafe1a7-fb8b-4d52-b537-62ffcd5007dd,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/BastonDeAluminio2.webp?alt=media&token=169251ec-4321-4150-a070-bc3a3bb89521','true',100,'Ligero'),(211,'Collarín blando','Banda de esponja con cierre de velcro, forro color piel.','receta','S, M, MM, L, a medida','entrega inmediata, 24-48hrs','piel','01-COL=BL','null','Síndrome del latigazo, lesiones leves, tortícolis, cervicobraquialgias, dolor de cuello, estrés','Esponja de poliuretano flexible, forro 100 % algodón','Ligero','collarete, cuellera','120','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CollarinBlando.webp?alt=media&token=0a0b9552-ce5b-42e9-b09b-46f55f5d804c,null','true',100,'Ligero'),(212,'Muletas axilares','Aluminio','libre','null','null','null','08-GZ801','null','Dan soporte y apoyo necesario para facilitar la deambulación. Resistentes, regulables, livianas. Tallas S, M, L.','','Moderado','null','280','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/MuletasAxilares.webp?alt=media&token=0cddae4d-2b91-44a4-9e23-98a5f0df4f8e','true',100,'Moderado'),(213,'Muleta de antebrazo','null','libre','null','null','null','null','null','null','null','null','null','null','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/MuletaDeAntebrazo.webp?alt=media&token=8367767f-8f68-4af8-8ada-1a5848a000d8','true',100,'null'),(214,'Corrector postural','Ofrece una solución integral para mejorar la alineación de la columna y reducir la carga sobre los músculos dorsales. Incorpora una placa posterior rígida que proporciona soporte estructural, dos tirantes ajustables que promueven la retropulsión de los hombros para una postura erguida, y un sistema de cierre de velcro en la parte abdominal que asegura un ajuste seguro y personalizado. La zona dorsal está acolchada con material transpirable para mayor confort y ventilación, mientras que las correas ajustables permiten adaptarlo fácilmente a las necesidades individuales. Diseñado para ser discreto bajo la ropa, este corrector no solo corrige la postura, sino que también ayuda a aliviar tensiones y prevenir lesiones derivadas de malos hábitos posturale','libre','a medida','24-48hrs','gris','11-CORRPOS','null','Hipercifosis no estructuradas, dorsalgias leves, dorso curvo juvenil, escoliosis leve','Placa de plástico, tirantes acolchados, velcro.','Ligero','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CorrectorDePostura.webp?alt=media&token=1bdd86cb-314e-4ed2-846c-eaa84d5e3c57,null','true',100,'Ligero'),(215,'Corrector de tórax de quilla','Fabricado con materiales ligeros y duraderos. Su estructura incluye almohadillas y mecanismos de ajuste que aplican presión controlada sobre el esternón y las costillas que se encuantran elevadas. Se ajusta individualmente a la anatomía del paciente mediante correas, permitiendo su uso prolongado y eficaz en la remodelación del tórax','receta','a medida','48 hrs','color piel','11-CTQ','null','Tórax de quilla o pecho de paloma, pectus carinatum','Barra metálica, placa de presión de plástico, plastazote, forro de cuero, correas regulables','Ligero','corrector para pectus carinatum','220-280','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/ToraxEnQuilla.webp?alt=media&token=fddd6316-d8d3-494e-b7c6-7d8bc3a90aec,null','true',100,'Ligero'),(216,'Faja elástica toracica','Tela elástica','libre','null','null','null','08-JE-M','null','Genera resistencia, con una sujeción de velcro','','Ligero','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/fajaToracica.webp?alt=media&token=fa3b4b07-7791-422f-86a6-06ad096b54d4','true',100,'Ligero'),(217,'Corset bivalvado','compuesto por dos mitades rígidas hechas de  plástico de alta densidad, que se colocan en la parte frontal y posterior del torso, se ajustan y se mantienen en su lugar mediante correas de velcro,permitiendo un ajuste firme. Diseñado para limitar el movimiento de la columna, asegurando una adecuada alineación y soporte durante el proceso de curación. ','receta','a medida','3-5días','transparente','11-COR=BVVD','null','Escoliosis de \"con\" o \"S\", alteraciones del plano sagital','Moldeado de polipropileno, plastazote y velcro.','Ligero','null','2100','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CorsetBivalvado.webp?alt=media&token=ab6f1776-dca0-4652-880e-f30cb6477437,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CorsetBivalvado2.webp?alt=media&token=2e2189c6-6ff9-41f2-943f-9862e8809adb','true',100,'Ligero'),(218,'Corset Cheneau','null','receta','a medida','3-5 días','blanco','null','null','null','null','Moderado','null','null','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CorsetChenea.webp?alt=media&token=bb4d15cb-b1db-4f85-8933-36b38e8dc888,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CorsetChenea2.webp?alt=media&token=bda147b7-f45d-4cdf-b951-9efe244342d1','true',100,'Moderado'),(219,'Corset Jewet','Sistema de tres puntos, con apoyo lumbar, esternal y parte de la sínfisis del pubis, brindando un soporte anatómico','receta','M, L, XL, a medida','inmediata, 3-5días','importado blanco, nacional piel','02-CJW','null','Fracturas vertebrales, mal de pott, osteoporosis','Barras de aluminio, placa termoplástico, retier plástico.','null','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CorsetJewett.webp?alt=media&token=c81aa733-6b67-498e-8388-eff271a294fb,null','true',100,'null'),(220,'Corsé tlso','Diseño rígido de 3er puntos de presión que permite corregir las incurvaciones torácico-lumbar-sacro','receta','a medida','48 hrs','null','11-COR=TLSO','null','Alteraciones del plano sagital ( escoliosis de \"con\" o \"S\" ), hipercifosis,','Moldeado de polipropileno, plastazote y velcro.','Ligero','null','1750','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CorsetChenea2.webp?alt=media&token=bda147b7-f45d-4cdf-b951-9efe244342d1,null','true',100,'Ligero'),(221,'Faja dorsolumbar','Confeccionada con material textil 100% algoòn con alta  resistencia a la traccion, permiten una adecuada ventilación y confort durante su uso prolongado. Además de las correas de velcro para ajuste  incluiye varillas semirrigidas es en la zona dorso lumbar y flexibles en la parte anterior para ofrecer un soporte adicional. Diseñada con modelo anatómico que se adapta a la curvatura natural de la columna vertebral, lo cual mejora la comodidad.','libre','a medida','24-48hrs','piel','11-COR=FLD','null','Osteoporosis,hernia de disco, espondiloartrosis, rehabilitación postural, dorsalgias, osteomalacia, discopatia','Tela resistente, varillas de aluminio y plástico, acolchado de esponja.','Ligero','null','450','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FajaDorsoLumbar.webp?alt=media&token=42bba6c3-2a8e-4e25-90af-3a57ecd0ea39,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FajaDorsoLumbar2.webp?alt=media&token=683971b2-6de1-4215-8ea8-71b3e43fed39','true',100,'Ligero'),(222,'Corset de milwaukee','Se extiende desde la pelvis hasta la base del cráneo y está compuesto por una estructura metálica con tres barras verticales conectadas por bandas horizontales (dos posteriores y una anterior). Incluye una cesta pélvica rígida y un aro cervical con apoyos para el mentón y la parte posterior de la cabeza. Las correas ajustables permiten un ajuste personalizado para garantizar una corrección efectiva.','receta','a medida','3-5días','transparente, diseño personalizado','11-COR=MLWK','null','Hipercifosis dorsal, alteraciones del plano coronal (escoliosis de C o S ) con la curvatura primaria alta','Polipropileno, barras de aluminio, cuero, plastazote, velcro.','Ligero','null','1950-2200','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CorsetMilWauke.webp?alt=media&token=a548e367-755a-4fdf-9fa9-893721c80628,null','true',100,'Ligero'),(223,'Corset de taylor','fabricado con materiales rígidos y correas ajustables, cuenta con una estructura metálica que se extiende desde la región sacra hasta la parte superior de la espalda y una pechera para sujeción abdominal. Las correas de sujeción permiten un ajuste personalizado, asegurando una compresión adecuada y limitando el movimiento no deseado de la columna. ','receta','a medida','3-5días','color personalizado','11-COR=TYL','null','Espondiloartrosis, fracturas, postquirúrgico de columna, mal de pott, hipercifosis o hiperlordosis postural o patológicas','Barras de aluminio, forro de cuero, retier.','Ligero','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CorsetTaylor.webp?alt=media&token=5a2dc375-0e7f-4cb5-aa00-4ad173705961,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CorsetTaylor2.webp?alt=media&token=5704a3d2-3370-4d16-9be6-07e9c5aa2f48','true',100,'Ligero'),(224,'Correa de tenista','Hecha de materiales elásticos como neopreno y se ajusta alrededor del antebrazo cerca del codo, con un punto de presión sobre el músculo extensor afectado. El diseño de la correa ayuda a redistribuir las fuerzas y reducir la tensión en el tendón afectado, lo que puede aliviar el dolor y promover la recuperación','receta','null','null','null','01-CRTN','null','Epicondilitis, epitrocleitis, bursitis','Tela de neopreno, plastazote y velcro.','Ligero','null','50','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CorreaDeTenista.webp?alt=media&token=11c964d2-93df-4f44-bd39-b3ddda4c1822,null','true',100,'Ligero'),(225,'Férula sarmiento para brazo','Inmoviliza y estabiliza el segmento lesionado permitiendo la movilidad de las articulaciones proximales a la ortesis','receta','a medida','24-48hrs','blanco borde azul, rosado, verde, otros','11-FMS=SBR','null','Fracturas del húmero','Polipropileno moldeado a medida, plastazote, velcro.','Ligero','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FerulaSarmiento.webp?alt=media&token=038376ff-e270-4be6-94d4-4411babb98e3,null','true',100,'Ligero'),(226,'Faja lumbo sacra','Brinda contención escapulo humeral, fabricado con neopreno, un material elástico y resistente al agua, el estabilizador se ajusta cómodamente alrededor del hombro y el torso mediante correas de velcro ajustables.  ayudan a limitar el movimiento del hombro y a mantenerlo en una posición adecuada para favorecer la curación. Su diseño ergonómico permite un uso discreto bajo la ropa y proporciona calor terapéutico, lo que puede ayudar a aliviar el dolor.','libre','a medida','24-48hrs','piel','11-COR=FL','null','Discopatia, espondilo artrosis, osteomalacia, lumbociática, postoperatorio de hernia discal, lumbalgia, fracturas vertebrales, contusiones directas','Tela resistente, varillas de aluminio y plástico.a','Ligero','null','400','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FajaLumbar.webp?alt=media&token=84986dbf-5ea1-4153-bbf3-3c1357f34fe0,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FajaLumbar2.webp?alt=media&token=077ac7b8-de4a-4e35-b45b-1909729292b9','true',100,'Ligero'),(227,'Estabilizador de hombro','Brinda contención escapulo humeral ,fabricado con neopreno, un material elástico y resistente al agua, el estabilizador se ajusta cómodamente alrededor del hombro y el torso mediante correas de velcro ajustables, que ayudan a limitar el movimiento del hombro y a mantenerlo en una posición adecuada para favorecer la curación. Su diseño ergonómico permite un uso discreto bajo la ropa y proporciona calor terapéutico, lo que puede ayudar a aliviar el dolor                              . ','receta','a medida','24-48hrs','negro y azul','01-INM-ESTHOMB','null','Luxación glenohumeral, tendinitis, inestabilidad articular, luxación del manguito rotador o post quirúrgico','Tela de neopreno, velcro-','Ligero','null','160','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/EstabilizadorDeHombro.webp?alt=media&token=bbd5fed3-f4c3-435f-9f18-c5b14101b6cf,null','true',100,'Ligero'),(228,'Cabestrillo doble correa','Banda de tela que sostiene y estabiliza el miembro superior, inmoviliza el hombro.','libre','S, M, L; a medida','inmediata, 24-48hrs','azul y diseño para niños','01-CTLDC','null','Fracturas o luxación de brazo o codo, postquirúrgico y post yeso, lesiones de tejidos blandos','Tela resistente, retier plástico y hebillas plasticas.','Pesado','null','60','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CabestrilloDobleCorrea.webp?alt=media&token=b4ccedd1-9442-4ac3-9a00-0dd178ce6511,null','true',100,'Pesado'),(229,'Ferula para mano antebrazo de polipropileno','Mantiene la muñeca y la mano en posición funcional, diseñado anatómicamente y con sujeción de bandas de velcro','receta','null','null','null','11-FMS=M-ANTB-POL','null','Artritis-reumatoides, parálisis del nervio radial, cubital o mediano, hemiplejia.','#REF!','Ligero','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FerulaManoPropileno.webp?alt=media&token=f08b7ed4-170f-46ca-810d-b7b640d74e40,null','true',100,'Ligero'),(230,'Cabestrilo Vietnam','Soporte a nivel del brazo y antebrazo a una posición de 90° con doble correa a nivel clavicular y una faja toracica dando una mayor fijación y estabilidad a la articulación escapulo humeral','receta','S, M, L; a medida','inmediata, 24-48hrs','azul, negro y diseño para niño','01-CTLVIE','null','Fractura a nivel del hombro o brazo, subluxación o luxación del hombro, lesiones musculares de hombro,codo y muñeca','Tela resistente, retier plástico, hebillas plasticas y acolchado de esponja.','null','null','170','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CabestrilloVietnam.webp?alt=media&token=099101cc-a461-496d-bf7b-5ba7ce543c37,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/CabestrilloVietnam%202.webp?alt=media&token=219e8cf5-ff45-4e22-b4f9-ab8f03e0d2a8','true',100,'null'),(231,'Abductor de hombro','Fabricado con materiales textiles suaves y transpirables como algodón , ofrecen comodidad al usuario y permiten la ventilación adecuada de la piel.El cojín ajustable permite fijar el hombro en una posición de abducción específica (generalmente 15 grados), ayudando a mantener la alineación adecuada y reduciendo la tensión en la articulación.se asegura con correas ajustables alrededor del torso y el hombro para proporcionar un ajuste personalizado y seguro.','receta','a medida','24-48hrs','azul ','null','null','Síndrome de atrapamiento, inflamación aguda o crónica tras descompresión abierta o artroscópica y acromoplastia, reconstrucción tras ruptura de los manguitos rotadores.Tratamiento conservador o post-quirúrgico tras bursitis subacromial.','FORMULA DE CONVERSIÓN','Ligero','null','250','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/AbductorDeHombro.webp?alt=media&token=7ef0035f-7901-4642-a87c-6927bd680325,https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/AbductorDeHombro2.webp?alt=media&token=ee9aacb0-f550-4a3d-a06b-1162cf7c5238','true',100,'Ligero'),(232,'Muñequera boomerang','Contribuye a una rápida desinflamación y recuperación de lesiones, aplicando compresión y calor terapéutico. \nMantiene la articulación en una posición neutra, ayudando a prevenir esguinces y dolores articulares. \nAbarca desde la muñeca hasta la parte media de los metacarpianos. \nEl ajuste moderado y peso ligero conforman un producto ideal para utilizar durante la práctica deportiva. \nSu diseño abierto universal permite una fácil colocación y ajuste, adaptándose a diferentes anatomías y necesidades terapéuticas.','receta','S, M, L, a medida','inmediata, 24-48hrs','azul, negro','01-MÑQBIP','null','Contusiones\nEsguinces\nDistensiones\nDebilidad muscular\nDolores reumáticos\nTendinitis\nInflamación tendinosa\nArtritis de muñeca\nTenosinovitis\nSíndrome del túnel carpiano\nArtrosis','Elaborada en Neoprene, material de alta elasticidad, resistencia y durabilidad.','Ligero','null','100','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/MunequeraBoomerang.webp?alt=media&token=98778a26-84ce-40df-b6ad-da0c8711f090,null','true',100,'Ligero'),(233,'Muñequera con splint','Estabiliza la articulación de la muñeca dando una fijación del tercio distal del antebrazo','receta','S, M, L, a medida','inmediata, 24-48hrs','azul, negro','01-MÑQSP','null','Síndrome del túnel carpiano, traumatismos leves, bursitis, inmovilización por secuelas dolorosas, postquirúrgico','Varilla de aluminio, tela','Ligero','null','100','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/MunequeraConSplint.webp?alt=media&token=b83b2984-2cc8-49a5-a011-e83231223149,null','true',100,'Ligero'),(234,'Muñequera para artritis','Recoge los dedos evitando las desviaciones hacia el lado cubital dando una estabilización y fijación a las articulaciones metacarpofalángicas y radiocubital','libre','S, M, L, a medida','inmediata, 24-48hrs','azul, negro, gris','01-MÑQA','null','Artritis-reumatoides','Varilla de aluminio, tela','Ligero','null','100','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/MunequeraParaArtritis.webp?alt=media&token=24968ecf-f0c0-43ed-a0d2-a6682425d310,null','true',100,'Ligero'),(235,'Ferula de mano dinámica','null','receta','a medida','null','null','11-FMS=PMDINAM','null','null','','Ligero','férula dinámica de aluminio','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FerulaDinamica.webp?alt=media&token=1d26a776-da96-4446-ba86-781be622744a,null','true',100,'Ligero'),(236,'Muñequera doble barra','null','null','null','null','null','null','null','null','','Ligero','null','180','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/MunequeraDobleBarra.webp?alt=media&token=db13fcbb-19f8-4edd-bce8-786760bf9ee1,null','true',100,'Ligero'),(237,'Muñequera con inmovilizador del pulgar','Estabiliza el pulgar con una fijación a nivel de la muñeca','receta','S, M, L, a medida','inmediata, 24-48hrs','azul, negro','01-MÑQIP','null','Tenosinovitis de quervain, inestabilidad articular del pulgar, traumatismos leves','Varilla de aluminio, tela','Ligero','Muñequera con pulgar','130','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/MunequeraConPulgar.webp?alt=media&token=1e9fdd03-70f3-4fe2-9fcb-fcf75c4af587,null','true',100,'Ligero'),(238,'Ferula splint para dedo PVC','Inmoviliza el dedo','receta','a medida','24-48hrs','blanco borde azul, rosado, verde, otros','11-FMS=SPLT','null','null','null','Ultraligero','Férula','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FerulaDeDedoEnPVC.webp?alt=media&token=957cd520-7841-4244-98e7-d17b9f9ad765','true',100,'Ultraligero'),(239,'Férula para dedo dinar 3 puntos','null','receta','a medida','null','null','11-FMI=C3APY','null','null','','Ultraligero','Ferula p/dedos 3 puntos dinamica','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/Ferula3Dedos.webp?alt=media&token=a82ea03c-00f3-41ca-8d45-4f616c49982e,null','true',100,'Ultraligero'),(240,'Ferula en A para rodilla','null','null','null','null','null','null','null','null','null','null','null','0','null','null','https://firebasestorage.googleapis.com/v0/b/catalogooba.appspot.com/o/FerulaEnA.webp?alt=media&token=fc7006a4-ad18-4dce-bd5f-c3d6ac735c1d','true',100,'null');
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

-- Dump completed on 2025-01-30  3:11:14
