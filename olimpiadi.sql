-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Mag 06, 2023 alle 11:24
-- Versione del server: 8.0.26
-- Versione PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_dodoesercizzi`
--
CREATE DATABASE IF NOT EXISTS `my_dodoesercizzi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `my_dodoesercizzi`;

-- --------------------------------------------------------

--
-- Struttura della tabella `Atleti`
--

CREATE TABLE `Atleti` (
  `cod_tessera` int NOT NULL,
  `nome` char(20) DEFAULT NULL,
  `Cognome` char(30) DEFAULT NULL,
  `eta` int NOT NULL,
  `disciplina` char(30) DEFAULT NULL,
  `citta_fk` int NOT NULL,
  `istituto` char(30) NOT NULL,
  `gruppo` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Citta`
--

CREATE TABLE `Citta` (
  `id` int NOT NULL,
  `nome` char(20) NOT NULL,
  `nazione` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `CompetizioniGruppo`
--

CREATE TABLE `CompetizioniGruppo` (
  `squadra` char(30) NOT NULL,
  `citta` int NOT NULL,
  `sede_sportiva` char(30) NOT NULL,
  `ora` time NOT NULL,
  `giorno` date NOT NULL,
  `punteggio` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `CompetizioniSingole`
--

CREATE TABLE `CompetizioniSingole` (
  `atleta` int NOT NULL,
  `citta` int NOT NULL,
  `sede_sportiva` char(30) NOT NULL,
  `ora` time NOT NULL,
  `giorno` date NOT NULL,
  `punteggio` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Discipline`
--

CREATE TABLE `Discipline` (
  `nome` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `GareSingole`
--

CREATE TABLE `GareSingole` (
  `citta` int NOT NULL,
  `SedeSportiva` char(30) NOT NULL,
  `ora` time NOT NULL,
  `giorno` date NOT NULL,
  `fase` char(20) DEFAULT 'provinciale',
  `disciplina` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `GareSquadre`
--

CREATE TABLE `GareSquadre` (
  `citta` int NOT NULL,
  `SedeSportiva` char(30) NOT NULL,
  `ora` time NOT NULL,
  `giorno` date NOT NULL,
  `disciplina` char(30) DEFAULT NULL,
  `fase` char(20) DEFAULT 'provinciale'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Gruppi`
--

CREATE TABLE `Gruppi` (
  `nome` char(30) NOT NULL,
  `disciplina` char(30) NOT NULL,
  `eta_media` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Istituti`
--

CREATE TABLE `Istituti` (
  `citta` int NOT NULL,
  `nome` char(30) NOT NULL,
  `via` char(40) NOT NULL,
  `nCivico` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `SediSportive`
--

CREATE TABLE `SediSportive` (
  `citta` int NOT NULL,
  `nome` char(30) NOT NULL,
  `via` char(40) NOT NULL,
  `nCivico` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Atleti`
--
ALTER TABLE `Atleti`
  ADD PRIMARY KEY (`cod_tessera`),
  ADD KEY `citta_fk` (`citta_fk`,`istituto`),
  ADD KEY `disciplina` (`disciplina`),
  ADD KEY `gruppo` (`gruppo`);

--
-- Indici per le tabelle `Citta`
--
ALTER TABLE `Citta`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `CompetizioniGruppo`
--
ALTER TABLE `CompetizioniGruppo`
  ADD PRIMARY KEY (`squadra`,`citta`,`sede_sportiva`,`ora`,`giorno`),
  ADD KEY `citta` (`citta`,`sede_sportiva`,`ora`,`giorno`);

--
-- Indici per le tabelle `CompetizioniSingole`
--
ALTER TABLE `CompetizioniSingole`
  ADD PRIMARY KEY (`atleta`,`citta`,`sede_sportiva`,`ora`,`giorno`),
  ADD KEY `citta` (`citta`,`sede_sportiva`,`ora`,`giorno`);

--
-- Indici per le tabelle `Discipline`
--
ALTER TABLE `Discipline`
  ADD PRIMARY KEY (`nome`);

--
-- Indici per le tabelle `GareSingole`
--
ALTER TABLE `GareSingole`
  ADD PRIMARY KEY (`citta`,`SedeSportiva`,`ora`,`giorno`),
  ADD KEY `disciplina` (`disciplina`);

--
-- Indici per le tabelle `GareSquadre`
--
ALTER TABLE `GareSquadre`
  ADD PRIMARY KEY (`citta`,`SedeSportiva`,`ora`,`giorno`),
  ADD KEY `disciplina` (`disciplina`);

--
-- Indici per le tabelle `Gruppi`
--
ALTER TABLE `Gruppi`
  ADD PRIMARY KEY (`nome`),
  ADD KEY `disciplina` (`disciplina`);

--
-- Indici per le tabelle `Istituti`
--
ALTER TABLE `Istituti`
  ADD PRIMARY KEY (`citta`,`nome`);

--
-- Indici per le tabelle `SediSportive`
--
ALTER TABLE `SediSportive`
  ADD PRIMARY KEY (`citta`,`nome`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Atleti`
--
ALTER TABLE `Atleti`
  MODIFY `cod_tessera` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Citta`
--
ALTER TABLE `Citta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Atleti`
--
ALTER TABLE `Atleti`
  ADD CONSTRAINT `Atleti_ibfk_1` FOREIGN KEY (`citta_fk`,`istituto`) REFERENCES `Istituti` (`citta`, `nome`),
  ADD CONSTRAINT `Atleti_ibfk_2` FOREIGN KEY (`disciplina`) REFERENCES `Discipline` (`nome`),
  ADD CONSTRAINT `Atleti_ibfk_3` FOREIGN KEY (`gruppo`) REFERENCES `Gruppi` (`nome`);

--
-- Limiti per la tabella `CompetizioniGruppo`
--
ALTER TABLE `CompetizioniGruppo`
  ADD CONSTRAINT `CompetizioniGruppo_ibfk_1` FOREIGN KEY (`squadra`) REFERENCES `Gruppi` (`nome`),
  ADD CONSTRAINT `CompetizioniGruppo_ibfk_2` FOREIGN KEY (`citta`,`sede_sportiva`,`ora`,`giorno`) REFERENCES `GareSquadre` (`citta`, `SedeSportiva`, `ora`, `giorno`);

--
-- Limiti per la tabella `CompetizioniSingole`
--
ALTER TABLE `CompetizioniSingole`
  ADD CONSTRAINT `CompetizioniSingole_ibfk_1` FOREIGN KEY (`atleta`) REFERENCES `Atleti` (`cod_tessera`),
  ADD CONSTRAINT `CompetizioniSingole_ibfk_2` FOREIGN KEY (`citta`,`sede_sportiva`,`ora`,`giorno`) REFERENCES `GareSingole` (`citta`, `SedeSportiva`, `ora`, `giorno`);

--
-- Limiti per la tabella `GareSingole`
--
ALTER TABLE `GareSingole`
  ADD CONSTRAINT `GareSingole_ibfk_1` FOREIGN KEY (`citta`,`SedeSportiva`) REFERENCES `SediSportive` (`citta`, `nome`),
  ADD CONSTRAINT `GareSingole_ibfk_2` FOREIGN KEY (`disciplina`) REFERENCES `Discipline` (`nome`);

--
-- Limiti per la tabella `GareSquadre`
--
ALTER TABLE `GareSquadre`
  ADD CONSTRAINT `GareSquadre_ibfk_1` FOREIGN KEY (`citta`,`SedeSportiva`) REFERENCES `SediSportive` (`citta`, `nome`),
  ADD CONSTRAINT `GareSquadre_ibfk_2` FOREIGN KEY (`disciplina`) REFERENCES `Discipline` (`nome`);

--
-- Limiti per la tabella `Gruppi`
--
ALTER TABLE `Gruppi`
  ADD CONSTRAINT `Gruppi_ibfk_1` FOREIGN KEY (`disciplina`) REFERENCES `Discipline` (`nome`);

--
-- Limiti per la tabella `Istituti`
--
ALTER TABLE `Istituti`
  ADD CONSTRAINT `Istituti_ibfk_1` FOREIGN KEY (`citta`) REFERENCES `Citta` (`id`);

--
-- Limiti per la tabella `SediSportive`
--
ALTER TABLE `SediSportive`
  ADD CONSTRAINT `SediSportive_ibfk_1` FOREIGN KEY (`citta`) REFERENCES `Citta` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
