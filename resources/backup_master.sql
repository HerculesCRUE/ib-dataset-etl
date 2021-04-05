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


-- Volcando estructura de base de datos para master
CREATE DATABASE IF NOT EXISTS `master` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `master`;

-- Volcando estructura para tabla master.HRUniversities
CREATE TABLE IF NOT EXISTS `HRUniversities` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla master.HRUniversities: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `HRUniversities` DISABLE KEYS */;
INSERT INTO `HRUniversities` (`id`, `code`, `name`) VALUES
	(1, '1.0', 'Chancellor'),
	(2, '2.0', 'Dean of faculty'),
	(3, '3.0', 'Department director of studies'),
	(4, '4.0', 'Deputy vicechancellor'),
	(5, '5.0', 'Emeritus professor'),
	(6, '6.0', 'Emeritus reader'),
	(7, '7.0', 'Head of department'),
	(8, '8.0', 'Prochancellor'),
	(9, '9.0', 'Provicechancellor'),
	(10, '10.0', 'Professorial research fellow'),
	(11, '11.0', 'Research assistant'),
	(12, '12.0', 'Research fellow'),
	(13, '13.0', 'Senior research fellow'),
	(14, '14.0', 'Assistant lecturer'),
	(15, '15.0', 'Clinical lecturer'),
	(16, '16.0', 'Lecturer'),
	(17, '17.0', 'Professor'),
	(18, '18.0', 'Reader'),
	(19, '19.0', 'Senior lecturer'),
	(20, '20.0', 'Professorial teaching fellow'),
	(21, '21.0', 'Vicechancellor');
/*!40000 ALTER TABLE `HRUniversities` ENABLE KEYS */;

-- Volcando estructura para tabla master.ProjectClassification
CREATE TABLE IF NOT EXISTS `ProjectClassification` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla master.ProjectClassification: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `ProjectClassification` DISABLE KEYS */;
INSERT INTO `ProjectClassification` (`id`, `code`, `name`) VALUES
	(1, NULL, 'European'),
	(2, NULL, 'ExcellentScience'),
	(3, NULL, 'Horizon2020'),
	(4, NULL, 'IndividualFellowships'),
	(5, NULL, 'Internal'),
	(6, NULL, 'International'),
	(7, NULL, 'Interreg'),
	(8, NULL, 'ITNETN'),
	(9, NULL, 'National'),
	(10, NULL, 'Regional'),
	(11, NULL, 'RegionsofEurope'),
	(12, NULL, 'SC1'),
	(13, NULL, 'SC2'),
	(14, NULL, 'SocietalChallenges'),
	(15, NULL, 'Sudoe');
/*!40000 ALTER TABLE `ProjectClassification` ENABLE KEYS */;

