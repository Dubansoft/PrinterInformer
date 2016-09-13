-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.13 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para printerqueuehistory
CREATE DATABASE IF NOT EXISTS `printerqueuehistory` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `printerqueuehistory`;


-- Volcando estructura para tabla printerqueuehistory.novedades
CREATE TABLE IF NOT EXISTS `novedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computer` varchar(50) NOT NULL DEFAULT '0',
  `userName` varchar(50) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '0',
  `defaultPrinter` varchar(50) NOT NULL DEFAULT '0',
  `availablePrinters` varchar(100) NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla printerqueuehistory.novedades: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `novedades` DISABLE KEYS */;
INSERT INTO `novedades` (`id`, `computer`, `userName`, `ip`, `defaultPrinter`, `availablePrinters`, `date`) VALUES
	(229, 'DUBANSOFT-PC', 'Dubansoft-PC\\Dubansoft', '192.168.1.6', 'Send To OneNote 2016', 'Send To OneNote 2016, Microsoft XPS Document Writer, Microsoft Print to PDF, Fax', '2016-06-22 22:12:57'),
	(230, 'DUBANSOFT-PC', 'Dubansoft-PC\\Dubansoft', '192.168.1.6', 'Send To OneNote 2016', 'Send To OneNote 2016, Microsoft XPS Document Writer, Microsoft Print to PDF, Fax', '2016-06-22 22:13:29'),
	(231, 'DUBANSOFT-PC', 'Dubansoft-PC\\Dubansoft', '192.168.1.6', 'Send To OneNote 2016', 'Send To OneNote 2016, Microsoft XPS Document Writer, Microsoft Print to PDF, Fax', '2016-06-22 22:14:28'),
	(232, 'DUBANSOFT-PC', 'Dubansoft-PC\\Dubansoft', '192.168.1.6', 'Send To OneNote 2016', 'Send To OneNote 2016, Microsoft XPS Document Writer, Microsoft Print to PDF, Fax', '2016-06-22 22:15:56'),
	(233, '', '', '', '', '', '2016-06-23 05:40:44'),
	(234, 'DUBANSOFT-PC', 'Dubansoft-PC\\Dubansoft', '192.168.1.6', 'Send To OneNote 2016', 'Send To OneNote 2016, Microsoft XPS Document Writer, Microsoft Print to PDF, Fax', '2016-06-23 05:41:26'),
	(235, 'DUBANSOFT-PC', 'Dubansoft-PC\\Dubansoft', '192.168.1.6', 'Send To OneNote 2016', 'Send To OneNote 2016, Microsoft XPS Document Writer, Microsoft Print to PDF, Fax', '2016-06-23 05:44:38'),
	(236, 'DUBANSOFT-PC', 'Dubansoft-PC\\Dubansoft', '192.168.1.6', 'Send To OneNote 2016', 'Send To OneNote 2016, Microsoft XPS Document Writer, Microsoft Print to PDF, Fax', '2016-06-23 05:45:01'),
	(237, 'DUBANSOFT-PC', 'Dubansoft-PC\\Dubansoft', '192.168.1.6', 'Send To OneNote 2016', 'Send To OneNote 2016, Microsoft XPS Document Writer, Microsoft Print to PDF, Fax', '2016-06-23 05:45:15'),
	(238, 'DUBANSOFT-PC', 'Dubansoft-PC\\Dubansoft', '192.168.1.6', 'Send To OneNote 2016', 'Send To OneNote 2016, Microsoft XPS Document Writer, Microsoft Print to PDF, Fax', '2016-06-23 05:45:49'),
	(239, 'DUBANSOFT-PC', 'Dubansoft-PC\\Dubansoft', '192.168.1.6', 'OUT', 'OUT, Send To OneNote 2016, Microsoft XPS Document Writer, Microsoft Print to PDF, Fax', '2016-06-23 05:49:01');
/*!40000 ALTER TABLE `novedades` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
