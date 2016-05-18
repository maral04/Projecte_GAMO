-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.9 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.5072
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for gamodb
CREATE DATABASE IF NOT EXISTS `gamodb` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `gamodb`;

-- Dumping structure for table gamodb.administrador
CREATE TABLE IF NOT EXISTS `administrador` (
  `PK_Id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  `contrasenya` varchar(25) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  `email` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`PK_Id`),
  UNIQUE KEY `contrassenya` (`contrasenya`),
  UNIQUE KEY `Email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.camp
CREATE TABLE IF NOT EXISTS `camp` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `tipus` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `opcions` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.camp_prova
CREATE TABLE IF NOT EXISTS `camp_prova` (
  `id_prova` int(11) DEFAULT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_camp` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_id_prova` (`id_prova`),
  KEY `FK_id_camp` (`id_camp`),
  CONSTRAINT `FK_id_camp` FOREIGN KEY (`id_camp`) REFERENCES `camp` (`Id`),
  CONSTRAINT `FK_id_prova` FOREIGN KEY (`id_prova`) REFERENCES `prova` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.club
CREATE TABLE IF NOT EXISTS `club` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.colavorador
CREATE TABLE IF NOT EXISTS `colavorador` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FK_id_usuari` int(11) NOT NULL DEFAULT '0',
  `FK_id_prova` int(11) NOT NULL DEFAULT '0',
  `FK_id_event` int(11) NOT NULL DEFAULT '0',
  `FK_id_organitzacio` varchar(9) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  `Observacions` text COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Fk_IdUsuari` (`FK_id_usuari`),
  KEY `Fk_IdProva` (`FK_id_prova`),
  KEY `Fk_IdEvent` (`FK_id_event`),
  KEY `FK_idOrganitzacio` (`FK_id_organitzacio`),
  CONSTRAINT `FK_idOrganitzacio` FOREIGN KEY (`FK_id_organitzacio`) REFERENCES `organitzador` (`dni`),
  CONSTRAINT `Fk_IdEvent` FOREIGN KEY (`FK_id_event`) REFERENCES `event` (`Id`),
  CONSTRAINT `Fk_IdProva` FOREIGN KEY (`FK_id_prova`) REFERENCES `prova` (`Id`),
  CONSTRAINT `Fk_IdUsuari` FOREIGN KEY (`FK_id_usuari`) REFERENCES `usuari` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.esport
CREATE TABLE IF NOT EXISTS `esport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.event
CREATE TABLE IF NOT EXISTS `event` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Id_Organitzador` varchar(9) COLLATE latin1_spanish_ci NOT NULL,
  `titol` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `dataInici` datetime NOT NULL,
  `dataFinal` datetime NOT NULL,
  `descripcio` text COLLATE latin1_spanish_ci NOT NULL,
  `validated` int(1) NOT NULL,
  `FK_id_localitzacio` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Id_Organitzador` (`FK_Id_Organitzador`),
  KEY `FK_id_local` (`FK_id_localitzacio`),
  CONSTRAINT `FK_Id_Organitzador` FOREIGN KEY (`FK_Id_Organitzador`) REFERENCES `organitzador` (`dni`),
  CONSTRAINT `FK_id_local` FOREIGN KEY (`FK_id_localitzacio`) REFERENCES `localitzacio` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.inscripcio
CREATE TABLE IF NOT EXISTS `inscripcio` (
  `Idinscripcio` int(11) NOT NULL AUTO_INCREMENT,
  `FK_id_prova` int(11) NOT NULL,
  `id_participant` int(11) NOT NULL,
  `data_hora` datetime NOT NULL,
  PRIMARY KEY (`Idinscripcio`),
  KEY `FK_prova` (`FK_id_prova`),
  KEY `FK_participant` (`id_participant`),
  CONSTRAINT `FK_participant` FOREIGN KEY (`id_participant`) REFERENCES `participant` (`FK_Id_Usuari`),
  CONSTRAINT `FK_prova` FOREIGN KEY (`FK_id_prova`) REFERENCES `prova` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.inscripcio_camp
CREATE TABLE IF NOT EXISTS `inscripcio_camp` (
  `FK_id_camp` int(11) NOT NULL,
  `FK_id_inscripcio` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  KEY `FK_camp` (`FK_id_camp`),
  KEY `FKIns` (`FK_id_inscripcio`),
  CONSTRAINT `FKIns` FOREIGN KEY (`FK_id_inscripcio`) REFERENCES `inscripcio` (`Idinscripcio`),
  CONSTRAINT `FK_camp` FOREIGN KEY (`FK_id_camp`) REFERENCES `camp` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.localitzacio
CREATE TABLE IF NOT EXISTS `localitzacio` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `cp` int(11) NOT NULL DEFAULT '0',
  `estat` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  `regio` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  `poblacio` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  `direccio` varchar(50) COLLATE latin1_spanish_ci DEFAULT '0',
  `coordenades` varchar(11) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.noticia
CREATE TABLE IF NOT EXISTS `noticia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titol` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `dataCeracio` datetime NOT NULL,
  `FK_dataProva_Prova` datetime NOT NULL,
  `text` text COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dataProva_Prova` (`FK_dataProva_Prova`),
  CONSTRAINT `FK_dataProva_Prova` FOREIGN KEY (`FK_dataProva_Prova`) REFERENCES `prova` (`data_hora_inici`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.organitzador
CREATE TABLE IF NOT EXISTS `organitzador` (
  `dni` varchar(9) COLLATE latin1_spanish_ci NOT NULL,
  `valoracio` float NOT NULL,
  `trusty` varbinary(5) NOT NULL,
  `FK_IdUsuari_Usuari` int(11) NOT NULL,
  `FK_IdEvent_Event` varchar(9) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `FK_IdUsuari_Usuari` (`FK_IdUsuari_Usuari`),
  CONSTRAINT `FK_IdUsuari_Usuari` FOREIGN KEY (`FK_IdUsuari_Usuari`) REFERENCES `usuari` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.participant
CREATE TABLE IF NOT EXISTS `participant` (
  `dni` varchar(9) COLLATE latin1_spanish_ci NOT NULL,
  `FK_Id_Usuari` int(11) NOT NULL,
  `numFederat` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`FK_Id_Usuari`),
  CONSTRAINT `FK_Id_Usuari` FOREIGN KEY (`FK_Id_Usuari`) REFERENCES `usuari` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.prova
CREATE TABLE IF NOT EXISTS `prova` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Id_event` int(11) NOT NULL DEFAULT '0',
  `FK_Id_esport` int(11) NOT NULL DEFAULT '0',
  `FK_Id_Localitzacio` int(11) NOT NULL DEFAULT '0',
  `FK_IdValoracio_Valoracio` int(11) NOT NULL DEFAULT '0',
  `preu` double NOT NULL DEFAULT '0',
  `distancia` int(11) NOT NULL DEFAULT '0',
  `desnivellPositiu` int(11) NOT NULL DEFAULT '0',
  `desnivellNegatiu` int(11) NOT NULL DEFAULT '0',
  `desnivellAcumulat` int(11) NOT NULL DEFAULT '0',
  `num_avituallaments` int(11) unsigned NOT NULL,
  `nom` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `modalitat` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `recorregut` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Imatges` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `pagina_organitzacio` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `validated` double NOT NULL DEFAULT '0',
  `descripcio` text COLLATE latin1_spanish_ci NOT NULL,
  `data_hora_inici` datetime NOT NULL,
  `obertura_inscripcions` datetime NOT NULL,
  `tancament_inscripcionts` datetime NOT NULL,
  `limit_inscripcio` datetime NOT NULL,
  `temps_limit` double NOT NULL,
  `limit_inscrits` int(11) NOT NULL,
  `coordenades` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Id_Localitzacio_Prova` (`FK_Id_Localitzacio`),
  KEY `FKFK_IdValoracio_Valoracio` (`FK_IdValoracio_Valoracio`),
  KEY `FK_Id_esport` (`FK_Id_esport`),
  KEY `Data_hora_inici` (`data_hora_inici`),
  CONSTRAINT `FKFK_IdValoracio_Valoracio` FOREIGN KEY (`FK_IdValoracio_Valoracio`) REFERENCES `valoracio` (`Id`),
  CONSTRAINT `FK_Id_Localitzacio_Prova` FOREIGN KEY (`FK_Id_Localitzacio`) REFERENCES `localitzacio` (`Id`),
  CONSTRAINT `FK_Id_esport` FOREIGN KEY (`FK_Id_esport`) REFERENCES `esport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.tasca
CREATE TABLE IF NOT EXISTS `tasca` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FK_id_colavorador` int(11) NOT NULL DEFAULT '0',
  `descripcio` text COLLATE latin1_spanish_ci NOT NULL,
  `fet` varbinary(5) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Fk_id_colavorador` (`FK_id_colavorador`),
  CONSTRAINT `Fk_id_colavorador` FOREIGN KEY (`FK_id_colavorador`) REFERENCES `colavorador` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.usuari
CREATE TABLE IF NOT EXISTS `usuari` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Id_Esport` int(11) NOT NULL,
  `FK_Id_Localitzacio` int(11) NOT NULL DEFAULT '0',
  `Fk_id_Admin` int(11) NOT NULL DEFAULT '0',
  `FK_id_club` int(11) NOT NULL DEFAULT '0',
  `tel1` int(9) DEFAULT '0',
  `tel2` int(9) DEFAULT '0',
  `email` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `contrasenya` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `nom` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `cNom` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Id_Localitzacio` (`FK_Id_Localitzacio`),
  KEY `Fk_id_Admin` (`Fk_id_Admin`),
  KEY `Fk_id_Sport` (`FK_Id_Esport`),
  KEY `Fk_Id_Club` (`FK_id_club`),
  CONSTRAINT `FK_Id_Localitzacio` FOREIGN KEY (`FK_Id_Localitzacio`) REFERENCES `localitzacio` (`Id`),
  CONSTRAINT `Fk_Id_Club` FOREIGN KEY (`FK_id_club`) REFERENCES `club` (`Id`),
  CONSTRAINT `Fk_id_Admin` FOREIGN KEY (`Fk_id_Admin`) REFERENCES `administrador` (`PK_Id`),
  CONSTRAINT `Fk_id_Sport` FOREIGN KEY (`FK_Id_Esport`) REFERENCES `esport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
-- Dumping structure for table gamodb.valoracio
CREATE TABLE IF NOT EXISTS `valoracio` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL DEFAULT '0',
  `FK_idProva_Prova` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `FK_idProva_Prova` (`FK_idProva_Prova`),
  CONSTRAINT `FK_idProva_Prova` FOREIGN KEY (`FK_idProva_Prova`) REFERENCES `prova` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