-- Volcando estructura para tabla master.RegionalSubdivisions
CREATE TABLE IF NOT EXISTS `RegionalSubdivisions` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla master.RegionalSubdivisions: ~50 rows (aproximadamente)
/*!40000 ALTER TABLE `RegionalSubdivisions` DISABLE KEYS */;
INSERT INTO `RegionalSubdivisions` (`id`, `code`, `name`) VALUES
	(1, 'ES-C', 'La Coruña'),
	(2, 'ES-VI', 'Álava'),
	(3, 'ES-AB', 'Albacete'),
	(4, 'ES-A', 'Alicante'),
	(5, 'ES-AL', 'Almería'),
	(6, 'ES-O', 'Asturias provincia'),
	(7, 'ES-AV', 'Ávila'),
	(8, 'ES-BA', 'Badajoz'),
	(9, 'ES-PM', 'Baleares provincia'),
	(10, 'ES-B', 'Barcelona'),
	(11, 'ES-BU', 'Burgos'),
	(12, 'ES-CC', 'Cáceres'),
	(13, 'ES-CA', 'Cádiz'),
	(14, 'ES-S', 'Cantabria provincia'),
	(15, 'ES-CS', 'Castellón'),
	(16, 'ES-CR', 'Ciudad Real'),
	(17, 'ES-CO', 'Córdoba'),
	(18, 'ES-CU', 'Cuenca'),
	(19, 'ES-GI', 'Gerona'),
	(20, 'ES-GR', 'Granada'),
	(21, 'ES-GU', 'Guadalajara'),
	(22, 'ES-SS', 'Guipúzcoa'),
	(23, 'ES-H', 'Huelva'),
	(24, 'ES-HU', 'Huesca'),
	(25, 'ES-J', 'Jaén'),
	(26, 'ES-LO', 'La Rioja'),
	(27, 'ES-GC', 'Las Palmas'),
	(28, 'ES-LE', 'León'),
	(29, 'ES-L', 'Lérida'),
	(30, 'ES-LU', 'Lugo'),
	(31, 'ES-M', 'Madrid provincia'),
	(32, 'ES-MA', 'Málaga'),
	(33, 'ES-MU', 'Murcia provincia'),
	(34, 'ES-NA', 'Navarra provincia'),
	(35, 'ES-OR', 'Orense'),
	(36, 'ES-P', 'Palencia'),
	(37, 'ES-PO', 'Pontevedra'),
	(38, 'ES-SA', 'Salamanca'),
	(39, 'ES-TF', 'Santa Cruz de Tenerife'),
	(40, 'ES-SG', 'Segovia'),
	(41, 'ES-SE', 'Sevilla'),
	(42, 'ES-SO', 'Soria'),
	(43, 'ES-T', 'Tarragona'),
	(44, 'ES-TE', 'Teruel'),
	(45, 'ES-TO', 'Toledo'),
	(46, 'ES-V', 'Valencia'),
	(47, 'ES-VA', 'Valladolid'),
	(48, 'ES-BI', 'Vizcaya'),
	(49, 'ES-ZA', 'Zamora'),
	(50, 'ES-Z', 'Zaragoza');
/*!40000 ALTER TABLE `RegionalSubdivisions` ENABLE KEYS */;

