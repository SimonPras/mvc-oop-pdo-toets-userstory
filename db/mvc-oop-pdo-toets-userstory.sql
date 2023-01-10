-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 10 jan 2023 om 16:46
-- Serverversie: 5.7.31
-- PHP-versie: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvc-oop-pdo-toets-userstory`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `auto`
--

DROP TABLE IF EXISTS `auto`;
CREATE TABLE IF NOT EXISTS `auto` (
  `Id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(255) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `InstucteurId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `InstucteurId` (`InstucteurId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `auto`
--

INSERT INTO `auto` (`Id`, `Kenteken`, `Type`, `InstucteurId`) VALUES
(1, 'AU-67-IO', 'Golf', 3),
(2, 'TH-78-KL', 'Ferrari', 2),
(3, '90-KL-TR', 'Fiat 500', 4),
(4, 'YY-OP-78', 'Mercedes', 5);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `instructeur`
--

DROP TABLE IF EXISTS `instructeur`;
CREATE TABLE IF NOT EXISTS `instructeur` (
  `Id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) NOT NULL,
  `Naam` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `instructeur`
--

INSERT INTO `instructeur` (`Id`, `Email`, `Naam`) VALUES
(1, 'groen@gmail.com', 'Groen'),
(2, 'manhoi@gmail.com', 'Manhoi'),
(3, 'zoyi@gmail.com', 'Zoyi'),
(4, 'berthold@gmail.com', 'Berthold'),
(5, 'denekamp@gmail.com', 'Denekamp');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `mankement`
--

DROP TABLE IF EXISTS `mankement`;
CREATE TABLE IF NOT EXISTS `mankement` (
  `Id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Datum` datetime NOT NULL,
  `AutoId` smallint(5) UNSIGNED NOT NULL,
  `Mankement` varchar(40) NOT NULL,
  `niets` smallint(5) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Les_InstructeurId_Instructeur_Id` (`niets`),
  KEY `FK_Les_LeerlingId_Leerling_Id` (`AutoId`),
  KEY `niets` (`niets`),
  KEY `niets_2` (`niets`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `mankement`
--

INSERT INTO `mankement` (`Id`, `Datum`, `AutoId`, `Mankement`, `niets`) VALUES
(1, '2023-01-04 00:00:00', 4, 'Profiel rechterband minder dan 2 mm', 1),
(2, '2023-01-02 00:00:00', 2, 'Rechter achterlicht kapot', 3),
(3, '2023-01-02 00:00:00', 1, 'Spiegel links afgebroken', 2),
(4, '2023-01-06 00:00:00', 2, 'Bumper rechtsachter ingedeukt', 3),
(5, '2023-01-08 00:00:00', 2, 'Radio kapot', 1);

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `mankement`
--
ALTER TABLE `mankement`
  ADD CONSTRAINT `FK_Les_InstructeurId_Instructeur_Id` FOREIGN KEY (`niets`) REFERENCES `instructeur` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Les_LeerlingId_Leerling_Id` FOREIGN KEY (`AutoId`) REFERENCES `auto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
