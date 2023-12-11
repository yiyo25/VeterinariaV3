-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2023 a las 17:02:18
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `veterinaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistente`
--

CREATE TABLE `asistente` (
  `idAsistente` int(11) NOT NULL,
  `nomAsistente` varchar(500) DEFAULT NULL,
  `dniAsistente` varchar(20) DEFAULT NULL,
  `celAsistente` varchar(20) DEFAULT NULL,
  `veterinario_idVeterinario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `asistente`
--

INSERT INTO `asistente` (`idAsistente`, `nomAsistente`, `dniAsistente`, `celAsistente`, `veterinario_idVeterinario`) VALUES
(1, 'ASISTENTE PRUEBA 1 ', '745213698', '987456852', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idCitas` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` varchar(50) DEFAULT NULL,
  `detalle` varchar(500) DEFAULT NULL,
  `mascota_idMascota` int(11) NOT NULL,
  `servicio_idServicio` int(11) DEFAULT NULL,
  `usuario_idUsuario` int(11) NOT NULL,
  `estadoCita` varchar(20) NOT NULL,
  `veterinario_idVeterinario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`idCitas`, `fecha`, `hora`, `detalle`, `mascota_idMascota`, `servicio_idServicio`, `usuario_idUsuario`, `estadoCita`, `veterinario_idVeterinario`) VALUES