-- Volcando estructura para tabla master.ScientificDomains
CREATE TABLE IF NOT EXISTS `ScientificDomains` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla master.ScientificDomains: ~257 rows (aproximadamente)
/*!40000 ALTER TABLE `ScientificDomains` DISABLE KEYS */;
INSERT INTO `ScientificDomains` (`id`, `code`, `name`) VALUES
	(1, 'CTMIN', 'Mineralogía'),
	(2, 'CTPETR', 'Petrología'),
	(3, 'CTPALE', 'Paleobiología'),
	(4, 'CTTAFO', 'Tafonomía'),
	(5, 'CTGEOF', 'Geomorfología'),
	(6, 'CTHIDRO', 'Hidrología'),
	(7, 'CTGEOD', 'Geodinámica interna'),
	(8, 'CTGEOF', 'Geofísica'),
	(9, 'CTESTR', 'Estratigrafía'),
	(10, 'CTSEDI', 'Sedimentología'),
	(11, 'CTMETE', 'Meteorología'),
	(12, 'CTCLIM', 'Climatología y atmósfera'),
	(13, 'CTGEOQ', 'Geoquímica ambiental'),
	(14, 'CTCON', 'Contaminación'),
	(15, 'CTASTR', 'Astronomía y Astrofísica'),
	(16, 'CTFISA', 'Física atómica molecular y óptica'),
	(17, 'CTFISP', 'Física de partículas'),
	(18, 'CTFISE', 'Física estadística biofísica y física no lineal'),
	(19, 'CTFIST', 'Física teórica'),
	(20, 'CTMATE', 'Materia condensada'),
	(21, 'MTMGEOM', 'Geometría'),
	(22, 'MTMTOPO', 'Topología'),
	(23, 'MTMANAL', 'Análisis numérico'),
	(24, 'MTMMATE', 'Matemática aplicada'),
	(25, 'MTMALGE', 'Álgebra'),
	(26, 'MTMANAM', 'Análisis matemático'),
	(27, 'MTMESTA', 'Estadística'),
	(28, 'MTMINVO', 'Investigación operativa'),
	(29, 'QMCQUIN', 'Química inorgánica'),
	(30, 'QMCQUIO', 'Química organometálica'),
	(31, 'QMCCATA', 'Catálisis'),
	(32, 'QMCQUSU', 'Química supramolecular'),
	(33, 'QMCMATM', 'Materiales moleculares'),
	(34, 'QMCNANO', 'Nanoquímica'),
	(35, 'QMCQUBI', 'Química biológica'),
	(36, 'QMCQBIT', 'Química biotecnológica'),
	(37, 'QMCQUFI', 'Química física'),
	(38, 'QMCQUAN', 'Química analítica'),
	(39, 'QMCAMBI', 'Química ambiental'),
	(40, 'QMCORGA', 'Química orgánica'),
	(41, 'QMCCATE', 'Catálisis enantioselectiva'),
	(42, 'BFSCXPL', 'Neurobiología y desarrollo'),
	(43, 'BFSEEAB', 'Diferenciación'),
	(44, 'BFSJEYV', 'Cáncer'),
	(45, 'BFSOWHX', 'Biología estructural'),
	(46, 'BFSGSYN', 'Bioinformática'),
	(47, 'BFSSBGU', 'Biología celular'),
	(48, 'BFSHQCF', 'Microbiología'),
	(49, 'BFSCVHN', 'Biotecnología'),
	(50, 'BFSJJXW', 'Plantas'),
	(51, 'BFSTSEI', 'Inmunología'),
	(52, 'BFSHRRE', 'Metabolismo'),
	(53, 'BFSDNIG', 'Genómica'),
	(54, 'BFSDXWB', 'Genética de poblaciones'),
	(55, 'BFSDGRC', 'Virología'),
	(56, 'BMEDZYOC', 'Biología celular y molecular'),
	(57, 'BMEDJNIS', 'Inmunología'),
	(58, 'BMEDPJHL', 'Cardiovascular'),
	(59, 'BMEDRCYB', 'Neurociencias'),
	(60, 'BMEDOFOI', 'Anatomía'),
	(61, 'BMEDHTAZ', 'Hepatología'),
	(62, 'BMEDMJHF', 'Muerte celular'),
	(63, 'BMEDMJZM', 'Genética'),
	(64, 'BMEDRYDY', 'Cáncer'),
	(65, 'BMEDLFCH', 'Endocrinología'),
	(66, 'BMEDMHOU', 'Enfermedades metabólicas'),
	(67, 'BMEDIRHV', 'Microbiología'),
	(68, 'BMEDTINW', 'Descubrimiento de fármacos'),
	(69, 'BMEDDHHL', 'Farmacología Molecular'),
	(70, 'BMEDAYJV', 'Farmacología general y de sistemas'),
	(71, 'BMEDYQHF', 'Fisiología celular y de sistemas'),
	(72, 'MCLINMLH', 'Cirugía y maxilofacial'),
	(73, 'MCLIBGSE', 'Epidemiología'),
	(74, 'MCLIHKZZ', 'Servicios de salud'),
	(75, 'MCLIAJCV', 'Enfermedades metabólicas'),
	(76, 'MCLIOCBV', 'Enfermedades cardiovasculares'),
	(77, 'MCLICFDU', 'Cáncer'),
	(78, 'MCLIQUEG', 'Enfermedades infecciosas'),
	(79, 'MCLIAVLC', 'Neurología'),
	(80, 'MCLIATZZ', 'Psiquiatría'),
	(81, 'MCLIJMIG', 'Miscelánea'),
	(82, 'BVAEKWEQ', 'Ecología Marina y de aguas epicontinentales'),
	(83, 'BVAEWIUP', 'Microbiología'),
	(84, 'BVAEDXOG', 'Evolución y sistemática de plantas'),
	(85, 'BVAECCHO', 'Conservación'),
	(86, 'BVAERFRT', 'Ecología terrestre'),
	(87, 'BVAEBRJA', 'Fisiología y ecofisiología vegetal'),
	(88, 'BVAEZYWJ', 'Evolución y aistemática de animales'),
	(89, 'AGRHNLP', 'Interacción sueloaguaplanta'),
	(90, 'AGRKRTE', 'Nutrición vegetal'),
	(91, 'AGREFKN', 'Estrés abiótico'),
	(92, 'AGRNVAQ', 'Fitopatología'),
	(93, 'AGRWKNV', 'Entomología agrícola'),
	(94, 'AGRUOOC', 'Malherbología'),
	(95, 'AGROJTJ', 'Mejora genética'),
	(96, 'AGRJPEG', 'Recursos fitogenéticos'),
	(97, 'AGRJEYZ', 'Fisiología vegetal'),
	(98, 'AGRBOQD', 'Biotecnología vegetal'),
	(99, 'AGRBRWH', 'Sistemas agroforestales'),
	(100, 'AGRCDRW', 'Economía agraria'),
	(101, 'TAIQCW', 'Metabolismo'),
	(102, 'TARGLN', 'Nutrición'),
	(103, 'TAZTFO', 'Técnicas analíticas avanzadas'),
	(104, 'TAXUTG', 'Química de macromoléculas biológicas'),
	(105, 'TAZNAF', 'Seguridad de alimentos'),
	(106, 'TAQWPT', 'Alimentos Funcionales'),
	(107, 'TAJBDF', 'Propiedades antioxidantes e implicaciones para la salud'),
	(108, 'TARXAC', 'Análisis en sistemas biológicos'),
	(109, 'TALTMP', 'Microbiología de alimentos'),
	(110, 'TAWWAF', 'Procesos tecnológicos'),
	(111, 'TAQBOK', 'Nuevas tecnologías de conservación'),
	(112, 'TAJPQB', 'Caracterización bioquímica y molecular de sistemas enzimáticos implicados'),
	(113, 'TACCRW', 'Metodologías analíticas para la evaluación'),
	(114, 'TAIXJG', 'Tecnología postcosecha'),
	(115, 'GANACUI', 'Producción acuícola'),
	(116, 'GANSAAN', 'Sanidad animal'),
	(117, 'GANPRAN', 'Producción animal'),
	(118, 'GANGENE', 'Genética'),
	(119, 'GANREPR', 'Reproducción'),
	(120, 'GANSAAC', 'Sanidad acuícola'),
	(121, 'TMCXAR', 'Polimerización en medio disperso'),
	(122, 'TMMFMH', 'Síntesis'),
	(123, 'TMLEBF', 'Caracterización y modelización de coloides poliméricos útiles en aplicaciones biomédicas'),
	(124, 'TMDLMX', 'Materiales magnéticos'),
	(125, 'TMOPTX', 'Aleaciones magnéticas amorfas nanoestructuradas y cristalinas'),
	(126, 'TMVMIZ', 'Aleaciones magnéticas con memoria de forma'),
	(127, 'TMGOJR', 'Magnetotransporte'),
	(128, 'TMXTYI', 'Magnetoimpedancia'),
	(129, 'TMBMLL', 'Magnetorresistencia'),
	(130, 'TMLBOZ', 'Efecto magneto calorífico'),
	(131, 'TMLYAB', 'Sensores magnéticos'),
	(132, 'TMEJHR', 'Química de estado sólido'),
	(133, 'TMJGYH', 'Materiales para la energía pilas baterías catálisis'),
	(134, 'TMRXBI', 'Materiales eléctricos'),
	(135, 'TMNZVI', 'Materiales de construcción caracterización preparación y aplicaciones'),
	(136, 'TMSPDC', 'Conglomerantes'),
	(137, 'TMGYWL', 'Durabilidad'),
	(138, 'TMLLRG', 'Sostenibilidad'),
	(139, 'TMHYCX', 'Reutilización de residuos'),
	(140, 'TMGGGH', 'Tecnología de la construcción'),
	(141, 'INFTVZH', 'Ingeniería del software bases de datos y seguridad'),
	(142, 'INFJJJL', 'Arquitectura de computadores y sistemas distribuidos'),
	(143, 'INFLRHQ', 'Sistemas inteligentes'),
	(144, 'INFFGLL', 'Computación de altas prestaciones y procesamiento de imagen'),
	(145, 'INFUEOL', 'Ciencias de la computación'),
	(146, 'ICIZGCB', 'Estructuras y construcción'),
	(147, 'ICIYABY', 'Arquitectura edificación y urbanismo'),
	(148, 'ICIGKMN', 'Hidráulica y medio ambiente'),
	(149, 'ICITSLH', 'Transportes e ingeniería marítima'),
	(150, 'IELUFPA', 'Automática'),
	(151, 'IELABIK', 'Ingeniería eléctrica'),
	(152, 'IELFYAZ', 'Dispositivos electrónicos'),
	(153, 'IELKYCH', 'Circuitos y microelectrónica'),
	(154, 'IMEVFCW', 'Mecánica Estructural'),
	(155, 'IMEBNGD', 'Modelado de materiales'),
	(156, 'IMEVOYV', 'Biomecánica'),
	(157, 'IMEULZJ', 'Mecánica computacional'),
	(158, 'IMERHBN', 'Energía'),
	(159, 'IMENJJP', 'Almacenamiento de energía térmica'),
	(160, 'IMEKMRB', 'Optimización energética'),
	(161, 'IMEYZYQ', 'Fabricación'),
	(162, 'IMETAAL', 'Conformado plástico'),
	(163, 'IMEFCFZ', 'Conformado de chapa'),
	(164, 'IMEMFIU', 'Fractura y fatiga bajo gradientes de tensión'),
	(165, 'IMELLXE', 'Crecimiento de grietas pequeñas por fatiga'),
	(166, 'IMEZMGL', 'Máquinas y mecanismos'),
	(167, 'IMEAJPB', 'Mecánica de la fractura computacional'),
	(168, 'IMEUUZS', 'Método de los elementos finitos'),
	(169, 'TQNOAM', 'Preparación y aplicación de adsorbentes y catalizadores'),
	(170, 'TQLWBZ', 'Aprovechamiento de residuos biomásicos'),
	(171, 'TQZSDH', 'Procesos biotecnológicos'),
	(172, 'TQTSNT', 'Remediación ambiental'),
	(173, 'TQVCWF', 'Gestión sostenible de energía'),
	(174, 'TQEFHK', 'Procesos avanzados de separación'),
	(175, 'TQNGFA', 'Tecnologías medioambientales'),
	(176, 'COMELE', 'Electrónica'),
	(177, 'COMTEF', 'Tecnología fotónica y comunicaciones ópticas'),
	(178, 'COMRAD', 'Radiofrecuencia y microondas'),
	(179, 'COMTEL', 'Telemática'),
	(180, 'COMPSE', 'Procesado de señal'),
	(181, 'EDUCPED', 'Pedagogía'),
	(182, 'EDUCDID', 'Didáctica'),
	(183, 'EDUCPSI', 'Psicología de la educación'),
	(184, 'CSSOCIO', 'Sociología'),
	(185, 'CSINSOC', 'Técnicas de la investigación social'),
	(186, 'CSCIEPO', 'Ciencia política y de la administración'),
	(187, 'CSPERIO', 'Periodismo'),
	(188, 'CSCOMAU', 'Comunicación audiovisual'),
	(189, 'CSPUBLI', 'Publicidad'),
	(190, 'CSGEOHU', 'Geografía humana'),
	(191, 'DERYPLQ', 'Derecho Administrativo'),
	(192, 'DERNWIA', 'Derecho Civil'),
	(193, 'DERPMSM', 'Derecho Constitucional'),
	(194, 'DERYOFT', 'Derecho Eclesiástico del Estado'),
	(195, 'DERGSEW', 'Derecho internacional Privado'),
	(196, 'DEREKCS', 'Derecho internacional Público y relaciones Internacionales'),
	(197, 'DERYVFI', 'Filosofía del Derecho'),
	(198, 'DERSCYV', 'Derecho Financiero y Tributario'),
	(199, 'DERUEGR', 'Historia del Derecho'),
	(200, 'DERDDMT', 'Derecho Mercantil'),
	(201, 'DERFLRV', 'Derecho Penal'),
	(202, 'DERRWSM', 'Derecho Procesal Civil'),
	(203, 'DERMBAJ', 'Derecho Procesal Penal'),
	(204, 'DERFOUR', 'Derecho Romano'),
	(205, 'DEROJKG', 'Derecho del Trabajo y de la Seguridad Social'),
	(206, 'DERACSG', 'Derecho de la Unión Europea'),
	(207, 'ECOGSEU', 'Economía Aplicada'),
	(208, 'ECOQHBM', 'Microeconometría'),
	(209, 'ECOSYDT', 'Economía Laboral'),
	(210, 'ECONTOY', 'Economía de las familias'),
	(211, 'ECOYQEF', 'Organización de empresas'),
	(212, 'ECOTEPI', 'Gobierno Corporativo'),
	(213, 'ECORVII', 'Aplicaciones a banca y servicios'),
	(214, 'ECOJHGE', 'Economía d las organizaciones'),
	(215, 'ECONKAC', 'Regulación competencia y comportamiento empresarial'),
	(216, 'ECOZXVK', 'Responsabilidad social Corporativa'),
	(217, 'ECOAUZZ', 'Fundamentos del Análisis Económico'),
	(218, 'ECODOGZ', 'Teoría Económica'),
	(219, 'ECODWRX', 'Economía matemática'),
	(220, 'ECOGZIH', 'Economía de la Información'),
	(221, 'ECOGMUV', 'Teoría de Juegos'),
	(222, 'ECOKBHJ', 'Economía industrial'),
	(223, 'ECOKEFK', 'Macroeconomía'),
	(224, 'ECOKORE', 'Economía Internacional'),
	(225, 'ECOOQIO', 'Finanzas Empíricas'),
	(226, 'FFIFVXB', 'Lengua española'),
	(227, 'FFINDJT', 'Filología románica'),
	(228, 'FFIMDLD', 'Lenguas y culturas contemporáneas'),
	(229, 'FFIKECX', 'Lenguas y culturas del próximo oriente antiguo'),
	(230, 'FFITTZF', 'Lenguas y escrituras paleohispánicas'),
	(231, 'FFIHNBB', 'Estudios hebreos y arameos y estudios árabes e islámicos'),
	(232, 'FFIMWDQ', 'Filología latina filología griega y lingüística indoeuropea'),
	(233, 'FFIEFSO', 'Lingüística general'),
	(234, 'FFIEVYV', 'Filología aplicada'),
	(235, 'FFIMVGE', 'Traducción e interpretación'),
	(236, 'FFIYJTK', 'Estudios culturales y teorías culturales'),
	(237, 'FFIRKXR', 'Literatura'),
	(238, 'FFIYMLQ', 'Teoría de la literatura'),
	(239, 'FFIQIYR', 'Literatura comparada'),
	(240, 'FFIVVEM', 'Estudios de género'),
	(241, 'FFIVCZF', 'Estética'),
	(242, 'FFIVNPK', 'Ética y filosofía política'),
	(243, 'FFIURLV', 'Lógica y filosofía de la ciencia'),
	(244, 'FFIVVJH', 'Metafísica y teoría del conocimiento'),
	(245, 'HAZQGB', 'Arte'),
	(246, 'HAYSVE', 'Arqueología'),
	(247, 'HALMCG', 'Historia antigua'),
	(248, 'HAMOXL', 'Historia medieval'),
	(249, 'HAYOHM', 'Historia moderna'),
	(250, 'HAQJKH', 'Historia contemporánea'),
	(251, 'HAQGZR', 'Prehistoria'),
	(252, 'PSJTFX', 'Personalidad evaluación y tratamientos psicológicos'),
	(253, 'PSAZSJ', 'Psicología evolutiva y de la educación'),
	(254, 'PSNRWD', 'Psicología básica'),
	(255, 'PSDSJH', 'Psicología social'),
	(256, 'PSFRSQ', 'Psicobiología'),
	(257, 'PSBODX', 'Metodología');
