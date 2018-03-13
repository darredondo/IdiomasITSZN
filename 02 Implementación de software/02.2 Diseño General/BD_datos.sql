-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2018 a las 21:57:33
-- Versión del servidor: 5.6.17-log
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `idiomas`
--
CREATE DATABASE IF NOT EXISTS `idiomas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `idiomas`;

--
-- Truncar tablas antes de insertar `administrador`
--

TRUNCATE TABLE `administrador`;
--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idadministrador`, `nombre_administrador`, `cargo`, `idusuario`) VALUES
(1, 'MARTHA PATRICIA OSORNIO GONZÁLEZ', 'Encargada del centro de idiomas del ITSZN', 4);

--
-- Truncar tablas antes de insertar `calificacion`
--

TRUNCATE TABLE `calificacion`;
--
-- Truncar tablas antes de insertar `carrera`
--

TRUNCATE TABLE `carrera`;
--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`idcarrera`, `siglas`, `carrera`) VALUES
(1, 'CP', 'CONTADURIA PUBLICA'),
(2, 'IA', 'INGENIERIA EN ADMINISTRACION'),
(3, 'IEM', 'INGENIERIA ELECTROMECANICA'),
(4, 'IGE', 'INGENIERIA EN GESTION EMPRESARIAL'),
(5, 'II', 'INGENIERIA EN INFORMATICA'),
(6, 'ISC', 'INGENIERIA EN SISTEMAS COMPUTACIONALES'),
(7, 'ITIC', 'INGENIERIA EN TECNOLOGIAS DE LA INFORMACION Y COMUNICACIONES'),
(8, 'EXT', 'EXTERNO');

--
-- Truncar tablas antes de insertar `curso`
--

TRUNCATE TABLE `curso`;
--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idcurso`, `nivel_curso`, `periodo_inicio`, `periodo_fin`, `hora_inicio`, `hora_fin`, `semestre`, `sistema`, `iddocente`) VALUES
(1, 9, '2018-01-29', '2018-04-12', '08:00:00', '10:00:00', 'Enero-Junio 2018', 'ESCOLARIZADO', 3),
(2, 1, '2018-01-29', '2018-04-12', '14:00:00', '16:00:00', 'Enero-Junio 2018', 'ESCOLARIZADO', 3),
(3, 7, '2018-01-29', '2018-04-12', '08:00:00', '10:00:00', 'Enero-Junio 2018', 'SEMIESCOLARIZADO', 2),
(4, 5, '2018-01-29', '2018-04-12', '14:00:00', '16:00:00', 'Enero-Junio 2018', 'SEMIESCOLARIZADO', 2);

--
-- Truncar tablas antes de insertar `docente`
--

TRUNCATE TABLE `docente`;
--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`iddocente`, `nombre_docente`, `idusuario`) VALUES
(1, 'CRYSTHIAN JESÚS ROSALES CARRILLO', 7),
(2, 'JOSÉ EFRAÍN VAQUERA GONZÁLEZ', 5),
(3, 'TEODORO GONZALEZ', 6),
(4, 'MARLEM SANDOVAL ESPINOZA', 8);

--
-- Truncar tablas antes de insertar `estudiante`
--

TRUNCATE TABLE `estudiante`;
--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`idestudiante`, `no_control`, `nombre`, `idcarrera`, `idusuario`) VALUES
(1, '14010261', 'RODRIGUEZ RIVAZ JOSE MANUEL', 6, 1),
(2, '14010318', 'MIRELES MIRELES FERMIN', 6, 2),
(3, '14010149', 'HERRADA CISNEROS MIGUEL', 6, 3),
(4, NULL, 'ARREDONDO SALCEDO DANIEL', 8, 9);

--
-- Truncar tablas antes de insertar `exa_toeic`
--

TRUNCATE TABLE `exa_toeic`;
--
-- Volcado de datos para la tabla `exa_toeic`
--

INSERT INTO `exa_toeic` (`idexa_TOEIC`, `fecha_toeic`, `acta`, `semestre`, `puntos_toeic`, `porcentaje_toeic`, `porcentaje_articulo`, `porcentaje_final`, `situacion`, `idestudiante`) VALUES
(3, '2018-03-12', 123, 2, 300, 60, 25, 85, 'APROBADO', 2),
(4, '2018-01-16', 123, 5, 500, 70, 20, 90, 'APROBADO', 3),
(5, '2017-10-09', 100, 1, 150, 45, 10, 55, 'NO APROBADO', 2),
(6, '2018-03-05', 123, 21, 400, 70, 15, 85, 'APROBADO', 2);

--
-- Truncar tablas antes de insertar `exa_ubicacion`
--

TRUNCATE TABLE `exa_ubicacion`;
--
-- Volcado de datos para la tabla `exa_ubicacion`
--

INSERT INTO `exa_ubicacion` (`idexa_ubicacion`, `fecha_ubi`, `nivel_ubi`, `puntos_ubi`, `no_recibo`, `idestudiante`) VALUES
(1, '2017-11-12', 3, 14, '7208', 1),
(2, '2017-01-15', 7, 38, '561', 2),
(3, '0000-00-00', 3, 15, '4831', 3);

--
-- Truncar tablas antes de insertar `inscripcion`
--

TRUNCATE TABLE `inscripcion`;
--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`idinscripcion`, `idestudiante`, `idcurso`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2);

--
-- Truncar tablas antes de insertar `usuario`
--

TRUNCATE TABLE `usuario`;
--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `alias`, `contrasena`) VALUES
(1, 'JMRR', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
(2, 'FMM', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
(3, 'MHC', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
(4, 'admin', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
(5, 'efrain', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
(6, 'teo', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
(7, 'cristian', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
(8, 'marlem', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
(9, 'daniel', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
