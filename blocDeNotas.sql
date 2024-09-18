-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-09-2024 a las 09:26:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blocDeNotas`

CREATE DATABASE `blocDeNotas`;
--

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `libretas`

CREATE TABLE `blocDeNotas`.`libretas` (
  `idFecha` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaNota` date NOT NULL,
  `cantNotas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `libretas`:
--   `idUsuario`
--       `usuarios` -> `idUsuario`
--

--
-- Volcado de datos para la tabla `libretas`
--

INSERT INTO `blocDeNotas`.`libretas` (`idFecha`, `idUsuario`, `fechaNota`, `cantNotas`) VALUES
(1, 1, '2024-09-12', 2),
(2, 1, '2024-09-13', 1),
(3, 2, '2024-09-12', 3),
(4, 2, '2024-09-14', 2),
(5, 3, '2024-09-13', 3),
(6, 3, '2024-09-14', 2),
(7, 3, '2024-09-15', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `blocDeNotas`.`notas` (
  `idNota` int(11) NOT NULL,
  `idFecha` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `nota` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `notas`:
--   `idFecha`
--       `libretas` -> `idFecha`
--

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `blocDeNotas`.`notas` (`idNota`, `idFecha`, `titulo`, `nota`) VALUES
(1, 1, 'tareas de programación', 'lorem ipsum…'),
(2, 1, 'fechas de parciales', 'lorem ipsum…'),
(3, 2, 'compras del día', 'lorem ipsum…'),
(4, 3, 'comprar comida para el gato', 'lorem ipsum…'),
(5, 3, 'sacar a pasear al perro', 'lorem ipsum…'),
(6, 3, 'cortar el pasto', 'lorem ipsum…'),
(7, 4, 'rutina de entrenamiento', 'lorem ipsum…'),
(8, 4, 'recetas de cocina', 'lorem ipsum…'),
(9, 5, 'líneas de colectivo', 'lorem ipsum…'),
(10, 5, 'precios de computadoras', 'lorem ipsum…'),
(11, 5, 'notas rápidas', 'lorem ipsum…'),
(12, 6, 'tareas de ingles', 'lorem ipsum…'),
(13, 6, 'tp-1-web-2 requerimientos', 'lorem ipsum…'),
(14, 7, 'gastos semanales', 'lorem ipsum…');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `blocDeNotas`.`usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `usuarios`:
--

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `blocDeNotas`.`usuarios` (`idUsuario`, `nombreUsuario`, `email`, `password`) VALUES
(1, 'joel.l.fuentes', 'fuenteslautarojoe@gmail.com', '*****'),
(2, '07Martin12', 'alexmartin9c@gmail.com', '****'),
(3, 'alexander.24', 'alex2024@gmail.com', '****');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libretas`
--
ALTER TABLE `blocDeNotas`.`libretas`
  ADD PRIMARY KEY (`idFecha`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `blocDeNotas`.`notas`
  ADD PRIMARY KEY (`idNota`),
  ADD KEY `idFecha` (`idFecha`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `blocDeNotas`.`usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libretas`
--
ALTER TABLE `blocDeNotas`.`libretas`
  MODIFY `idFecha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `blocDeNotas`.`notas`
  MODIFY `idNota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `blocDeNotas`.`usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libretas`
--
ALTER TABLE `blocDeNotas`.`libretas`
  ADD CONSTRAINT `libretas_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `blocDeNotas`.`notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`idFecha`) REFERENCES `libretas` (`idFecha`);


--
-- Metadatos
--
USE `phpmyadmin`;

--
-- Metadatos para la tabla libretas
--

--
-- Metadatos para la tabla notas
--

--
-- Metadatos para la tabla usuarios
--

--
-- Metadatos para la base de datos web2-tp-1
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;