/*!40000 ALTER TABLE `ScientificDomains` ENABLE KEYS */;

-- Volcando estructura para tabla master.SubjectAreas
CREATE TABLE IF NOT EXISTS `SubjectAreas` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla master.SubjectAreas: ~54 rows (aproximadamente)
/*!40000 ALTER TABLE `SubjectAreas` DISABLE KEYS */;
INSERT INTO `SubjectAreas` (`id`, `code`, `name`) VALUES
	(1, 'IQM', 'Ingeniería química'),
	(2, 'QMC', 'Química'),
	(3, 'ENE', 'Energía'),
	(4, 'TRA', 'Transporte'),
	(5, 'AYA', 'Astronomía y astrofísica'),
	(6, 'ESP', 'Investigación espacial'),
	(7, 'FFP', 'Física fundamental y de partículas'),
	(8, 'FYA', 'Física y sus aplicaciones'),
	(9, 'MBM', 'Materiales para biomedicina'),
	(10, 'MEN', 'Materiales para la energía y el medioambiente'),
	(11, 'MES', 'Materiales estructurales'),
	(12, 'MFU', 'Materiales con funcionalidad eléctrica magnética óptica o térmica'),
	(13, 'MT3', 'Ciencias matemáticas'),
	(14, 'IBI', 'Ingeniería biomédica'),
	(15, 'ICA', 'Ingeniería civil y arquitectura'),
	(16, 'IEA', 'Ingeniería eléctrica electrónica y automática'),
	(17, 'INA', 'Ingeniería mecánica naval y aeronáutica'),
	(18, 'INF', 'Ciencias de la computación y tecnología informática'),
	(19, 'MNF', 'Microelectrónica nanotecnología y fotónica'),
	(20, 'TCO', 'Tecnologías de las comunicaciones'),
	(21, 'COM', 'Comunicación'),
	(22, 'CPO', 'Ciencia política'),
	(23, 'FEM', 'Estudios feministas de las mujeres y de género'),
	(24, 'GEO', 'Geografía'),
	(25, 'SOC', 'Sociología y antropología social'),
	(26, 'DE3', 'Derecho'),
	(27, 'EYA', 'Economía y sus aplicaciones'),
	(28, 'EYF', 'Empresas y finanzas'),
	(29, 'MAE', 'Métodos de análisis económico'),
	(30, 'ED3', 'Ciencias de la educación'),
	(31, 'ART', 'Arte bellas artes museística'),
	(32, 'LFL', 'Literatura filología lenguas y culturas antiguas y estudios culturales'),
	(33, 'FIL', 'Filosofía'),
	(34, 'LYL', 'Lingüística y lenguas'),
	(35, 'ARQ', 'Arqueología'),
	(36, 'HIS', 'Historia'),
	(37, 'PS3', 'Psicología'),
	(38, 'BIF', 'Biología integrativa y fisiología'),
	(39, 'BMC', 'Biología molecular y celular'),
	(40, 'BTC', 'Biotecnología'),
	(41, 'CAN', 'Cáncer'),
	(42, 'DPT', 'Herramientas diagnósticas pronósticas y terapéuticas'),
	(43, 'ESN', 'Enfermedades del sistema nervioso'),
	(44, 'FOS', 'Fisiopatología de órganos y sistemas'),
	(45, 'IIT', 'Inmunidad infección y nuevas terapias'),
	(46, 'ALI', 'Ciencias y tecnologías de alimentos'),
	(47, 'AYF', 'Agricultura y forestal'),
	(48, 'GYA', 'Ganadería y acuicultura'),
	(49, 'BDV', 'Biodiversidad'),
	(50, 'CTA', 'Ciencias de la Tierra y del agua'),
	(51, 'CYA', 'Clima y atmósfera'),
	(52, 'MAR', 'Ciencias y tecnologías marinas'),
	(53, 'POL', 'Investigación polar'),
	(54, 'TMA', 'Tecnologías medioambientales');
