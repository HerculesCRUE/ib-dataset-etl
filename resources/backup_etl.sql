-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.3.27-MariaDB-1:10.3.27+maria~focal - mariadb.org binary distribution
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para etl
CREATE DATABASE IF NOT EXISTS `etl` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `etl`;

-- Volcando estructura para tabla etl.Articulo
CREATE TABLE IF NOT EXISTS `Articulo` (
  `id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `idEjecucion` int(11) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `coautoria` varchar(50) DEFAULT NULL,
  `Año` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.Articulo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Articulo` ENABLE KEYS */;

-- Volcando estructura para tabla etl.ControlCarga
CREATE TABLE IF NOT EXISTS `ControlCarga` (
  `idCarga` int(11) NOT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `IdEjecucion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCarga`) USING BTREE,
  KEY `CONTROL_TABLAS_FK` (`IdEjecucion`),
  CONSTRAINT `CONTROL_TABLAS_FK` FOREIGN KEY (`IdEjecucion`) REFERENCES `ControlEjecucion` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.ControlCarga: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ControlCarga` DISABLE KEYS */;
/*!40000 ALTER TABLE `ControlCarga` ENABLE KEYS */;

-- Volcando estructura para tabla etl.ControlEjecucion
CREATE TABLE IF NOT EXISTS `ControlEjecucion` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FechaInicio` datetime DEFAULT NULL,
  `FechaFin` datetime DEFAULT NULL,
  `IdEstado` int(11) NOT NULL,
  `IdVersion` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `RUN_PROCESS_FK` (`IdEstado`),
  KEY `CONTROL_PROCESO_FK` (`IdVersion`),
  CONSTRAINT `CONTROL_PROCESO_FK` FOREIGN KEY (`IdVersion`) REFERENCES `ControlVersion` (`Id`),
  CONSTRAINT `RUN_PROCESS_FK` FOREIGN KEY (`IdEstado`) REFERENCES `ControlEjecucionEstado` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.ControlEjecucion: ~101 rows (aproximadamente)
/*!40000 ALTER TABLE `ControlEjecucion` DISABLE KEYS */;
INSERT INTO `ControlEjecucion` (`Id`, `FechaInicio`, `FechaFin`, `IdEstado`, `IdVersion`) VALUES
	(87, '2020-10-30 14:07:20', NULL, 1, 3),
	(88, '2020-10-30 14:15:11', '2020-10-30 14:17:25', 2, 3),
	(89, '2020-10-30 14:34:51', '2020-10-30 14:38:09', 2, 3),
	(90, '2020-10-30 14:45:21', '2020-10-30 14:46:47', 2, 3),
	(91, '2020-10-30 14:49:55', '2020-10-30 14:51:15', 2, 3),
	(92, '2020-10-30 14:55:55', '2020-10-30 14:57:10', 2, 3),
	(93, '2020-11-10 08:55:50', '2020-11-10 08:56:57', 2, 3),
	(94, '2020-11-10 08:58:21', '2020-11-10 08:59:27', 2, 3),
	(95, '2020-11-10 09:08:15', '2020-11-10 09:09:52', 2, 3),
	(96, '2020-11-10 16:34:28', '2020-11-10 16:36:07', 2, 3),
	(97, '2020-11-11 17:25:57', '2020-11-11 17:27:32', 2, 3),
	(98, '2020-11-12 13:42:45', '2020-11-12 13:44:39', 2, 3),
	(99, '2020-11-12 17:35:35', '2020-11-12 17:37:17', 2, 3),
	(100, '2020-11-12 17:44:12', '2020-11-12 17:45:52', 2, 3),
	(101, '2020-11-13 13:58:50', '2020-11-13 13:59:08', 2, 3),
	(102, '2020-11-13 14:32:10', '2020-11-13 14:32:28', 2, 3),
	(103, '2020-11-13 14:42:32', '2020-11-13 14:42:50', 2, 3),
	(104, '2020-11-18 08:56:03', '2020-11-18 08:56:21', 2, 3),
	(105, '2020-11-18 08:57:34', '2020-11-18 08:57:51', 2, 3),
	(106, '2020-11-18 08:58:32', '2020-11-18 08:58:50', 2, 3),
	(107, '2020-11-18 08:59:50', '2020-11-18 09:00:08', 2, 3),
	(108, '2020-11-18 09:03:37', '2020-11-18 09:03:55', 2, 3),
	(109, '2020-11-18 11:10:44', '2020-11-18 11:11:01', 2, 3),
	(110, '2020-11-18 12:36:01', '2020-11-18 12:36:20', 2, 3),
	(111, '2020-11-19 15:27:44', '2020-11-19 15:28:06', 3, 3),
	(112, '2020-11-19 15:30:29', '2020-11-19 15:30:53', 2, 3),
	(113, '2020-11-19 16:48:40', NULL, 1, 3),
	(114, '2020-11-19 16:49:49', '2020-11-19 16:50:03', 2, 3),
	(115, '2020-11-19 16:53:24', '2020-11-19 16:53:38', 2, 3),
	(116, '2020-11-19 16:57:55', '2020-11-19 16:58:09', 2, 3),
	(117, '2020-11-19 16:59:58', '2020-11-19 17:00:11', 2, 3),
	(118, '2020-11-19 17:12:15', '2020-11-19 17:12:28', 2, 3),
	(119, '2020-11-19 17:13:12', '2020-11-19 17:13:25', 2, 3),
	(120, '2020-11-19 17:15:13', '2020-11-19 17:15:26', 2, 3),
	(121, '2020-11-20 13:51:26', '2020-11-20 13:51:45', 2, 3),
	(122, '2020-11-20 14:28:53', '2020-11-20 14:29:21', 2, 3),
	(123, '2020-11-20 14:30:05', '2020-11-20 14:30:32', 2, 3),
	(124, '2020-11-20 14:30:54', '2020-11-20 14:31:21', 2, 3),
	(125, '2020-11-23 10:07:28', '2020-11-23 10:07:36', 3, 3),
	(126, '2020-11-23 10:08:52', '2020-11-23 10:08:59', 3, 3),
	(127, '2020-11-23 10:09:45', '2020-11-23 10:09:52', 3, 3),
	(128, '2020-11-23 10:12:19', '2020-11-23 10:12:26', 3, 3),
	(129, '2020-11-23 10:18:20', '2020-11-23 10:18:27', 3, 3),
	(130, '2020-11-23 10:19:11', '2020-11-23 10:19:18', 3, 3),
	(131, '2020-11-23 10:20:25', '2020-11-23 10:20:32', 3, 3),
	(132, '2020-11-23 10:23:43', '2020-11-23 10:23:50', 3, 3),
	(133, '2020-11-23 10:24:04', '2020-11-23 10:24:11', 3, 3),
	(134, '2020-11-23 10:26:27', '2020-11-23 10:26:34', 3, 3),
	(135, '2020-11-23 10:31:36', '2020-11-23 10:32:04', 2, 3),
	(136, '2020-11-23 10:35:39', '2020-11-23 10:36:06', 2, 3),
	(137, '2020-11-23 10:37:11', '2020-11-23 10:37:38', 2, 3),
	(138, '2020-11-24 14:04:47', '2020-11-24 14:05:51', 2, 3),
	(139, '2020-11-24 14:08:24', '2020-11-24 14:09:28', 2, 3),
	(140, '2020-11-24 16:07:03', '2020-11-24 16:08:08', 2, 3),
	(141, '2020-11-24 16:29:55', '2020-11-24 16:30:53', 2, 3),
	(142, '2020-11-24 16:35:30', '2020-11-24 16:36:26', 2, 3),
	(143, '2020-11-24 16:36:43', '2020-11-24 16:37:39', 2, 3),
	(144, '2020-11-26 18:01:44', '2020-11-26 18:02:06', 3, 3),
	(145, '2020-11-26 18:02:41', '2020-11-26 18:03:06', 3, 3),
	(146, '2020-11-30 09:29:20', '2020-11-30 09:29:43', 3, 3),
	(147, '2020-11-30 09:48:35', '2020-11-30 09:49:01', 3, 3),
	(148, '2020-11-30 12:11:53', '2020-11-30 12:12:35', 3, 3),
	(149, '2020-11-30 12:16:15', '2020-11-30 12:17:15', 2, 3),
	(150, '2020-11-30 13:39:52', '2020-11-30 13:44:18', 2, 3),
	(151, '2020-11-30 18:54:34', '2020-11-30 18:59:12', 2, 3),
	(152, '2020-12-01 10:32:15', '2020-12-01 10:36:28', 2, 3),
	(153, '2020-12-01 15:40:42', NULL, 1, 3),
	(154, '2020-12-01 15:41:18', '2020-12-01 15:45:29', 2, 3),
	(155, '2020-12-01 15:57:20', '2020-12-01 15:57:34', 3, 3),
	(156, '2020-12-01 15:59:05', NULL, 1, 3),
	(157, '2020-12-01 15:59:30', '2020-12-01 16:00:21', 2, 3),
	(158, '2020-12-01 16:01:00', '2020-12-01 16:01:51', 2, 3),
	(159, '2020-12-01 16:37:51', '2020-12-01 16:38:44', 2, 3),
	(160, '2020-12-01 17:44:49', '2020-12-01 17:45:42', 2, 3),
	(161, '2020-12-02 16:51:16', '2020-12-02 16:52:19', 2, 3),
	(162, '2020-12-02 17:32:46', '2020-12-02 17:36:19', 2, 3),
	(163, '2020-12-02 17:57:58', '2020-12-02 18:01:15', 2, 3),
	(164, '2020-12-04 09:06:41', NULL, 1, 3),
	(165, '2020-12-04 10:40:23', '2020-12-04 10:40:27', 3, 3),
	(166, '2020-12-04 10:42:21', '2020-12-04 10:42:38', 3, 3),
	(167, '2020-12-04 10:45:09', '2020-12-04 10:46:52', 2, 3),
	(168, '2020-12-04 12:08:33', '2020-12-04 12:08:43', 3, 3),
	(169, '2020-12-04 12:08:53', '2020-12-04 12:09:03', 3, 3),
	(170, '2020-12-04 12:24:44', '2020-12-04 12:28:02', 2, 3),
	(171, '2020-12-09 09:18:20', '2020-12-09 09:18:29', 3, 3),
	(172, '2020-12-09 09:19:26', '2020-12-09 09:19:35', 3, 3),
	(173, '2020-12-09 10:07:36', '2020-12-09 10:08:30', 2, 3),
	(174, '2020-12-09 10:11:35', '2020-12-09 10:12:29', 2, 3),
	(175, '2020-12-09 10:32:45', '2020-12-09 10:33:38', 2, 3),
	(176, '2020-12-09 10:38:37', '2020-12-09 10:39:38', 2, 3),
	(177, '2020-12-09 10:42:13', '2020-12-09 10:42:23', 3, 3),
	(178, '2020-12-09 11:45:31', '2020-12-09 11:46:24', 2, 3),
	(179, '2020-12-09 12:16:33', '2020-12-09 12:17:27', 2, 3),
	(180, '2020-12-09 16:42:42', '2020-12-09 16:42:52', 3, 3),
	(181, '2020-12-09 16:43:02', NULL, 1, 3),
	(182, '2020-12-09 16:55:33', '2020-12-09 16:59:19', 2, 3),
	(183, '2020-12-10 12:32:35', '2020-12-10 12:35:56', 3, 3),
	(184, '2020-12-10 12:48:15', '2020-12-10 12:51:31', 3, 3),
	(185, '2020-12-10 12:55:43', '2020-12-10 12:59:33', 3, 3),
	(186, '2020-12-10 12:56:52', '2020-12-10 13:00:38', 3, 3),
	(187, '2020-12-10 13:09:02', '2020-12-10 13:12:32', 2, 3);
/*!40000 ALTER TABLE `ControlEjecucion` ENABLE KEYS */;

-- Volcando estructura para tabla etl.ControlEjecucionEstado
CREATE TABLE IF NOT EXISTS `ControlEjecucionEstado` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.ControlEjecucionEstado: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `ControlEjecucionEstado` DISABLE KEYS */;
INSERT INTO `ControlEjecucionEstado` (`Id`, `Nombre`) VALUES
	(1, 'Running'),
	(2, 'Successfully completed'),
	(3, 'Failed');
/*!40000 ALTER TABLE `ControlEjecucionEstado` ENABLE KEYS */;

-- Volcando estructura para tabla etl.ControlEnvio
CREATE TABLE IF NOT EXISTS `ControlEnvio` (
  `Entity` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Read` bigint(20) DEFAULT NULL,
  `Written` bigint(20) DEFAULT NULL,
  `Updated` bigint(20) DEFAULT NULL,
  `Input` bigint(20) DEFAULT NULL,
  `Output` bigint(20) DEFAULT NULL,
  `Rejected` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.ControlEnvio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ControlEnvio` DISABLE KEYS */;
/*!40000 ALTER TABLE `ControlEnvio` ENABLE KEYS */;

-- Volcando estructura para tabla etl.ControlErrores
CREATE TABLE IF NOT EXISTS `ControlErrores` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime DEFAULT NULL,
  `IdEjecucion` int(11) NOT NULL,
  `IdTipoError` int(11) NOT NULL,
  `Mensaje` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `CONTROL_ERRORS_FK` (`IdEjecucion`),
  KEY `CONTROL_ERRORS_FK_1` (`IdTipoError`),
  CONSTRAINT `CONTROL_ERRORS_FK` FOREIGN KEY (`IdEjecucion`) REFERENCES `ControlEjecucion` (`Id`),
  CONSTRAINT `CONTROL_ERRORS_FK_1` FOREIGN KEY (`IdTipoError`) REFERENCES `ControlTipoError` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.ControlErrores: ~77 rows (aproximadamente)
/*!40000 ALTER TABLE `ControlErrores` DISABLE KEYS */;
INSERT INTO `ControlErrores` (`Id`, `Fecha`, `IdEjecucion`, `IdTipoError`, `Mensaje`) VALUES
	(1, '2020-11-20 13:51:31', 121, 5, 'Han habido errores en la carga de los Proyectos'),
	(2, '2020-11-20 14:28:59', 122, 5, 'Han habido errores en la carga de los Proyectos'),
	(3, '2020-11-20 14:30:10', 123, 5, 'Han habido errores en la carga de los Proyectos'),
	(4, '2020-11-20 14:31:00', 124, 5, 'Han habido errores en la carga de los Proyectos'),
	(5, '2020-11-23 10:31:41', 135, 5, 'Han habido errores en la carga de los Proyectos'),
	(6, '2020-11-23 10:35:45', 136, 5, 'Han habido errores en la carga de los Proyectos'),
	(7, '2020-11-23 10:37:16', 137, 5, 'Han habido errores en la carga de los Proyectos'),
	(8, '2020-11-24 09:14:38', 137, 5, 'Han habido errores en la carga de los Proyectos'),
	(9, '2020-11-24 14:05:02', 138, 5, 'Han habido errores en la carga de los Proyectos'),
	(10, '2020-11-24 14:08:39', 139, 5, 'Han habido errores en la carga de los Proyectos'),
	(11, '2020-11-24 16:07:18', 140, 5, 'Han habido errores en la carga de los Proyectos'),
	(12, '2020-11-24 16:30:11', 141, 5, 'Han habido errores en la carga de los Proyectos'),
	(13, '2020-11-24 16:35:45', 142, 5, 'Han habido errores en la carga de los Proyectos'),
	(14, '2020-11-24 16:36:58', 143, 5, 'Han habido errores en la carga de los Proyectos'),
	(15, '2020-11-25 10:31:16', 143, 5, 'Han habido errores en la carga de los Proyectos'),
	(16, '2020-11-25 10:31:23', 143, 5, 'Han habido errores en la carga de Patentes'),
	(17, '2020-11-25 10:33:32', 143, 5, 'Han habido errores en la carga de los Proyectos'),
	(18, '2020-11-25 17:07:18', 143, 5, 'Han habido errores en la carga de los Proyectos'),
	(19, '2020-11-26 09:41:57', 143, 5, 'Han habido errores en la carga de los Proyectos'),
	(20, '2020-11-26 10:09:28', 143, 5, 'Han habido errores en la carga de los Proyectos'),
	(21, '2020-11-26 10:15:34', 143, 5, 'Han habido errores en la carga de los Proyectos'),
	(22, '2020-11-26 12:28:01', 143, 5, 'Han habido errores en la carga de los Proyectos'),
	(23, '2020-11-26 18:01:49', 144, 5, 'Han habido errores en la carga de los Proyectos'),
	(24, '2020-11-26 18:02:04', 144, 5, 'Han habido errores en la carga de los Proyectos'),
	(25, '2020-11-26 18:02:46', 145, 5, 'Han habido errores en la carga de los Proyectos'),
	(26, '2020-11-26 18:03:04', 145, 5, 'Han habido errores en la carga de los Proyectos'),
	(27, '2020-11-30 09:29:25', 146, 5, 'Han habido errores en la carga de los Proyectos'),
	(28, '2020-11-30 09:29:41', 146, 5, 'Han habido errores en la carga de los Proyectos'),
	(29, '2020-11-30 09:48:39', 147, 5, 'Han habido errores en la carga de los Proyectos'),
	(30, '2020-11-30 09:48:59', 147, 5, 'Han habido errores en la carga de los Proyectos'),
	(31, '2020-11-30 10:22:35', 147, 5, 'Han habido errores en la carga de los Proyectos'),
	(32, '2020-11-30 12:07:56', 147, 5, 'Han habido errores en la carga de los Proyectos'),
	(33, '2020-11-30 12:11:58', 148, 5, 'Han habido errores en la carga de los Proyectos'),
	(34, '2020-11-30 12:12:34', 148, 5, 'Han habido errores en la carga de los Proyectos'),
	(35, '2020-11-30 12:16:19', 149, 5, 'Han habido errores en la carga de los Proyectos'),
	(36, '2020-11-30 13:39:56', 150, 5, 'Han habido errores en la carga de los Proyectos'),
	(37, '2020-11-30 16:32:44', 147, 5, 'Han habido errores en la carga de los Proyectos'),
	(38, '2020-11-30 17:19:01', 147, 5, 'Han habido errores en la carga de los Proyectos'),
	(39, '2020-11-30 18:54:38', 151, 5, 'Han habido errores en la carga de los Proyectos'),
	(40, '2020-12-01 09:54:03', 147, 5, 'Han habido errores en la carga de los Proyectos'),
	(41, '2020-12-01 10:32:19', 152, 5, 'Han habido errores en la carga de los Proyectos'),
	(42, '2020-12-01 15:40:46', 153, 5, 'Han habido errores en la carga de los Proyectos'),
	(43, '2020-12-01 15:41:22', 154, 5, 'Han habido errores en la carga de los Proyectos'),
	(44, '2020-12-01 15:57:24', 155, 5, 'Han habido errores en la carga de los Proyectos'),
	(45, '2020-12-01 15:57:32', 155, 5, 'Han habido errores en la carga de Patentes'),
	(46, '2020-12-01 15:58:14', 152, 5, 'Han habido errores en la carga de los Proyectos'),
	(47, '2020-12-01 15:58:22', 152, 5, 'Han habido errores en la carga de Patentes'),
	(48, '2020-12-01 15:59:09', 156, 5, 'Han habido errores en la carga de los Proyectos'),
	(49, '2020-12-01 15:59:34', 157, 5, 'Han habido errores en la carga de los Proyectos'),
	(50, '2020-12-01 16:01:04', 158, 5, 'Han habido errores en la carga de los Proyectos'),
	(51, '2020-12-01 16:37:55', 159, 5, 'Han habido errores en la carga de los Proyectos'),
	(52, '2020-12-01 17:42:25', 159, 5, 'Han habido errores en la carga de los Proyectos'),
	(53, '2020-12-01 17:44:54', 160, 5, 'Han habido errores en la carga de los Proyectos'),
	(54, '2020-12-02 16:51:22', 161, 5, 'Han habido errores en la carga de los Proyectos'),
	(55, '2020-12-02 17:32:53', 162, 5, 'Han habido errores en la carga de los Proyectos'),
	(56, '2020-12-02 17:58:04', 163, 5, 'Han habido errores en la carga de los Proyectos'),
	(57, '2020-12-04 10:46:04', 167, 5, 'Han habido errores en la carga de los Proyectos'),
	(58, '2020-12-04 12:08:42', 168, 5, 'Han habido errores en la carga de los Proyectos'),
	(59, '2020-12-04 12:09:01', 169, 5, 'Han habido errores en la carga de los Proyectos'),
	(60, '2020-12-04 12:24:53', 170, 5, 'Han habido errores en la carga de los Proyectos'),
	(61, '2020-12-09 09:18:28', 171, 5, 'Han habido errores en la carga de los Proyectos'),
	(62, '2020-12-09 09:19:34', 172, 5, 'Han habido errores en la carga de los Proyectos'),
	(63, '2020-12-09 10:07:41', 173, 5, 'Han habido errores en la carga de los Proyectos'),
	(64, '2020-12-09 10:11:40', 174, 5, 'Han habido errores en la carga de los Proyectos'),
	(65, '2020-12-09 10:32:50', 175, 5, 'Han habido errores en la carga de los Proyectos'),
	(66, '2020-12-09 10:38:43', 176, 5, 'Han habido errores en la carga de los Proyectos'),
	(67, '2020-12-09 10:42:22', 177, 5, 'Han habido errores en la carga de los Proyectos'),
	(68, '2020-12-09 11:45:36', 178, 5, 'Han habido errores en la carga de los Proyectos'),
	(69, '2020-12-09 12:16:38', 179, 5, 'Han habido errores en la carga de los Proyectos'),
	(70, '2020-12-09 16:42:51', 180, 5, 'Han habido errores en la carga de los Proyectos'),
	(71, '2020-12-09 16:43:09', 181, 5, 'Han habido errores en la carga de los Proyectos'),
	(72, '2020-12-09 16:55:41', 182, 5, 'Han habido errores en la carga de los Proyectos'),
	(73, '2020-12-10 12:32:45', 183, 5, 'Han habido errores en la carga de los Proyectos'),
	(74, '2020-12-10 12:35:54', 183, 5, 'Han habido errores en la carga de los Proyectos'),
	(75, '2020-12-10 12:48:22', 184, 5, 'Han habido errores en la carga de los Proyectos'),
	(76, '2020-12-10 12:51:29', 184, 5, 'Han habido errores en la carga de los Proyectos'),
	(77, '2020-12-10 12:55:51', 185, 5, 'Han habido errores en la carga de los Proyectos'),
	(78, '2020-12-10 12:57:01', 186, 5, 'Han habido errores en la carga de los Proyectos'),
	(79, '2020-12-10 12:59:31', 185, 5, 'Han habido errores en la carga de los Proyectos'),
	(80, '2020-12-10 13:00:36', 186, 5, 'Han habido errores en la carga de los Proyectos'),
	(81, '2020-12-10 13:02:20', 186, 5, 'Han habido errores en la carga de los Proyectos'),
	(82, '2020-12-10 13:05:09', 186, 5, 'Han habido errores en la carga de los Proyectos'),
	(83, '2020-12-10 13:09:10', 187, 5, 'Han habido errores en la carga de los Proyectos');
/*!40000 ALTER TABLE `ControlErrores` ENABLE KEYS */;

-- Volcando estructura para tabla etl.ControlTipoError
CREATE TABLE IF NOT EXISTS `ControlTipoError` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.ControlTipoError: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `ControlTipoError` DISABLE KEYS */;
INSERT INTO `ControlTipoError` (`Id`, `Descripcion`) VALUES
	(1, 'No se ha podido encontrar el fichero de parámetros "config.properties".'),
	(2, 'No se ha podido establecer conexión con la base de datos origen.'),
	(3, 'No se ha podido establecer conexión con la base de datos destino.'),
	(4, 'No se ha podido establecer conexión con el servicio de la cola de mensajes de kafka.'),
	(5, 'Ha habido algún error en la inserción/actualización/eliminación de algún registro en una de las tablas destino. Por favor, revisar la tabla de ControlErrores para solucionar el problema en la próxima ejecución.');
/*!40000 ALTER TABLE `ControlTipoError` ENABLE KEYS */;

-- Volcando estructura para tabla etl.ControlVersion
CREATE TABLE IF NOT EXISTS `ControlVersion` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.ControlVersion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ControlVersion` DISABLE KEYS */;
INSERT INTO `ControlVersion` (`Id`, `Fecha`, `Nombre`, `Descripcion`) VALUES
	(3, '2020-10-30 14:07:19', '1.0', 'Proyecto ETL Version 1.0. Aplicacion ETL: Pentaho Data Integration. Version de la aplicacion:9.0');
/*!40000 ALTER TABLE `ControlVersion` ENABLE KEYS */;

-- Volcando estructura para tabla etl.EmpresaExplotacionPatente
CREATE TABLE IF NOT EXISTS `EmpresaExplotacionPatente` (
  `id` int(11) DEFAULT NULL,
  `idPatente` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `observaciones` varchar(50) DEFAULT NULL,
  `fechaInicioPeriodo` datetime DEFAULT NULL,
  `fechaFinPeriodo` datetime DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `idEjecucion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.EmpresaExplotacionPatente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `EmpresaExplotacionPatente` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmpresaExplotacionPatente` ENABLE KEYS */;

-- Volcando estructura para tabla etl.FacturaProyecto
CREATE TABLE IF NOT EXISTS `FacturaProyecto` (
  `id` varchar(50) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `idProyecto` int(11) DEFAULT NULL,
  `numeroFacturaPrevista` int(11) DEFAULT NULL,
  `FechaCreacion` datetime DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL,
  `IdEjecucion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.FacturaProyecto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `FacturaProyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `FacturaProyecto` ENABLE KEYS */;

-- Volcando estructura para tabla etl.FinanciacionProyecto
CREATE TABLE IF NOT EXISTS `FinanciacionProyecto` (
  `id` varchar(50) NOT NULL,
  `idProyecto` varchar(50) DEFAULT NULL,
  `codTipoFinanciacion` varchar(50) DEFAULT NULL,
  `tipoFinanciacion` varchar(50) DEFAULT NULL,
  `codTipoFuente` varchar(50) DEFAULT NULL,
  `tipoFuente` varchar(50) DEFAULT NULL,
  `idEjecucion` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.FinanciacionProyecto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `FinanciacionProyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `FinanciacionProyecto` ENABLE KEYS */;

-- Volcando estructura para tabla etl.GrupoInvestigacion
CREATE TABLE IF NOT EXISTS `GrupoInvestigacion` (
  `id` varchar(15) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `idUniversidad` int(11) NOT NULL,
  `idEjecucion` int(11) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.GrupoInvestigacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `GrupoInvestigacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `GrupoInvestigacion` ENABLE KEYS */;

-- Volcando estructura para tabla etl.Libro
CREATE TABLE IF NOT EXISTS `Libro` (
  `id` varchar(50) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `idEjecucion` int(11) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `coautoria` varchar(50) DEFAULT NULL,
  `Año` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.Libro: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Libro` ENABLE KEYS */;

-- Volcando estructura para tabla etl.Patente
CREATE TABLE IF NOT EXISTS `Patente` (
  `id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `idEjecucion` int(11) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `fechaConcesionPatente` datetime DEFAULT NULL,
  `FechaExpiracionPatente` datetime DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.Patente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Patente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patente` ENABLE KEYS */;

-- Volcando estructura para tabla etl.Persona
CREATE TABLE IF NOT EXISTS `Persona` (
  `id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `idEjecucion` int(11) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `persCentCodigo` varchar(50) DEFAULT NULL,
  `cedNombre` varchar(255) DEFAULT NULL,
  `persDeptCodigo` varchar(50) DEFAULT NULL,
  `depNombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla etl.Persona: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `Persona` ENABLE KEYS */;

-- Volcando estructura para tabla etl.Proyecto
CREATE TABLE IF NOT EXISTS `Proyecto` (
  `id` varchar(50) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `idOrigenProyecto` varchar(15) DEFAULT NULL,
  `idEjecucion` varchar(50) DEFAULT NULL,
  `fechaFin` datetime DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `fechaInicio` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.Proyecto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Proyecto` ENABLE KEYS */;

-- Volcando estructura para tabla etl.Rel_AutorArticulo
CREATE TABLE IF NOT EXISTS `Rel_AutorArticulo` (
  `id` varchar(50) NOT NULL,
  `idPersona` varchar(50) DEFAULT NULL,
  `idArticulo` varchar(50) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `idEjecucion` int(11) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.Rel_AutorArticulo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Rel_AutorArticulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rel_AutorArticulo` ENABLE KEYS */;

-- Volcando estructura para tabla etl.Rel_AutorLibro
CREATE TABLE IF NOT EXISTS `Rel_AutorLibro` (
  `id` varchar(50) NOT NULL,
  `idPersona` varchar(50) DEFAULT NULL,
  `idLibro` varchar(50) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `idEjecucion` int(11) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla etl.Rel_AutorLibro: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Rel_AutorLibro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rel_AutorLibro` ENABLE KEYS */;

-- Volcando estructura para tabla etl.Rel_DatosEquipoInvestigacion
CREATE TABLE IF NOT EXISTS `Rel_DatosEquipoInvestigacion` (
  `id` varchar(50) NOT NULL,
  `idPersona` varchar(50) DEFAULT NULL,
  `idGrupoInvestigacion` varchar(50) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `idEjecucion` int(11) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `tipoParticipacion` varchar(255) DEFAULT NULL,
  `responsable` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla etl.Rel_DatosEquipoInvestigacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Rel_DatosEquipoInvestigacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rel_DatosEquipoInvestigacion` ENABLE KEYS */;

-- Volcando estructura para tabla etl.Rel_EquipoProyecto
CREATE TABLE IF NOT EXISTS `Rel_EquipoProyecto` (
  `id` varchar(50) NOT NULL,
  `idPersona` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `idEjecucion` int(11) DEFAULT NULL,
  `idProyecto` varchar(50) DEFAULT NULL,
  `numeroColaborador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla etl.Rel_EquipoProyecto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Rel_EquipoProyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rel_EquipoProyecto` ENABLE KEYS */;

-- Volcando estructura para tabla etl.Rel_InventorPatente
CREATE TABLE IF NOT EXISTS `Rel_InventorPatente` (
  `id` varchar(50) NOT NULL,
  `idPersona` int(11) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `idEjecucion` int(11) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `idPatente` int(11) DEFAULT NULL,
  `inventorPrincipal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.Rel_InventorPatente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Rel_InventorPatente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rel_InventorPatente` ENABLE KEYS */;

-- Volcando estructura para tabla etl.Rel_RelacionOrigenProyecto
CREATE TABLE IF NOT EXISTS `Rel_RelacionOrigenProyecto` (
  `id` varchar(50) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `idEjecucion` int(11) DEFAULT NULL,
  `codTipoOrigen` varchar(50) DEFAULT NULL,
  `idOrigenProyecto` varchar(50) DEFAULT NULL,
  `idProyecto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla etl.Rel_RelacionOrigenProyecto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Rel_RelacionOrigenProyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rel_RelacionOrigenProyecto` ENABLE KEYS */;

-- Volcando estructura para tabla etl.Universidad
CREATE TABLE IF NOT EXISTS `Universidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `idEjecucion` int(11) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla etl.Universidad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Universidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Universidad` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
