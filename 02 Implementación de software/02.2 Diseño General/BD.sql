CREATE DATABASE  IF NOT EXISTS `idiomas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `idiomas`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: idiomas
-- ------------------------------------------------------
-- Server version	5.6.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `idadministrador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_administrador` varchar(100) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idadministrador`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  KEY `fk_administrador_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_administrador_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Martha Patricia Osornio González','Encargada del centro de idiomas del ITSZN',4);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion`
--

DROP TABLE IF EXISTS `calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calificacion` (
  `idcalificacion` int(11) NOT NULL AUTO_INCREMENT,
  `unidad` tinyint(3) unsigned NOT NULL,
  `calificacion` tinyint(3) unsigned NOT NULL,
  `idinscripcion` int(11) NOT NULL,
  PRIMARY KEY (`idcalificacion`),
  KEY `fk_calificacion_inscripcion1_idx` (`idinscripcion`),
  CONSTRAINT `fk_calificacion_inscripcion1` FOREIGN KEY (`idinscripcion`) REFERENCES `inscripcion` (`idinscripcion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion`
--

LOCK TABLES `calificacion` WRITE;
/*!40000 ALTER TABLE `calificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `idcarrera` int(11) NOT NULL AUTO_INCREMENT,
  `siglas` varchar(45) NOT NULL,
  `carrera` varchar(100) NOT NULL,
  PRIMARY KEY (`idcarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'CP','CONTADURIA PUBLICA'),(2,'IA','INGENIERIA EN ADMINISTRACION'),(3,'IEM','INGENIERIA ELECTROMECANICA'),(4,'IGE','INGENIERIA EN GESTION EMPRESARIAL'),(5,'II','INGENIERIA EN INFORMATICA'),(6,'ISC','INGENIERIA EN SISTEMAS COMPUTACIONALES'),(7,'ITIC','INGENIERIA EN TECNOLOGIAS DE LA INFORMACION Y COMUNICACIONES'),(8,'EXT','EXTERNO');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `nivel_curso` tinyint(3) unsigned NOT NULL,
  `periodo_inicio` date NOT NULL,
  `periodo_fin` date NOT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `semestre` varchar(100) NOT NULL,
  `sistema` varchar(45) DEFAULT NULL,
  `iddocente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcurso`),
  KEY `fk_curso_docente1_idx` (`iddocente`),
  CONSTRAINT `fk_curso_docente1` FOREIGN KEY (`iddocente`) REFERENCES `docente` (`iddocente`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,9,'2018-01-29','2018-04-12','08:00:00','10:00:00','Enero-Junio 2018','ESCOLARIZADO',3),(2,1,'2018-01-29','2018-04-12','14:00:00','16:00:00','Enero-Junio 2018','ESCOLARIZADO',3),(3,7,'2018-01-29','2018-04-12','08:00:00','10:00:00','Enero-Junio 2018','SEMIESCOLARIZADO',2),(4,5,'2018-01-29','2018-04-12','14:00:00','16:00:00','Enero-Junio 2018','SEMIESCOLARIZADO',2);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente` (
  `iddocente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_docente` varchar(150) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddocente`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  KEY `fk_docente_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_docente_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'CRYSTHIAN JESÚS ROSALES CARRILLO',7),(2,'JOSÉ EFRAÍN VAQUERA GONZÁLEZ',5),(3,'TEODORO GONZALEZ',6),(4,'MARLEM SANDOVAL ESPINOZA',8);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiante` (
  `idestudiante` int(11) NOT NULL AUTO_INCREMENT,
  `no_control` varchar(45) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `idcarrera` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idestudiante`),
  UNIQUE KEY `no_control_UNIQUE` (`no_control`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  KEY `fk_estudiante_carrera_idx` (`idcarrera`),
  KEY `fk_estudiante_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_estudiante_carrera` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_estudiante_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1,'14010261','RODRIGUEZ RIVAZ JOSE MANUEL',6,1),(2,'14010318','MIRELES MIRELES FERMIN',6,2),(3,'14010149','HERRADA CISNEROS MIGUEL',6,3),(4,NULL,'ARREDONDO SALCEDO DANIEL',8,9);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_toeic`
--

DROP TABLE IF EXISTS `exa_toeic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exa_toeic` (
  `idexa_TOEIC` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_toeic` date NOT NULL,
  `puntos_toeic` int(10) unsigned NOT NULL,
  `acta` int(10) unsigned NOT NULL,
  `anyo` int(10) unsigned NOT NULL,
  `calificacion_toeic` tinyint(3) unsigned DEFAULT NULL,
  `idestudiante` int(11) NOT NULL,
  PRIMARY KEY (`idexa_TOEIC`),
  KEY `fk_exa_TOEIC_estudiante1_idx` (`idestudiante`),
  CONSTRAINT `fk_exa_TOEIC_estudiante1` FOREIGN KEY (`idestudiante`) REFERENCES `estudiante` (`idestudiante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_toeic`
--

LOCK TABLES `exa_toeic` WRITE;
/*!40000 ALTER TABLE `exa_toeic` DISABLE KEYS */;
INSERT INTO `exa_toeic` VALUES (1,'2013-01-12',295,10,2013,70,1),(2,'2017-12-02',225,6,2017,NULL,2),(3,'2018-01-15',88,6,2017,NULL,3);
/*!40000 ALTER TABLE `exa_toeic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_ubicacion`
--

DROP TABLE IF EXISTS `exa_ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exa_ubicacion` (
  `idexa_ubicacion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_ubi` date NOT NULL,
  `nivel_ubi` tinyint(3) unsigned NOT NULL,
  `puntos_ubi` int(10) unsigned NOT NULL,
  `no_recibo` varchar(45) NOT NULL,
  `idestudiante` int(11) NOT NULL,
  PRIMARY KEY (`idexa_ubicacion`),
  KEY `fk_exa_ubicacion_estudiante1_idx` (`idestudiante`),
  CONSTRAINT `fk_exa_ubicacion_estudiante1` FOREIGN KEY (`idestudiante`) REFERENCES `estudiante` (`idestudiante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_ubicacion`
--

LOCK TABLES `exa_ubicacion` WRITE;
/*!40000 ALTER TABLE `exa_ubicacion` DISABLE KEYS */;
INSERT INTO `exa_ubicacion` VALUES (1,'2017-11-12',3,14,'7208',1),(2,'2017-01-15',7,38,'561',2),(3,'0000-00-00',3,15,'4831',3);
/*!40000 ALTER TABLE `exa_ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion`
--

DROP TABLE IF EXISTS `inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripcion` (
  `idinscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `idestudiante` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  PRIMARY KEY (`idinscripcion`),
  KEY `fk_inscripcion_estudiante1_idx` (`idestudiante`),
  KEY `fk_inscripcion_curso1_idx` (`idcurso`),
  CONSTRAINT `fk_inscripcion_curso1` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_inscripcion_estudiante1` FOREIGN KEY (`idestudiante`) REFERENCES `estudiante` (`idestudiante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion`
--

LOCK TABLES `inscripcion` WRITE;
/*!40000 ALTER TABLE `inscripcion` DISABLE KEYS */;
INSERT INTO `inscripcion` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,2);
/*!40000 ALTER TABLE `inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'JMRR','1234'),(2,'FMM','1234'),(3,'MHC','1234'),(4,'admin','root'),(5,'efrain','1111'),(6,'teo','2222'),(7,'cristian','3333'),(8,'marlem','4444'),(9,'daniel','1234');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-12 14:25:08