/*!40000 ALTER TABLE `SubjectAreas` ENABLE KEYS */;

-- Volcando estructura para tabla master.Universities
CREATE TABLE IF NOT EXISTS `Universities` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla master.Universities: ~76 rows (aproximadamente)
/*!40000 ALTER TABLE `Universities` DISABLE KEYS */;
INSERT INTO `Universities` (`id`, `code`, `name`) VALUES
	(1, 'UA', 'Universidad de Alicante'),
	(2, 'UEX', 'Universidad de Extremadura'),
	(3, 'UIB', 'Universitat de les Illes Balears'),
	(4, 'UBA', 'Universidad de Barcelona'),
	(5, 'UCA', 'Universidad de Cádiz'),
	(6, 'UCO', 'Universidad de Córdoba'),
	(7, 'USC', 'Universidad de Santiago de Compostela'),
	(8, 'UGR', 'Universidad de Granada'),
	(9, 'ULE', 'Universidad de León'),
	(10, 'UCM', 'Universidad Complutense de Madrid'),
	(11, 'UMA', 'Universidad de Málaga'),
	(12, 'UMU', 'Universidad de Murcia'),
	(13, 'UOV', 'Universidad de Oviedo'),
	(14, 'USAL', 'Universidad de Salamanca'),
	(15, 'ULL', 'Universidad de La Laguna'),
	(16, 'UCN', 'Universidad de Cantabria'),
	(17, 'USE', 'Universidad de Sevilla'),
	(18, 'UV', 'Universitat de València'),
	(19, 'UVA', 'Universidad de Valladolid'),
	(20, 'UPV/EHU', 'Universidad del País Vasco'),
	(21, 'UZA', 'Universidad de Zaragoza'),
	(22, 'UAB', 'Universidad Autónoma de Barcelona'),
	(23, 'UAM', 'Universidad Autónoma de Madrid'),
	(24, 'UPC', 'Universidad Politécnica de Cataluña'),
	(25, 'UPM', 'Universidad Politécnica de Madrid'),
	(26, 'UPGC', 'Universidad de Las Palmas de Gran Canaria'),
	(27, 'UPV', 'Universidad Politécnica de Valéncia'),
	(28, 'UNED', 'Universidad Nacional de Educación a Distancia'),
	(29, 'UAH', 'Universidad de Alcalá'),
	(30, 'UDE', 'Universidad de Deusto'),
	(31, 'UN', 'Universidad de Navarra'),
	(32, 'UPSA', 'Universidad Pontificia de Salamanca'),
	(33, 'COMILLAS', 'Universidad Pontificia Comillas'),
	(34, 'UCLM', 'Universidad de CastillaLa Mancha'),
	(35, 'UPNA', 'Universidad Pública de Navarra'),
	(36, 'UCAR', 'Universidad Carlos III de Madrid'),
	(37, 'UDC', 'Universidad de A Coruña'),
	(38, 'UVI', 'Universidade de Vigo'),
	(39, 'UPF', 'Universidad Pompeu Fabra'),
	(40, 'UJI', 'Universitat Jaume I de Castellón'),
	(41, 'URLL', 'Universidad Ramón Llull'),
	(42, 'URV', 'Universidad Rovira i Virgili'),
	(43, 'UDG', 'Universidad de Girona'),
	(44, 'UDL', 'Universitat de Lleida'),
	(45, 'UR', 'Universidad de La Rioja'),
	(46, 'UCEU', 'Universidad San Pablo  CEU'),
	(47, 'UAX', 'Universidad Alfonso X El Sabio'),
	(48, 'UAL', 'Universidad de Almería'),
	(49, 'UHU', 'Universidad de Huelva'),
	(50, 'UJA', 'Universidad de Jaén'),
	(51, 'UBU', 'Universidad de Burgos'),
	(52, 'UANE', 'Universidad Antonio de Nebrija'),
	(53, 'UEM', 'Universidad Europea de Madrid'),
	(54, 'UOC', 'Universitat Oberta de Catalunya'),
	(55, 'UMH', 'Universidad Miguel Hernández de Elche'),
	(56, 'URJC', 'Universidad Rey Juan Carlos'),
	(57, 'IE', 'IE Instituto de Empresa Universidad'),
	(58, 'UPO', 'Universidad Pablo de Olavide'),
	(59, 'UCAV', 'Universidad Católica Santa Teresa de Jesús de Ávila'),
	(60, 'UVIC', 'Universidad de VicUniversidad Central de Cataluña'),
	(61, 'UMON', 'Universidad Mondragon Unibertsitatea'),
	(62, 'UIC', 'Universidad Internacional de Cataluña'),
	(63, 'UNIA', 'Universidad Internacional de Andalucía'),
	(64, 'UPCT', 'Universidad Politécnica de Cartagena'),
	(65, 'UCJC', 'Universidad Camilo José Cela'),
	(66, 'UCAM', 'Universidad Católica San Antonio de Murcia'),
	(67, 'UCH', 'Universidad Cardenal HerreraCEU'),
	(68, 'UFV', 'Universidad Francisco de Vitoria'),
	(69, 'UEMC', 'Universidad Europea Miguel de Cervantes'),
	(70, 'UAO', 'Universitat Abat Oliba CEU'),
	(71, 'UIMP', 'Universidad Internacional Menéndez Pelayo'),
	(72, 'UCV', 'Universidad Católica de Valencia San Vicente Mártir'),
	(73, 'USJ', 'Universidad San Jorge'),
	(74, 'UDIMA', 'Universidad a Distancia de Madrid'),
	(80, 'UII', 'Universidad Internacional Isabel I de Castilla'),
	(82, 'UEV', 'Universidad Europea de Valencia');
/*!40000 ALTER TABLE `Universities` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;