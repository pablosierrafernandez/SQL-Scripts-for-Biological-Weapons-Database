-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2022 a las 23:11:45
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `armes_biologiques`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armes_biologiques`
--

CREATE TABLE `armes_biologiques` (
  `nom` varchar(30) NOT NULL,
  `data` date DEFAULT NULL,
  `potencial` int(2) DEFAULT NULL COMMENT 'El potencial de les armes biol?giques es codifica mitjan?ant un n?mero que ha destar entre 1 i 10',
  `zona` int(20) DEFAULT NULL,
  `lab` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `armes_biologiques`:
--   `zona`
--       `zones_biocontencio` -> `codi`
--   `lab`
--       `zones_biocontencio` -> `codiLab`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assignacions`
--

CREATE TABLE `assignacions` (
  `data` date NOT NULL,
  `empl_ord` int(20) DEFAULT NULL,
  `zona` int(20) DEFAULT NULL,
  `lab` int(20) DEFAULT NULL,
  `data_fi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `assignacions`:
--   `empl_ord`
--       `ordinaris` -> `num_pass`
--   `zona`
--       `zones_biocontencio` -> `codi`
--   `lab`
--       `zones_biocontencio` -> `codiLab`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleats`
--

CREATE TABLE `empleats` (
  `num_pass` int(20) NOT NULL,
  `nom` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `empleats`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratoris`
--

CREATE TABLE `laboratoris` (
  `codi` int(20) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `pais` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `laboratoris`:
--   `pais`
--       `paisos` -> `nom`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordinaris`
--

CREATE TABLE `ordinaris` (
  `num_pass` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `ordinaris`:
--   `num_pass`
--       `empleats` -> `num_pass`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paisos`
--

CREATE TABLE `paisos` (
  `nom` varchar(30) NOT NULL,
  `pot_desenv` varchar(30) NOT NULL,
  `tractat_signat` enum('SI','NO','DESCONOCIDO') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `paisos`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `qualificats`
--

CREATE TABLE `qualificats` (
  `num_pass` int(20) NOT NULL,
  `titulacio` varchar(30) DEFAULT NULL,
  `zona_assignada` int(20) DEFAULT NULL,
  `lab` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `qualificats`:
--   `num_pass`
--       `empleats` -> `num_pass`
--   `zona_assignada`
--       `zones_biocontencio` -> `codi`
--   `lab`
--       `zones_biocontencio` -> `codiLab`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zones_biocontencio`
--

CREATE TABLE `zones_biocontencio` (
  `codi` int(20) NOT NULL,
  `codiLab` int(20) NOT NULL,
  `nivell` enum('A','M','B') DEFAULT NULL COMMENT 'El nivell de perillositat estar? codificat amb una lletra que ha de ser A (=alt), M\r\n(=mitj?) o B (=baix).',
  `responsable` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `zones_biocontencio`:
--   `codiLab`
--       `laboratoris` -> `codi`
--   `codiLab`
--       `laboratoris` -> `codi`
--   `responsable`
--       `qualificats` -> `num_pass`
--

--
-- Disparadores `zones_biocontencio`
--
DELIMITER $$
CREATE TRIGGER `gestio_insertresponsables` AFTER INSERT ON `zones_biocontencio` FOR EACH ROW BEGIN
		UPDATE qualificats, zones_biocontencio
		SET qualificats.zona_assignada = NULL, qualificats.lab=NULL
		WHERE num_pass=NEW.responsable;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `gestio_updateresponsables` AFTER UPDATE ON `zones_biocontencio` FOR EACH ROW BEGIN
		UPDATE qualificats, zones_biocontencio
		SET qualificats.zona_assignada = NULL, qualificats.lab=NULL
		WHERE num_pass=NEW.responsable;
	END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `armes_biologiques`
--
ALTER TABLE `armes_biologiques`
  ADD PRIMARY KEY (`nom`),
  ADD KEY `zona` (`zona`),
  ADD KEY `lab` (`lab`);

--
-- Indices de la tabla `assignacions`
--
ALTER TABLE `assignacions`
  ADD PRIMARY KEY (`data`),
  ADD KEY `empl_ord` (`empl_ord`),
  ADD KEY `zona` (`zona`),
  ADD KEY `lab` (`lab`);

--
-- Indices de la tabla `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`num_pass`);

--
-- Indices de la tabla `laboratoris`
--
ALTER TABLE `laboratoris`
  ADD PRIMARY KEY (`codi`),
  ADD KEY `nom` (`nom`),
  ADD KEY `laboratoris_ibfk_1` (`pais`);

--
-- Indices de la tabla `ordinaris`
--
ALTER TABLE `ordinaris`
  ADD PRIMARY KEY (`num_pass`);

--
-- Indices de la tabla `paisos`
--
ALTER TABLE `paisos`
  ADD PRIMARY KEY (`nom`);

--
-- Indices de la tabla `qualificats`
--
ALTER TABLE `qualificats`
  ADD PRIMARY KEY (`num_pass`),
  ADD KEY `zona_assignada` (`zona_assignada`),
  ADD KEY `lab` (`lab`);

--
-- Indices de la tabla `zones_biocontencio`
--
ALTER TABLE `zones_biocontencio`
  ADD PRIMARY KEY (`codi`,`codiLab`),
  ADD KEY `codiLab` (`codiLab`),
  ADD KEY `responsable` (`responsable`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `armes_biologiques`
--
ALTER TABLE `armes_biologiques`
  ADD CONSTRAINT `armes_biologiques_ibfk_1` FOREIGN KEY (`zona`) REFERENCES `zones_biocontencio` (`codi`),
  ADD CONSTRAINT `armes_biologiques_ibfk_2` FOREIGN KEY (`lab`) REFERENCES `zones_biocontencio` (`codiLab`);

--
-- Filtros para la tabla `assignacions`
--
ALTER TABLE `assignacions`
  ADD CONSTRAINT `assignacions_ibfk_1` FOREIGN KEY (`empl_ord`) REFERENCES `ordinaris` (`num_pass`),
  ADD CONSTRAINT `assignacions_ibfk_2` FOREIGN KEY (`zona`) REFERENCES `zones_biocontencio` (`codi`),
  ADD CONSTRAINT `assignacions_ibfk_3` FOREIGN KEY (`lab`) REFERENCES `zones_biocontencio` (`codiLab`);

--
-- Filtros para la tabla `laboratoris`
--
ALTER TABLE `laboratoris`
  ADD CONSTRAINT `laboratoris_ibfk_1` FOREIGN KEY (`pais`) REFERENCES `paisos` (`nom`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ordinaris`
--
ALTER TABLE `ordinaris`
  ADD CONSTRAINT `ordinaris_ibfk_1` FOREIGN KEY (`num_pass`) REFERENCES `empleats` (`num_pass`);

--
-- Filtros para la tabla `qualificats`
--
ALTER TABLE `qualificats`
  ADD CONSTRAINT `qualificats_ibfk_1` FOREIGN KEY (`num_pass`) REFERENCES `empleats` (`num_pass`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `qualificats_ibfk_2` FOREIGN KEY (`zona_assignada`) REFERENCES `zones_biocontencio` (`codi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `qualificats_ibfk_3` FOREIGN KEY (`lab`) REFERENCES `zones_biocontencio` (`codiLab`);

--
-- Filtros para la tabla `zones_biocontencio`
--
ALTER TABLE `zones_biocontencio`
  ADD CONSTRAINT `zones_biocontencio_ibfk_1` FOREIGN KEY (`codiLab`) REFERENCES `laboratoris` (`codi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `zones_biocontencio_ibfk_2` FOREIGN KEY (`codiLab`) REFERENCES `laboratoris` (`codi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `zones_biocontencio_ibfk_3` FOREIGN KEY (`responsable`) REFERENCES `qualificats` (`num_pass`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