(1, '2023-11-24', '12:00 PM', 'PRUEBA prueba prueba', 1, 1, 2, 'COMPLETADO', 3),
(2, '2023-11-27', '12:00 PM', 'Prueba pureba pueba', 2, 3, 2, 'CANCELADO', NULL),
(3, '2023-11-30', '17:00', 'BAÑO', 3, 4, 2, 'COMPLETADO', 3),
(4, '2023-11-30', '13:00', 'Vacunacion X', 2, 6, 2, 'COMPLETADO', 3),
(6, '2023-12-13', '02:00', 'Prueba prueba', 3, 7, 2, 'PENDIENTE', NULL),
(7, '2023-12-19', '10:00', 'Prueba Paypal', 2, 3, 2, 'COMPLETADO', 3),
(8, '2023-12-22', '14:00', 'Prueba Paypal V2', 3, 2, 2, 'PENDIENTE', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `idEspecialidad` int(11) NOT NULL,
  `desEspecialidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`idEspecialidad`, `desEspecialidad`) VALUES
(1, 'Oncología'),
(2, 'Fisioterapia'),
(3, 'Rehabilitacion'),
(4, 'Cirugia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `idMascota` int(11) NOT NULL,
  `nomMascota` varchar(100) DEFAULT NULL,
  `edaMascota` varchar(45) DEFAULT NULL,
  `sexMascota` varchar(45) DEFAULT NULL,
  `razMascota` varchar(100) DEFAULT NULL,
  `tipo_mascota_idTipo_mascota` int(11) NOT NULL,
  `usuario_idUsuario` int(11) NOT NULL,
  `estadoMascota` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`idMascota`, `nomMascota`, `edaMascota`, `sexMascota`, `razMascota`, `tipo_mascota_idTipo_mascota`, `usuario_idUsuario`, `estadoMascota`) VALUES
(1, 'Pedrita', '5 meses', 'Hembra', 'Unica', 1, 2, 'DESACTIVO'),
(2, 'Pepito', '10 meses', 'Macho', 'Cocker', 1, 2, 'ACTIVO'),
(3, 'PIRULINA', '03 MESES', 'Hembra', 'UNICA', 1, 2, 'ACTIVO'),
(4, 'Nachito', '2 Meses', 'Macho', 'UNICA', 2, 2, 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL,
  `desServicio` varchar(300) NOT NULL,
  `preServicio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicio`, `desServicio`, `preServicio`) VALUES
(1, 'Consulta Veterinaria', 5),
(2, 'Vacunacion', 10),
(3, 'Cirugia Veterinaria', 20),
(4, 'Odontologia Veterinaria', 15),
(5, 'Laboratorio y Pruebas Diagnosticas', 10),
(6, 'Control de Parasitos', 20),
(7, 'Nutrición y Asesoramiento Dietetico', 12),
(8, 'Rehabilitacion y Fisioterapia', 10),
(9, 'Grooming y Cuidado Estetico', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_mascota`
--

CREATE TABLE `tipo_mascota` (
  `idTipo_mascota` int(11) NOT NULL,
  `desMascota` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_mascota`
--

INSERT INTO `tipo_mascota` (`idTipo_mascota`, `desMascota`) VALUES
(1, 'PERRO'),
(2, 'GATO'),
(3, 'LORO'),
(4, 'OTRO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `desTipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`idTipoUsuario`, `desTipo`) VALUES
(1, 'CLIENTE'),
(2, 'ADMINISTRADOR'),
(3, 'ASISTENTE'),
(4, 'VETERINARIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nomUsuario` varchar(500) NOT NULL,
  `dniUsuario` varchar(10) NOT NULL,
  `celUsuario` varchar(10) NOT NULL,
  `emaUsuario` varchar(400) NOT NULL,
  `pasUsuario` varchar(200) NOT NULL,
  `usuario_idTipoUsuario` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nomUsuario`, `dniUsuario`, `celUsuario`, `emaUsuario`, `pasUsuario`, `usuario_idTipoUsuario`, `estado`) VALUES
(1, 'Administrador ', '12345678', '987456321', 'admin@gmail.com', '123456', 2, 'ACTIVO'),
(2, 'Veterinario Vet 1', '78965485', '987456321', 'veterinario1@gmail.com', '123456', 4, 'ACTIVO'),
(3, 'Asistente asistente 1', '78965452', '987456258', 'asistente1@gmail.com', '123456', 3, 'ACTIVO'),
(4, 'Veterinario Vet 3', '74589685', '987456852', 'veterinario3@gmail.com', '123456', 4, 'ACTIVADO'),
(5, 'Veterinario Vet 2', '74125874', '945678541', 'veterinario2@gmail.com', '123456', 4, 'ACTIVADO'),
(6, 'Asistente asistente 2', '74589652', '987456258', 'asistente2@gmail.com', '123456', 3, 'ACTIVADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinario`
--

CREATE TABLE `veterinario` (
  `idVeterinario` int(11) NOT NULL,
  `nomVeterinario` varchar(500) DEFAULT NULL,
  `dniVeterinario` varchar(20) DEFAULT NULL,
  `celVeterinario` varchar(20) DEFAULT NULL,
  `especialidad_idEspecialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `veterinario`
--

INSERT INTO `veterinario` (`idVeterinario`, `nomVeterinario`, `dniVeterinario`, `celVeterinario`, `especialidad_idEspecialidad`) VALUES
(1, 'PRUEBA VETERINARIO1', '74589632', '987456322', 2),
(3, 'PRUEBA VETERINARIO 2', '78965412', '987456987', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistente`
--
ALTER TABLE `asistente`
  ADD PRIMARY KEY (`idAsistente`),
  ADD KEY `fk_asistente_veterinario_idx` (`veterinario_idVeterinario`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idCitas`),
  ADD KEY `fk_citas_usuario_idx` (`usuario_idUsuario`),
  ADD KEY `fk_citas_mascota1_idx` (`mascota_idMascota`),
  ADD KEY `servicio_idServicio` (`servicio_idServicio`),
  ADD KEY `veterinario_idVeterinario` (`veterinario_idVeterinario`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`idEspecialidad`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`idMascota`),
  ADD KEY `fk_mascota_usuario_idx` (`usuario_idUsuario`),
  ADD KEY `fk_mascota_tipo_mascota1_idx` (`tipo_mascota_idTipo_mascota`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`);

--
-- Indices de la tabla `tipo_mascota`
--
ALTER TABLE `tipo_mascota`
  ADD PRIMARY KEY (`idTipo_mascota`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`idTipoUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `FK_usuario_tipoUSuario` (`usuario_idTipoUsuario`);

--
-- Indices de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`idVeterinario`),
  ADD KEY `fk_veterinario_especialidad_idx` (`especialidad_idEspecialidad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistente`
--
ALTER TABLE `asistente`
  MODIFY `idAsistente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `idCitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `idMascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipo_mascota`
--
ALTER TABLE `tipo_mascota`
  MODIFY `idTipo_mascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `idVeterinario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistente`
--
ALTER TABLE `asistente`
  ADD CONSTRAINT `fk_asistente_veterinario` FOREIGN KEY (`veterinario_idVeterinario`) REFERENCES `veterinario` (`idVeterinario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`servicio_idServicio`) REFERENCES `servicio` (`idServicio`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`veterinario_idVeterinario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `fk_citas_mascota1` FOREIGN KEY (`mascota_idMascota`) REFERENCES `mascota` (`idMascota`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_citas_usuario` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `fk_mascota_tipo_mascota1` FOREIGN KEY (`tipo_mascota_idTipo_mascota`) REFERENCES `tipo_mascota` (`idTipo_mascota`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mascota_usuario` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_usuario_tipoUSuario` FOREIGN KEY (`usuario_idTipoUsuario`) REFERENCES `tipo_usuario` (`idTipoUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `veterinario`
--
ALTER TABLE `veterinario`
  ADD CONSTRAINT `fk_veterinario_especialidad` FOREIGN KEY (`especialidad_idEspecialidad`) REFERENCES `especialidad` (`idEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
