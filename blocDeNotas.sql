-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_nota` int(11) NOT NULL,
  `id_fecha_nota` int(11) NOT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `nota` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_nota`, `id_fecha_nota`, `titulo`, `nota`) VALUES
(1, 1, 'Nota de Hoy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis efficitur lectus arcu, elementum fermentum est sagittis ac. Integer rutrum odio vel sem cursus suscipit. Integer pharetra nec sem vel rhoncus. Fusce in tincidunt lorem, sit amet luctus sem. Duis elementum augue at est maximus gravida. Nulla eget tincidunt ipsum. Aliquam vulputate elit ut faucibus posuere.'),
(2, 1, 'Apuntes sobre Web', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis efficitur lectus arcu, elementum fermentum est sagittis ac. Integer rutrum odio vel sem cursus suscipit. Integer pharetra nec sem vel rhoncus. Fusce in tincidunt lorem, sit amet luctus sem. Duis elementum augue at est maximus gravida. Nulla eget tincidunt ipsum. Aliquam vulputate elit ut faucibus posuere. '),
(3, 2, 'Nota día Miércoles', 'Cras eleifend lacinia mauris vitae egestas. In elementum ullamcorper mollis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Duis cursus odio ac varius mollis. In ut ultrices dolor, venenatis ultrices neque. Cras hendrerit elit nibh, sed efficitur libero posuere faucibus. Integer ut ex pretium, laoreet eros in, facilisis est. Cras viverra volutpat faucibus. Vestibulum venenatis mattis blandit. Duis dictum pellentesque velit a fringilla. Suspendisse hendrerit posuere nibh.'),
(4, 3, 'Tareas de Programaci', 'Cras eleifend lacinia mauris vitae egestas. In elementum ullamcorper mollis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Duis cursus odio ac varius mollis. In ut ultrices dolor, venenatis ultrices neque. Cras hendrerit elit nibh, sed efficitur libero posuere faucibus. Integer ut ex pretium, laoreet eros in, facilisis est. Cras viverra volutpat faucibus. Vestibulum venenatis mattis blandit. Duis dictum pellentesque velit a fringilla. Suspendisse hendrerit posuere nibh.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notasPorFecha`
--

CREATE TABLE `notasPorFecha` (
  `id_fecha_nota` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cant_notas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `notasPorFecha`
--

INSERT INTO `notasPorFecha` (`id_usuario`, `id_fecha_nota`, `fecha`, `cant_notas`) VALUES
(1, 1, '2024-09-14', 2),
(2, 1, '2024-09-11', 1),
(3, 2, '2024-09-14', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `email`, `password`) VALUES
(1, 'joel.l.fuentes', 'fuenteslautarojoe@gmail.com', '123contraseña'),
(2, 'martin24', 'martin24@gmail.com', '#64#contra');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_nota` (`id_fecha_nota`) USING BTREE;

--
-- Indices de la tabla `notasPorFecha`
--
ALTER TABLE `notasPorFecha`
  ADD PRIMARY KEY (`id_fecha_nota`),
  ADD UNIQUE KEY `unique_usuario_fecha` (`id_usuario`,`fecha`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `unique_nombre_usuario` (`nombre_usuario`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `notasPorFecha`
--
ALTER TABLE `notasPorFecha`
  MODIFY `id_fecha_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`id_fecha_nota`) REFERENCES `notasPorFecha` (`id_fecha_nota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notasPorFecha`
--
ALTER TABLE `notasPorFecha`
  ADD CONSTRAINT `notasPorFecha_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;