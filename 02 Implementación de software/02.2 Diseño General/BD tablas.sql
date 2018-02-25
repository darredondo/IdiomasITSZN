-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-02-2018 a las 21:26:08
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE IF NOT EXISTS `administrador` (
  `idadministrador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_administrador` varchar(100) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idadministrador`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  KEY `fk_administrador_usuario1_idx` (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE IF NOT EXISTS `calificacion` (
  `idcalificacion` int(11) NOT NULL AUTO_INCREMENT,
  `unidad` tinyint(3) unsigned NOT NULL,
  `calificacion` tinyint(3) unsigned NOT NULL,
  `idinscripcion` int(11) NOT NULL,
  PRIMARY KEY (`idcalificacion`),
  KEY `fk_calificacion_inscripcion1_idx` (`idinscripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE IF NOT EXISTS `carrera` (
  `idcarrera` int(11) NOT NULL AUTO_INCREMENT,
  `siglas` varchar(45) NOT NULL,
  `carrera` varchar(100) NOT NULL,
  PRIMARY KEY (`idcarrera`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `nivel_curso` tinyint(3) unsigned NOT NULL,
  `periodo_inicio` date NOT NULL,
  `periodo_fin` date NOT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `semestre` varchar(100) NOT NULL,
  `sistema` varchar(45) DEFAULT NULL,
  `iddocente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcurso`),
  KEY `fk_curso_docente1_idx` (`iddocente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE IF NOT EXISTS `docente` (
  `iddocente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_docente` varchar(150) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddocente`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  KEY `fk_docente_usuario1_idx` (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE IF NOT EXISTS `estudiante` (
  `idestudiante` int(11) NOT NULL AUTO_INCREMENT,
  `no_control` varchar(45) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `idcarrera` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idestudiante`),
  UNIQUE KEY `no_control_UNIQUE` (`no_control`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  KEY `fk_estudiante_carrera_idx` (`idcarrera`),
  KEY `fk_estudiante_usuario1_idx` (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exa_toeic`
--

CREATE TABLE IF NOT EXISTS `exa_toeic` (
  `idexa_TOEIC` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_toeic` date NOT NULL,
  `puntos_toeic` int(10) unsigned NOT NULL,
  `acta` int(10) unsigned NOT NULL,
  `anyo` int(10) unsigned NOT NULL,
  `calificacion_toeic` tinyint(3) unsigned DEFAULT NULL,
  `idestudiante` int(11) NOT NULL,
  PRIMARY KEY (`idexa_TOEIC`),
  KEY `fk_exa_TOEIC_estudiante1_idx` (`idestudiante`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exa_ubicacion`
--

CREATE TABLE IF NOT EXISTS `exa_ubicacion` (
  `idexa_ubicacion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_ubi` date NOT NULL,
  `nivel_ubi` tinyint(3) unsigned NOT NULL,
  `puntos_ubi` int(10) unsigned NOT NULL,
  `no_recibo` varchar(45) NOT NULL,
  `idestudiante` int(11) NOT NULL,
  PRIMARY KEY (`idexa_ubicacion`),
  KEY `fk_exa_ubicacion_estudiante1_idx` (`idestudiante`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE IF NOT EXISTS `inscripcion` (
  `idinscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `idestudiante` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  PRIMARY KEY (`idinscripcion`),
  KEY `fk_inscripcion_estudiante1_idx` (`idestudiante`),
  KEY `fk_inscripcion_curso1_idx` (`idcurso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_administrador_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `fk_calificacion_inscripcion1` FOREIGN KEY (`idinscripcion`) REFERENCES `inscripcion` (`idinscripcion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_curso_docente1` FOREIGN KEY (`iddocente`) REFERENCES `docente` (`iddocente`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `fk_docente_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `fk_estudiante_carrera` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estudiante_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `exa_toeic`
--
ALTER TABLE `exa_toeic`
  ADD CONSTRAINT `fk_exa_TOEIC_estudiante1` FOREIGN KEY (`idestudiante`) REFERENCES `estudiante` (`idestudiante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `exa_ubicacion`
--
ALTER TABLE `exa_ubicacion`
  ADD CONSTRAINT `fk_exa_ubicacion_estudiante1` FOREIGN KEY (`idestudiante`) REFERENCES `estudiante` (`idestudiante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `fk_inscripcion_curso1` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inscripcion_estudiante1` FOREIGN KEY (`idestudiante`) REFERENCES `estudiante` (`idestudiante`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
