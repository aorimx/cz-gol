-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2017 a las 01:05:59
-- Versión del servidor: 5.7.14
-- Versión de PHP: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cazagol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `name`) VALUES
(1, 'América'),
(2, 'Tigres'),
(3, 'Monarcas'),
(4, 'Monterrey');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id` int(11) NOT NULL,
  `id_casa` int(11) DEFAULT NULL,
  `id_visita` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`id`, `id_casa`, `id_visita`) VALUES
(1, 1, 2),
(2, 3, 4),
(3, 2, 1),
(4, 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `predicciones`
--

CREATE TABLE `predicciones` (
  `id` int(11) NOT NULL,
  `id_partido` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `resultado` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`) VALUES
(1, 'Erick'),
(2, 'Frank'),
(3, 'Marco'),
(4, 'Manuel'),
(5, 'Kikin'),
(6, 'Fausto'),
(7, 'Eduardo'),
(8, 'Diego'),
(9, 'Wadi'),
(10, 'Alan'),
(11, 'Luz'),
(12, 'Helsin'),
(13, 'Denisse'),
(14, 'Gera');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `predicciones`
--
ALTER TABLE `predicciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
