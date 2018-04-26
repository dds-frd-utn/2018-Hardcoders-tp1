-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-04-2018 a las 03:13:50
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dds_tp1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `cuil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `cuil`) VALUES
(1, 'José Damián Benitez', 12345698),
(2, 'otro cliente', 12123654),
(3, 'otro mas que se anima', 12354),
(4, 'el cuarto', 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `actualizado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id` int(11) NOT NULL,
  `numero` bigint(20) NOT NULL,
  `apertura` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int(11) NOT NULL,
  `saldo` double(12,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id`, `numero`, `apertura`, `id_cliente`, `saldo`) VALUES
(1, 111, '2018-04-18 00:12:49', 1, 0),
(2, 222, '2018-04-18 00:12:49', 1, 0),
(3, 333, '2018-04-18 00:12:49', 1, 0),
(4, 444, '2018-04-18 00:12:49', 2, 2200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_movimiento`
--

CREATE TABLE `estado_movimiento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_movimiento`
--

INSERT INTO `estado_movimiento` (`id`, `nombre`) VALUES
(1, 'PENDIENTE'),
(2, 'EN PROCESO'),
(3, 'PROCESADO'),
(4, 'RECHAZADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `id` int(11) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `procesado` timestamp NULL DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `importe` double NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`id`, `creado`, `procesado`, `tipo`, `estado`, `importe`, `id_cuenta`, `descripcion`) VALUES
(1, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 0, 4, 'nafta'),
(2, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(3, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(4, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(5, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(6, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(7, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(8, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(9, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(10, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(11, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(12, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(13, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(14, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(15, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(16, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(17, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(18, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(19, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(20, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL),
(21, '2018-04-18 01:14:49', '2018-04-21 04:09:12', 1, 2, 110, 4, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_movimiento`
--

CREATE TABLE `tipo_movimiento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_movimiento`
--

INSERT INTO `tipo_movimiento` (`id`, `nombre`) VALUES
(1, 'Extracción'),
(2, 'Depósito');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_contacto` (`id_cliente`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_cuenta` (`id_cliente`);

--
-- Indices de la tabla `estado_movimiento`
--
ALTER TABLE `estado_movimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_movimiento` (`tipo`),
  ADD KEY `estado_movimiento` (`estado`),
  ADD KEY `cuenta_movimiento` (`id_cuenta`);

--
-- Indices de la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estado_movimiento`
--
ALTER TABLE `estado_movimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
