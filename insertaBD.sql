-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2022 a las 23:12:45
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

--
-- Volcado de datos para la tabla `armes_biologiques`
--

INSERT INTO `armes_biologiques` (`nom`, `data`, `potencial`, `zona`, `lab`) VALUES
('antrax', '2003-07-04', 9, 333, 3),
('botulismo', '2022-05-09', 4, 111, 5),
('equina venezolana', '2017-01-16', 10, 111, 5),
('fiebre Q', '2019-05-14', 8, 111, 5),
('tifus', '2016-12-06', 6, 111, 5),
('Tularemia', '2015-05-12', 2, 111, 5);

--
-- Volcado de datos para la tabla `assignacions`
--

INSERT INTO `assignacions` (`data`, `empl_ord`, `zona`, `lab`, `data_fi`) VALUES
('2020-02-15', 542355634, 111, 2, '2021-12-20'),
('2020-05-12', 343247873, 111, 3, '2020-05-14'),
('2020-07-13', 314289294, 111, 4, '2021-03-23'),
('2020-09-03', 432423443, 111, 3, '2020-11-05'),
('2020-11-06', 432423443, 222, 3, '2021-02-17'),
('2021-02-18', 432423443, 111, 3, '2022-01-13'),
('2021-03-01', 839493020, 222, 2, '2021-09-01'),
('2021-05-11', 542355634, 222, 2, '2025-01-01'),
('2021-09-01', 120037749, 222, 2, '2021-11-18'),
('2021-12-21', 542355634, 222, 2, '2022-03-29'),
('2022-02-06', 120037749, 111, 1, '2022-03-11'),
('2022-03-01', 839493020, 222, 2, '2022-09-01'),
('2022-03-30', 542355634, 111, 4, '2022-04-06'),
('2022-04-07', 542355634, 222, 2, '2022-04-21'),
('2022-04-22', 542355634, 222, 3, '2022-05-10'),
('2022-04-25', 314289294, 111, 5, '2022-05-05'),
('2022-05-06', 314289294, 111, 3, '2022-07-01'),
('2022-05-28', 432423443, 111, 4, '2022-11-28'),
('2022-07-02', 314289294, 222, 3, '2023-12-23');

--
-- Volcado de datos para la tabla `empleats`
--

INSERT INTO `empleats` (`num_pass`, `nom`) VALUES
(120037749, 'Adriana Ledesma'),
(248230934, 'Magnus Bane'),
(314289294, 'Carla Pallares'),
(330568195, 'Mariano Vega'),
(333243442, 'Murtagh Tornacson'),
(343247873, 'Frederick Hallam'),
(344234324, 'Darrow au Lico'),
(344323428, 'Taravangian'),
(377322345, 'Peter Lamont'),
(384279348, 'Devan Lochees'),
(384934992, 'Fisher Tiger'),
(432423443, 'Jordi Guash'),
(482334244, 'Hari Seldon'),
(542355634, 'Pax au Telematus'),
(576708708, 'Purificacion Morales'),
(628323390, 'Emiel Regis'),
(666777666, 'Donquixote Doflamingo'),
(763828123, 'Ivan Karamazov'),
(768645345, 'Michael Faraday'),
(802937252, 'Joseba Nieves'),
(823498053, 'Jansah Kholoin'),
(834920534, 'Dedo Polvoriento'),
(839493020, 'Alberto Malich'),
(877890028, 'Clara  Biomoth'),
(910910910, 'Dalinar Kholin'),
(923495993, 'Oscar Drai'),
(952342895, 'Martina Llanos'),
(999999999, 'Azhek Ahriman');

--
-- Volcado de datos para la tabla `laboratoris`
--

INSERT INTO `laboratoris` (`codi`, `nom`, `pais`) VALUES
(1, 'BiotecLabs', 'ALEMANIA'),
(2, 'BCN-XXX', 'DINAMARCA'),
(3, 'JonsonsANDJeisonLABS', 'ESPAÑA'),
(4, 'Briol Laboratories', 'FRANCIA'),
(5, 'Herich Cark Biocherm', 'PORTUGAL'),
(6, 'UNILABS', 'ESPAÑA');

--
-- Volcado de datos para la tabla `ordinaris`
--

INSERT INTO `ordinaris` (`num_pass`) VALUES
(120037749),
(314289294),
(343247873),
(432423443),
(542355634),
(839493020);

--
-- Volcado de datos para la tabla `paisos`
--

INSERT INTO `paisos` (`nom`, `pot_desenv`, `tractat_signat`) VALUES
('ALEMANIA', 'HONGOS', 'SI'),
('DINAMARCA', 'HONGOS', 'DESCONOCIDO'),
('ESPAÑA', 'BACTERIAS', 'SI'),
('FRANCIA', 'VIRUS', 'SI'),
('PORTUGAL', 'BACTERIAS', 'NO');

--
-- Volcado de datos para la tabla `qualificats`
--

INSERT INTO `qualificats` (`num_pass`, `titulacio`, `zona_assignada`, `lab`) VALUES
(248230934, 'Genetica', NULL, NULL),
(330568195, 'Quimicas', 333, 3),
(333243442, 'Matematicas', NULL, NULL),
(344323428, 'Medicina', 333, 3),
(377322345, 'Radioquimica', NULL, NULL),
(384279348, 'Radioquimica', 222, 2),
(384934992, 'Biologo', 333, 3),
(482334244, 'Psicohistoria', 111, 1),
(576708708, 'Ingenieria Informatica', NULL, NULL),
(628323390, 'Farmacia', 222, 3),
(666777666, 'Ingenieria Informatica', NULL, NULL),
(763828123, 'Medicina', 111, 3),
(768645345, 'Electroquimica', 111, 5),
(802937252, 'Farmacia', NULL, NULL),
(823498053, 'Fisica', NULL, NULL),
(877890028, 'Biologia', 111, 2),
(910910910, 'Piroquimica', 222, 3),
(923495993, 'Biologo Marino', NULL, NULL),
(952342895, 'Bioquimico', 222, 2),
(999999999, 'Medicina', 111, 4);

--
-- Volcado de datos para la tabla `zones_biocontencio`
--

INSERT INTO `zones_biocontencio` (`codi`, `codiLab`, `nivell`, `responsable`) VALUES
(111, 1, 'A', 576708708),
(111, 2, 'B', 923495993),
(111, 3, 'B', 333243442),
(111, 4, 'B', 802937252),
(111, 5, 'A', 248230934),
(222, 2, 'M', 377322345),
(222, 3, 'B', 823498053),
(333, 3, 'M', 666777666);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
