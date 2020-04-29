-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-12-2018 a las 01:19:31
-- Versión del servidor: 5.7.21-1
-- Versión de PHP: 7.0.29-1+b1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cybernet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antenas`
--

CREATE TABLE `antenas` (
  `id` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `mac` varchar(100) DEFAULT NULL,
  `user` varchar(30) NOT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `fk_permiso` int(11) DEFAULT NULL,
  `fk_cliente` int(11) DEFAULT NULL,
  `localizacion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `antenas`
--

INSERT INTO `antenas` (`id`, `ip`, `mac`, `user`, `pass`, `fk_permiso`, `fk_cliente`, `localizacion`) VALUES
(1, '192.168.2.35', NULL, 'cisco', 'routingadmin@2020', 1, NULL, ''),
(2, '192.168.5.34', NULL, 'cisco', 'routingadmin@2020', 1, NULL, ''),
(3, '192.168.3.6', NULL, 'cisco', 'routingadmin@2020', 1, NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `telefono` varchar(10) NOT NULL,
  `localidad` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id`, `nombre`) VALUES
(1, 'Inicio del servicio'),
(2, 'Daño de la infraestructura'),
(3, 'Facturacion'),
(4, 'Cambio de la infraestructura'),
(5, 'Caida del servicio'),
(6, 'Reconexion del servicio'),
(7, 'Fin del servicio'),
(8, 'Reinstalacion del servicio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `descripcion`) VALUES
(1, 'SHOW'),
(2, 'HIDE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `antenas`
--
ALTER TABLE `antenas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_permiso_vs_idtbPermisos` (`fk_permiso`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `antenas`
--
ALTER TABLE `antenas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `antenas`
--
ALTER TABLE `antenas`
  ADD CONSTRAINT `fk_permiso_vs_idtbPermisos` FOREIGN KEY (`fk_permiso`) REFERENCES `permisos` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
