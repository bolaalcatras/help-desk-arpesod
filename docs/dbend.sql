-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: helpdeskdb
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `empresa_usuario`
--

DROP TABLE IF EXISTS `empresa_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_usuario` (
  `empusu_id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `usu_id` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `fech_elim` datetime DEFAULT NULL,
  `est` int DEFAULT NULL,
  PRIMARY KEY (`empusu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_usuario`
--

/*!40000 ALTER TABLE `empresa_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa_usuario` ENABLE KEYS */;

--
-- Table structure for table `td_documento`
--

DROP TABLE IF EXISTS `td_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `td_documento` (
  `doc_id` int NOT NULL AUTO_INCREMENT,
  `tick_id` int NOT NULL,
  `doc_nom` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `fech_crea` datetime NOT NULL,
  `est` int NOT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `td_documento`
--

/*!40000 ALTER TABLE `td_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `td_documento` ENABLE KEYS */;

--
-- Table structure for table `td_documento_detalle`
--

DROP TABLE IF EXISTS `td_documento_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `td_documento_detalle` (
  `det_id` int NOT NULL AUTO_INCREMENT,
  `tickd_id` int NOT NULL,
  `det_nom` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `est` int NOT NULL,
  PRIMARY KEY (`det_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `td_documento_detalle`
--

/*!40000 ALTER TABLE `td_documento_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `td_documento_detalle` ENABLE KEYS */;

--
-- Table structure for table `td_empresa`
--

DROP TABLE IF EXISTS `td_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `td_empresa` (
  `emp_id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `emp_nom` varchar(100) DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `fech_elim` datetime DEFAULT NULL,
  `est` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `td_empresa`
--

/*!40000 ALTER TABLE `td_empresa` DISABLE KEYS */;
INSERT INTO `td_empresa` VALUES (10,'Finansueños','2025-07-02 17:52:19',NULL,1),(11,'Arpesod','2025-07-02 17:52:19',NULL,1);
/*!40000 ALTER TABLE `td_empresa` ENABLE KEYS */;

--
-- Table structure for table `td_prioridad`
--

DROP TABLE IF EXISTS `td_prioridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `td_prioridad` (
  `pd_id` int NOT NULL AUTO_INCREMENT,
  `pd_nom` varchar(255) DEFAULT NULL,
  `est` int DEFAULT NULL,
  PRIMARY KEY (`pd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `td_prioridad`
--

/*!40000 ALTER TABLE `td_prioridad` DISABLE KEYS */;
INSERT INTO `td_prioridad` VALUES (1,'Baja',1),(2,'Media',1),(3,'Alta',1),(4,'Urgente',1);
/*!40000 ALTER TABLE `td_prioridad` ENABLE KEYS */;

--
-- Table structure for table `td_ticketdetalle`
--

DROP TABLE IF EXISTS `td_ticketdetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `td_ticketdetalle` (
  `tickd_id` int NOT NULL AUTO_INCREMENT,
  `tick_id` int NOT NULL,
  `usu_id` int NOT NULL,
  `tickd_descrip` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `fech_crea` datetime NOT NULL,
  `est` int NOT NULL,
  PRIMARY KEY (`tickd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `td_ticketdetalle`
--

/*!40000 ALTER TABLE `td_ticketdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `td_ticketdetalle` ENABLE KEYS */;

--
-- Table structure for table `th_ticket_asignacion`
--

DROP TABLE IF EXISTS `th_ticket_asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `th_ticket_asignacion` (
  `th_id` int NOT NULL AUTO_INCREMENT,
  `tick_id` int NOT NULL,
  `usu_asig` int NOT NULL COMMENT 'El nuevo usuario asignado',
  `how_asig` int DEFAULT NULL COMMENT 'El usuario que realiza la asignación',
  `fech_asig` datetime NOT NULL,
  `asig_comentario` text COMMENT 'Comentario opcional sobre la reasignación',
  `est` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`th_id`),
  KEY `idx_tick_id` (`tick_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Historial de asignaciones de tickets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_ticket_asignacion`
--

/*!40000 ALTER TABLE `th_ticket_asignacion` DISABLE KEYS */;
INSERT INTO `th_ticket_asignacion` VALUES (44,333,101,NULL,'2025-07-19 10:12:01','Ticket abierto',1),(45,334,101,NULL,'2025-07-19 10:12:33','Ticket abierto',1),(46,335,101,NULL,'2025-07-19 10:12:34','Ticket abierto',1),(47,336,101,NULL,'2025-07-19 10:12:35','Ticket abierto',1),(48,337,101,NULL,'2025-07-19 10:12:35','Ticket abierto',1),(49,338,101,NULL,'2025-07-19 10:12:35','Ticket abierto',1),(50,339,101,NULL,'2025-07-19 10:12:35','Ticket abierto',1),(51,340,101,NULL,'2025-07-19 10:12:35','Ticket abierto',1),(52,341,101,NULL,'2025-07-19 10:12:35','Ticket abierto',1),(53,342,101,NULL,'2025-07-19 10:12:36','Ticket abierto',1),(54,343,101,NULL,'2025-07-19 10:12:36','Ticket abierto',1),(55,344,101,NULL,'2025-07-19 10:12:36','Ticket abierto',1),(56,345,101,NULL,'2025-07-19 10:15:32','Ticket abierto',1),(57,346,101,NULL,'2025-07-19 10:15:34','Ticket abierto',1),(58,347,101,NULL,'2025-07-19 10:17:17','Ticket abierto',1),(59,348,101,NULL,'2025-07-19 10:17:17','Ticket abierto',1),(60,349,101,NULL,'2025-07-19 10:17:18','Ticket abierto',1),(61,350,101,NULL,'2025-07-19 10:17:18','Ticket abierto',1),(62,351,101,NULL,'2025-07-19 10:17:18','Ticket abierto',1),(63,352,101,NULL,'2025-07-19 10:17:18','Ticket abierto',1),(64,353,101,NULL,'2025-07-19 10:17:19','Ticket abierto',1),(65,354,101,NULL,'2025-07-19 10:19:26','Ticket abierto',1),(66,355,101,NULL,'2025-07-19 10:20:52','Ticket abierto',1),(67,356,101,NULL,'2025-07-19 10:22:41','Ticket abierto',1),(68,357,101,NULL,'2025-07-19 10:24:40','Ticket abierto',1),(69,358,101,NULL,'2025-07-19 10:24:46','Ticket abierto',1),(70,359,101,NULL,'2025-07-19 10:28:00','Ticket abierto',1),(71,360,101,NULL,'2025-07-19 10:29:08','Ticket abierto',1),(72,361,109,NULL,'2025-07-19 10:30:27','Ticket abierto',1),(73,362,109,NULL,'2025-07-19 10:38:21','Ticket abierto',1),(74,363,109,NULL,'2025-07-19 10:38:34','Ticket abierto',1),(75,364,109,NULL,'2025-07-19 10:39:24','Ticket abierto',1),(76,365,107,NULL,'2025-07-19 11:04:15','Ticket abierto',1),(77,365,106,107,'2025-07-19 11:04:48','Reasignado por avance en el flujo',1),(78,364,106,109,'2025-07-19 11:22:05','Reasignado por avance en el flujo',1),(79,366,109,NULL,'2025-07-19 11:24:47','Ticket abierto',1),(80,366,106,109,'2025-07-19 11:36:51','Reasignado por avance en el flujo',1);
/*!40000 ALTER TABLE `th_ticket_asignacion` ENABLE KEYS */;

--
-- Table structure for table `tm_cargo`
--

DROP TABLE IF EXISTS `tm_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_cargo` (
  `car_id` int NOT NULL AUTO_INCREMENT,
  `car_nom` varchar(150) NOT NULL,
  `est` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_cargo`
--

/*!40000 ALTER TABLE `tm_cargo` DISABLE KEYS */;
INSERT INTO `tm_cargo` VALUES (1,'Cajero',1),(2,'Analista',1),(3,'Cobrador',1),(4,'Gestor',1),(5,'Auditor',1),(6,'Director financiero',1),(7,'Coordinador Cac',1),(8,'Jefe de auditoria',1);
/*!40000 ALTER TABLE `tm_cargo` ENABLE KEYS */;

--
-- Table structure for table `tm_categoria`
--

DROP TABLE IF EXISTS `tm_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_categoria` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `dp_id` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `cat_nom` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `est` int NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_categoria`
--

/*!40000 ALTER TABLE `tm_categoria` DISABLE KEYS */;
INSERT INTO `tm_categoria` VALUES (10,11,10,'Hardware',1),(11,11,11,'Software',1),(12,11,11,'Redes e Internet',1),(13,12,11,'Cuentas y Accesos',1),(14,14,11,'Solicitudes de RRHH',1),(15,16,10,'Consultas Financieras',1),(16,15,10,'Soporte de Ventas',1),(17,17,10,'Problemas Operativos',1),(18,11,10,'Seguridad Informática',1),(19,11,10,'Telefonía',1);
/*!40000 ALTER TABLE `tm_categoria` ENABLE KEYS */;

--
-- Table structure for table `tm_departamento`
--

DROP TABLE IF EXISTS `tm_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_departamento` (
  `dp_id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `dp_nom` varchar(100) DEFAULT NULL,
  `jefe_usu_id` int DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `fech_modi` datetime DEFAULT NULL,
  `fech_elim` datetime DEFAULT NULL,
  `est` int DEFAULT NULL,
  PRIMARY KEY (`dp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_departamento`
--

/*!40000 ALTER TABLE `tm_departamento` DISABLE KEYS */;
INSERT INTO `tm_departamento` VALUES (10,'Financiera',101,'2025-07-02 17:52:23',NULL,NULL,1),(11,'Sistemas',NULL,'2025-07-02 17:52:23',NULL,NULL,1),(12,'Auditoria',107,'2025-07-02 17:52:23',NULL,NULL,1),(13,'Servicio al cliente',106,NULL,NULL,NULL,1),(14,'Cartera',109,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tm_departamento` ENABLE KEYS */;

--
-- Table structure for table `tm_destinatario`
--

DROP TABLE IF EXISTS `tm_destinatario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_destinatario` (
  `dest_id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `answer_id` int DEFAULT NULL,
  `usu_id` int DEFAULT NULL,
  `dp_id` int DEFAULT NULL,
  `cats_id` int DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `fech_modi` datetime DEFAULT NULL,
  `fech_elim` datetime DEFAULT NULL,
  `est` int DEFAULT NULL,
  PRIMARY KEY (`dest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_destinatario`
--

/*!40000 ALTER TABLE `tm_destinatario` DISABLE KEYS */;
INSERT INTO `tm_destinatario` VALUES (1,10,NULL,12,NULL,'2025-07-02 17:53:06',NULL,NULL,1),(2,11,NULL,12,NULL,'2025-07-02 17:53:06',NULL,NULL,1),(3,12,NULL,12,16,'2025-07-02 17:53:06',NULL,NULL,1),(4,17,NULL,12,NULL,'2025-07-02 17:53:06',NULL,NULL,1),(5,18,NULL,12,NULL,'2025-07-02 17:53:06',NULL,NULL,1),(6,18,NULL,13,NULL,'2025-07-02 17:53:06',NULL,NULL,1),(7,14,NULL,13,14,'2025-07-02 17:53:06',NULL,NULL,1),(8,15,101,NULL,11,'2025-07-02 17:53:06',NULL,NULL,1),(9,19,104,NULL,19,'2025-07-02 17:53:06',NULL,NULL,1),(10,16,NULL,12,17,'2025-07-02 17:53:06',NULL,NULL,1),(11,10,NULL,12,NULL,'2025-07-02 17:56:21',NULL,NULL,1),(12,11,NULL,12,NULL,'2025-07-02 17:56:21',NULL,NULL,1),(13,12,NULL,12,16,'2025-07-02 17:56:21',NULL,NULL,1),(14,17,NULL,12,NULL,'2025-07-02 17:56:21',NULL,NULL,1),(15,18,NULL,12,NULL,'2025-07-02 17:56:21',NULL,NULL,1),(16,18,NULL,13,NULL,'2025-07-02 17:56:21',NULL,NULL,1),(17,14,NULL,13,14,'2025-07-02 17:56:21',NULL,NULL,1),(18,15,101,NULL,11,'2025-07-02 17:56:21',NULL,NULL,1),(19,19,104,NULL,19,'2025-07-02 17:56:21',NULL,NULL,1),(20,16,NULL,12,17,'2025-07-02 17:56:21',NULL,NULL,1),(21,12,101,12,13,'2025-07-02 19:58:12',NULL,'2025-07-02 20:00:37',0),(22,21,101,12,10,'2025-07-02 20:14:37',NULL,NULL,1),(23,21,102,12,10,'2025-07-02 20:16:18',NULL,'2025-07-02 22:15:13',0),(24,21,101,12,17,'2025-07-02 22:15:04',NULL,NULL,1),(25,21,104,12,10,'2025-07-03 09:04:26',NULL,NULL,1),(26,21,104,12,11,'2025-07-03 09:04:39',NULL,NULL,1),(27,21,104,12,16,'2025-07-03 09:07:25',NULL,NULL,1),(28,21,104,12,17,'2025-07-03 09:07:43',NULL,NULL,1);
/*!40000 ALTER TABLE `tm_destinatario` ENABLE KEYS */;

--
-- Table structure for table `tm_fast_answer`
--

DROP TABLE IF EXISTS `tm_fast_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_fast_answer` (
  `answer_id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `answer_nom` varchar(255) DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `fech_modi` datetime DEFAULT NULL,
  `fech_elim` datetime DEFAULT NULL,
  `est` int DEFAULT NULL,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_fast_answer`
--

/*!40000 ALTER TABLE `tm_fast_answer` DISABLE KEYS */;
INSERT INTO `tm_fast_answer` VALUES (20,'Error de asignacion','2025-07-02 20:01:27',NULL,NULL,1),(21,'Siguiente paso','2025-07-02 20:01:34',NULL,NULL,1),(22,'Error de informacion ','2025-07-02 20:01:44',NULL,NULL,1),(23,'Error de proceso','2025-07-02 20:02:00',NULL,NULL,1);
/*!40000 ALTER TABLE `tm_fast_answer` ENABLE KEYS */;

--
-- Table structure for table `tm_flujo`
--

DROP TABLE IF EXISTS `tm_flujo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_flujo` (
  `flujo_id` int NOT NULL AUTO_INCREMENT,
  `flujo_nom` varchar(200) NOT NULL,
  `cats_id` int NOT NULL,
  `est` int NOT NULL DEFAULT '1',
  `requiere_aprobacion_jefe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`flujo_id`),
  UNIQUE KEY `uk_cats_id` (`cats_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_flujo`
--

/*!40000 ALTER TABLE `tm_flujo` DISABLE KEYS */;
INSERT INTO `tm_flujo` VALUES (1,'Proceso de aprobacion de viaticos',21,1,1);
/*!40000 ALTER TABLE `tm_flujo` ENABLE KEYS */;

--
-- Table structure for table `tm_flujo_mapeo`
--

DROP TABLE IF EXISTS `tm_flujo_mapeo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_flujo_mapeo` (
  `map_id` int NOT NULL AUTO_INCREMENT,
  `cats_id` int NOT NULL COMMENT 'La regla aplica a esta Subcategoría',
  `creador_car_id` int NOT NULL COMMENT 'ID del Cargo de quien CREA el ticket',
  `asignado_car_id` int NOT NULL COMMENT 'ID del Cargo de a quien SE LE ASIGNA el ticket',
  `est` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`map_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_flujo_mapeo`
--

/*!40000 ALTER TABLE `tm_flujo_mapeo` DISABLE KEYS */;
INSERT INTO `tm_flujo_mapeo` VALUES (1,21,3,1,1);
/*!40000 ALTER TABLE `tm_flujo_mapeo` ENABLE KEYS */;

--
-- Table structure for table `tm_flujo_paso`
--

DROP TABLE IF EXISTS `tm_flujo_paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_flujo_paso` (
  `paso_id` int NOT NULL AUTO_INCREMENT,
  `flujo_id` int NOT NULL,
  `paso_orden` int NOT NULL,
  `paso_nombre` varchar(255) NOT NULL,
  `cargo_id_asignado` int DEFAULT NULL,
  `est` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`paso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_flujo_paso`
--

/*!40000 ALTER TABLE `tm_flujo_paso` DISABLE KEYS */;
INSERT INTO `tm_flujo_paso` VALUES (1,1,1,'Aprobacion',7,1),(2,1,2,'Aprobacion financiera',2,1),(3,1,3,'Desembolso y pago',1,1);
/*!40000 ALTER TABLE `tm_flujo_paso` ENABLE KEYS */;

--
-- Table structure for table `tm_notificacion`
--

DROP TABLE IF EXISTS `tm_notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_notificacion` (
  `not_id` int NOT NULL AUTO_INCREMENT,
  `usu_id` int DEFAULT NULL,
  `not_mensaje` varchar(255) DEFAULT NULL,
  `tick_id` int DEFAULT NULL,
  `fech_not` datetime DEFAULT NULL,
  `est` int DEFAULT NULL,
  PRIMARY KEY (`not_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_notificacion`
--

/*!40000 ALTER TABLE `tm_notificacion` DISABLE KEYS */;
INSERT INTO `tm_notificacion` VALUES (1,105,'El agente de soporte te ha respondido el ticket Nro 300',300,'2025-07-02 20:17:43',2),(2,102,'Se le ha asignado el ticket # 300',300,'2025-07-02 20:17:43',2),(3,110,'El agente de soporte te ha respondido el ticket Nro 310',310,'2025-07-02 22:11:45',2),(4,110,'El agente de soporte te ha respondido el ticket Nro 311',311,'2025-07-03 08:44:12',2),(5,101,'Se le ha asignado el ticket # 311',311,'2025-07-03 08:44:12',0),(6,110,'El agente de soporte te ha respondido el ticket Nro 311',311,'2025-07-03 09:08:21',2),(7,104,'Se le ha asignado el ticket # 311',311,'2025-07-03 09:08:21',1),(8,110,'El agente de soporte te ha respondido el ticket Nro 311',311,'2025-07-03 09:30:49',2),(9,110,'El agente de soporte te ha respondido el ticket Nro 311',311,'2025-07-03 09:31:15',2),(10,101,'Se le ha asignado el ticket # 311',311,'2025-07-03 09:31:15',1),(11,110,'El agente de soporte te ha respondido el ticket Nro 311',311,'2025-07-03 17:07:43',2),(12,109,'El agente de soporte te ha respondido el ticket Nro 304',304,'2025-07-03 17:10:08',2),(13,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 17:30:16',0),(14,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 19:39:41',1),(15,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 19:40:06',1),(16,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 19:40:49',1),(17,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 19:41:34',1),(18,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 19:42:43',1),(19,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 19:44:34',1),(20,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 19:48:27',1),(21,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 19:48:43',1),(22,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 19:48:57',1),(23,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 19:49:21',1),(24,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 19:50:07',1),(25,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 19:53:29',1),(26,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 19:53:46',1),(27,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 20:08:44',1),(28,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 20:09:03',1),(29,101,'El agente de soporte te ha respondido el ticket Nro 326',326,'2025-07-16 20:09:17',1),(30,101,'El agente de soporte te ha respondido el ticket Nro 325',325,'2025-07-16 20:14:10',1),(31,101,'El agente de soporte te ha respondido el ticket Nro 327',327,'2025-07-16 20:18:30',1),(32,101,'El agente de soporte te ha respondido el ticket Nro 327',327,'2025-07-16 20:18:41',1),(33,101,'El agente de soporte te ha respondido el ticket Nro 328',328,'2025-07-17 08:11:29',1),(34,101,'El agente de soporte te ha respondido el ticket Nro 328',328,'2025-07-17 08:11:46',1),(35,101,'El agente de soporte te ha respondido el ticket Nro 328',328,'2025-07-17 08:12:16',1),(36,101,'El agente de soporte te ha respondido el ticket Nro 330',330,'2025-07-17 09:21:57',1),(37,101,'El agente de soporte te ha respondido el ticket Nro 330',330,'2025-07-17 16:43:55',1),(38,101,'El agente de soporte te ha respondido el ticket Nro 330',330,'2025-07-17 16:48:47',2),(39,101,'El agente de soporte te ha respondido el ticket Nro 330',330,'2025-07-17 16:50:06',2);
/*!40000 ALTER TABLE `tm_notificacion` ENABLE KEYS */;

--
-- Table structure for table `tm_regional`
--

DROP TABLE IF EXISTS `tm_regional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_regional` (
  `reg_id` int NOT NULL AUTO_INCREMENT,
  `reg_nom` varchar(150) NOT NULL,
  `est` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_regional`
--

/*!40000 ALTER TABLE `tm_regional` DISABLE KEYS */;
INSERT INTO `tm_regional` VALUES (1,'Pasto',1),(2,'Popayán',1),(3,'Cali',1),(4,'Nacional',1),(5,'Huila',0),(6,'Huilaa',0),(7,'Huilaa',0);
/*!40000 ALTER TABLE `tm_regional` ENABLE KEYS */;

--
-- Table structure for table `tm_regla_aprobacion`
--

DROP TABLE IF EXISTS `tm_regla_aprobacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_regla_aprobacion` (
  `regla_id` int NOT NULL AUTO_INCREMENT,
  `creador_car_id` int NOT NULL COMMENT 'ID del Cargo del usuario que crea el ticket',
  `aprobador_usu_id` int NOT NULL COMMENT 'ID del Usuario específico que debe aprobar',
  `est` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`regla_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_regla_aprobacion`
--

/*!40000 ALTER TABLE `tm_regla_aprobacion` DISABLE KEYS */;
INSERT INTO `tm_regla_aprobacion` VALUES (1,1,101,1);
/*!40000 ALTER TABLE `tm_regla_aprobacion` ENABLE KEYS */;

--
-- Table structure for table `tm_subcategoria`
--

DROP TABLE IF EXISTS `tm_subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_subcategoria` (
  `cats_id` int NOT NULL AUTO_INCREMENT,
  `cat_id` int DEFAULT NULL,
  `pd_id` int DEFAULT NULL,
  `cats_nom` varchar(255) DEFAULT NULL,
  `cats_descrip` mediumtext,
  `est` int DEFAULT NULL,
  PRIMARY KEY (`cats_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_subcategoria`
--

/*!40000 ALTER TABLE `tm_subcategoria` DISABLE KEYS */;
INSERT INTO `tm_subcategoria` VALUES (10,10,1,'Problema con Laptop','Lentitud, no enciende, etc.',1),(11,10,1,'Falla de Impresora','No imprime, atasco de papel, etc.',1),(12,11,1,'Error en Microsoft Office','Problemas con Word, Excel, etc.',1),(13,11,3,'Falla en sistema ERP','El sistema de facturación no funciona.',1),(14,12,1,'Sin conexión a Internet','No hay acceso a internet en mi puesto.',1),(15,12,1,'Lentitud en la red','La navegación y acceso a archivos es muy lenta.',1),(16,13,2,'Olvido de contraseña','<p>Dame tu usuario:</p><p>Dame tu correo:</p>',1),(17,13,1,'Creación de nuevo usuario','<p>Nombre:</p><p>Clave:</p><p>Cedula:</p>',1),(18,14,1,'Consulta sobre vacaciones','Dudas sobre el proceso de solicitud de vacaciones.',1),(19,18,1,'Reporte de correo sospechoso','He recibido un email que parece ser phishing.',1),(20,14,2,'asdasdsa','dgdfgfdgdfg',0),(21,14,2,'Pago viaticos','Adjuntar excel con datos a pagar',1);
/*!40000 ALTER TABLE `tm_subcategoria` ENABLE KEYS */;

--
-- Table structure for table `tm_ticket`
--

DROP TABLE IF EXISTS `tm_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_ticket` (
  `tick_id` int NOT NULL AUTO_INCREMENT,
  `usu_id` int NOT NULL,
  `cat_id` int NOT NULL,
  `cats_id` int DEFAULT NULL,
  `pd_id` int DEFAULT NULL,
  `paso_actual_id` int DEFAULT NULL,
  `tick_titulo` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `tick_descrip` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `tick_estado` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `error_proceso` int DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `usu_asig` int DEFAULT NULL,
  `how_asig` int DEFAULT NULL,
  `fech_cierre` datetime DEFAULT NULL,
  `est` int NOT NULL,
  PRIMARY KEY (`tick_id`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_ticket`
--

/*!40000 ALTER TABLE `tm_ticket` DISABLE KEYS */;
INSERT INTO `tm_ticket` VALUES (360,108,14,21,2,NULL,'Prueba de Aprobación Jefe para Viáticos','Solicitud de viáticos para viaje a Cali.','Abierto',0,'2025-07-19 10:29:08',101,NULL,NULL,1),(361,108,14,21,2,NULL,'Prueba de Aprobación Jefe para Viáticos','Solicitud de viáticos para viaje a Cali.','Abierto',0,'2025-07-19 10:30:27',109,NULL,NULL,1),(362,108,14,21,2,NULL,'Prueba de Aprobación Jefe para Viáticos','Solicitud de viáticos para viaje a Cali.','Abierto',0,'2025-07-19 10:38:21',109,NULL,NULL,1),(363,108,14,21,2,NULL,'Prueba de Aprobación Jefe para Viáticos','Solicitud de viáticos para viaje a Cali.','Abierto',0,'2025-07-19 10:38:34',109,NULL,NULL,1),(364,108,14,21,2,1,'Prueba de Aprobación Jefe para Viáticos','Solicitud de viáticos para viaje a Cali.','Abierto',0,'2025-07-19 10:39:24',106,NULL,NULL,1),(365,110,14,21,2,1,'Prueba de Aprobación Jefe para Viáticos','Solicitud de viáticos para viaje a Cali.','Abierto',0,'2025-07-19 11:04:15',106,NULL,NULL,1),(366,108,14,21,2,1,'Prueba de Aprobación Jefe para Viáticos','Solicitud de viáticos para viaje a Cali.','Abierto',0,'2025-07-19 11:24:47',106,NULL,NULL,1);
/*!40000 ALTER TABLE `tm_ticket` ENABLE KEYS */;

--
-- Table structure for table `tm_usuario`
--

DROP TABLE IF EXISTS `tm_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_usuario` (
  `usu_id` int NOT NULL AUTO_INCREMENT,
  `usu_nom` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `usu_ape` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `usu_correo` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `usu_pass` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `rol_id` int DEFAULT NULL,
  `reg_id` int DEFAULT NULL,
  `car_id` int DEFAULT NULL,
  `dp_id` int DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `fech_modi` datetime DEFAULT NULL,
  `fech_elim` datetime DEFAULT NULL,
  `est` int NOT NULL,
  PRIMARY KEY (`usu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Tabla Mantenedor de Usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_usuario`
--

/*!40000 ALTER TABLE `tm_usuario` DISABLE KEYS */;
INSERT INTO `tm_usuario` VALUES (100,'Admin','Principal','admin@helpdesk.com','$2y$10$U7ns53VVryoWVcb70nGF4ef8NFiIFIkM5w.U//IxeGDfdPRE8im4e',3,NULL,NULL,NULL,'2025-07-02 17:55:15',NULL,NULL,1),(101,'Soraya','Rivera','sorayarivera@helpdesk.com','$2y$10$U7ns53VVryoWVcb70nGF4ef8NFiIFIkM5w.U//IxeGDfdPRE8im4e',2,4,6,10,'2025-07-02 17:55:15',NULL,NULL,1),(102,'Caja','Popayan','cajapopayan@helpdesk.com','$2y$10$U7ns53VVryoWVcb70nGF4ef8NFiIFIkM5w.U//IxeGDfdPRE8im4e',1,2,1,10,'2025-07-02 17:55:15',NULL,'2025-07-02 21:28:05',0),(103,'Caja','Pasto','cajapasto@helpdesk.com','$2y$10$U7ns53VVryoWVcb70nGF4ef8NFiIFIkM5w.U//IxeGDfdPRE8im4e',2,1,1,10,'2025-07-02 17:55:15',NULL,NULL,1),(104,'Analista','Popayan','analistapopayan@helpdesk.com','$2y$10$gjqhXhJIqHOw9zGANtutyusb.JqAym8IRma.gfKAecLLHVlWkWUwK',2,2,2,10,'2025-07-02 17:55:15',NULL,NULL,1),(105,'Analista','Pasto','analistapasto@helpdesk.com','$2y$10$U7ns53VVryoWVcb70nGF4ef8NFiIFIkM5w.U//IxeGDfdPRE8im4e',1,1,2,10,'2025-07-02 17:55:15',NULL,NULL,1),(106,'Mary','Trujillo','marytrujillo@helpdesk.com','$2y$10$U7ns53VVryoWVcb70nGF4ef8NFiIFIkM5w.U//IxeGDfdPRE8im4e',1,4,7,13,'2025-07-02 17:55:15',NULL,NULL,1),(107,'Carlos','Ceron','carlosceron@helpdesk.com','$2y$10$U7ns53VVryoWVcb70nGF4ef8NFiIFIkM5w.U//IxeGDfdPRE8im4e',1,4,8,12,'2025-07-02 17:55:15',NULL,NULL,1),(108,'Rafael','Rojas','rafaelrojas@helpdesk.com','$2y$10$U7ns53VVryoWVcb70nGF4ef8NFiIFIkM5w.U//IxeGDfdPRE8im4e',1,2,3,14,'2025-07-02 17:55:15',NULL,NULL,1),(109,'Leonardo','Perez','leonardoperez@helpdesk.com','$2y$10$U7ns53VVryoWVcb70nGF4ef8NFiIFIkM5w.U//IxeGDfdPRE8im4e',1,2,4,14,'2025-07-02 17:55:15',NULL,NULL,1),(110,'Sebastian','Valencia','sebastianvalencia@helpdesk.com','$2y$10$U7ns53VVryoWVcb70nGF4ef8NFiIFIkM5w.U//IxeGDfdPRE8im4e',1,4,5,12,'2025-07-02 17:55:15',NULL,NULL,1);
/*!40000 ALTER TABLE `tm_usuario` ENABLE KEYS */;

--
-- Dumping routines for database 'helpdeskdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_d_usuario_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_d_usuario_01`(IN `xusu_id` INT)
BEGIN

	UPDATE tm_usuario 

	SET 

		est='0',

		fech_elim = now() 

	where usu_id=xusu_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_l_usuario_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_l_usuario_01`()
BEGIN
	SELECT * FROM tm_usuario LEFT JOIN tm_departamento AS departamento ON tm_usuario.dp_id = departamento.dp_id  where tm_usuario.est='1';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_l_usuario_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_l_usuario_02`(IN `xusu_id` INT)
BEGIN
	SELECT 
    u.*,
	GROUP_CONCAT(e.emp_id SEPARATOR ',') AS emp_ids
	FROM tm_usuario u
	LEFT JOIN empresa_usuario eu ON eu.usu_id = u.usu_id
	LEFT JOIN td_empresa e ON eu.emp_id = e.emp_id
	WHERE u.usu_id = xusu_id
	GROUP BY u.usu_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_reporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reporte`()
BEGIN
        SELECT
        ticket.tick_id as ticket,
        ticket.tick_titulo as titulo,
        ticket.tick_descrip as descripcion,
        ticket.tick_estado as estado,
        ticket.fech_crea as fechacreacion,
        ticket.fech_asig as fechaasignacion,
        ticket.fech_cierre as fechacierre,
        CONCAT(usuariocrea.usu_nom, ' ',usuariocrea.usu_ape ) as nombreusuario,
        CONCAT(usuarioasig.usu_nom, ' ',usuarioasig.usu_ape ) as nombresoporte,
        categoria.cat_nom as categoria,
        subcategoria.cats_nom as subcategoria,
        prioridad.pd_nom as prioridad
        FROM
        tm_ticket as ticket
        INNER JOIN tm_categoria as categoria ON ticket.cat_id = categoria.cat_id
        INNER JOIN tm_usuario as usuariocrea ON ticket.usu_id = usuariocrea.usu_id
        LEFT JOIN tm_usuario as usuarioasig on ticket.usu_asig = usuarioasig.usu_id
        INNER JOIN td_prioridad as prioridad ON ticket.pd_id = prioridad.pd_id
        INNER JOIN tm_subcategoria as subcategoria on ticket.cats_id = subcategoria.cats_id


        WHERE
        ticket.est = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-21 10:12:14
