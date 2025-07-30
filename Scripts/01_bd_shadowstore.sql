-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-07-2025 a las 16:51:53
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION,NO_AUTO_VALUE_ON_ZERO';
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shadowstore`
--
CREATE DATABASE IF NOT EXISTS `shadowstore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shadowstore`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_juego`
--

CREATE TABLE `categoria_juego` (
  `id_categoria` int(11) NOT NULL COMMENT 'Identificador de la categoría de juego',
  `nombre_categoria` varchar(100) NOT NULL COMMENT 'Nombre de la categoría del juego',
  `descripcion_categoria` text DEFAULT NULL COMMENT 'Descripción general de la categoría'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL COMMENT 'Identificador único del cliente',
  `id_user` int(11) NOT NULL COMMENT 'Referencia única al usuario correspondiente',
  `nombre_cliente` varchar(100) NOT NULL COMMENT 'Nombre del cliente',
  `apellido_cliente` varchar(100) NOT NULL COMMENT 'Apellido del cliente',
  `telefono_cliente` varchar(20) NOT NULL COMMENT 'Número telefónico del cliente',
  `cedula_cliente` varchar(20) NOT NULL COMMENT 'Número de cédula de identidad del cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_estados_pedido`
--

CREATE TABLE `historial_estados_pedido` (
  `id_historial` int(11) NOT NULL COMMENT 'Identificador del cambio en el historial',
  `id_pedido` int(11) NOT NULL COMMENT 'Clave foránea al pedido cuyo estado cambió',
  `id_user` int(11) NOT NULL COMMENT 'Usuario del sistema que realizó el cambio de estado',
  `estado_anterior` enum('pendiente','pagado','rechazado','cancelado') NOT NULL COMMENT 'Estado anterior del pedido',
  `nuevo_estado` enum('pendiente','pagado','rechazado','cancelado') NOT NULL COMMENT 'Nuevo estado asignado al pedido',
  `fecha_cambio` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora del cambio de estado',
  `comentario` text DEFAULT NULL COMMENT 'Comentario opcional sobre el cambio de estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `id_juego` int(11) NOT NULL COMMENT 'Identificador del juego',
  `nombre_juego` varchar(100) NOT NULL COMMENT 'Nombre del juego',
  `descripcion_juego` text DEFAULT NULL COMMENT 'Descripción general del juego',
  `imagen_juego` text DEFAULT NULL COMMENT 'URL o nombre del archivo de la imagen del juego',
  `estado_juego` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado activo/inactivo del juego',
  `id_categoria` int(11) NOT NULL COMMENT 'Clave foránea que enlaza la categoría del juego'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago`
--

CREATE TABLE `metodos_pago` (
  `id_metodo` int(11) NOT NULL COMMENT 'Identificador del método de pago',
  `nombre_metodo` varchar(50) NOT NULL COMMENT 'Nombre del método: Pago Móvil, Transferencia, etc.',
  `detalles_metodo` text DEFAULT NULL COMMENT 'Detalles específicos como número de cuenta o banco',
  `imagen_metodo` text DEFAULT NULL COMMENT 'Imagen QR o referencia visual del método'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL COMMENT 'Identificador único del pedido',
  `id_cliente` int(11) NOT NULL COMMENT 'Clave foránea al cliente que hace el pedido',
  `id_plan` int(11) NOT NULL COMMENT 'Clave foránea al plan de recarga solicitado',
  `id_metodo` int(11) NOT NULL COMMENT 'Clave foránea al método de pago utilizado',
  `codigo_pedido` varchar(20) NOT NULL COMMENT 'Código único para seguimiento del pedido por parte del cliente',
  `id_jugador` varchar(100) NOT NULL COMMENT 'ID del jugador al que se le aplicará la recarga',
  `captura_pago` text NOT NULL COMMENT 'URL de la imagen de la captura del pago realizado',
  `total_pedido` decimal(10,2) NOT NULL COMMENT 'Total del pedido calculado en base al plan',
  `referencia_pago` varchar(100) DEFAULT NULL COMMENT 'Referencia proporcionada por el cliente del pago',
  `fecha_pedido` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora en que se generó el pedido',
  `observaciones` text DEFAULT NULL COMMENT 'Observaciones adicionales del cliente o del sistema',
  `estado_pedido` enum('pendiente','pagado','rechazado','cancelado') NOT NULL DEFAULT 'pendiente' COMMENT 'Estado actual del pedido'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_juego`
--

CREATE TABLE `plan_juego` (
  `id_plan` int(11) NOT NULL COMMENT 'Identificador del plan de recarga',
  `id_juego` int(11) NOT NULL COMMENT 'Clave foránea al juego al que pertenece el plan',
  `nombre_plan` varchar(100) NOT NULL COMMENT 'Nombre descriptivo del plan',
  `descripcion_plan` text DEFAULT NULL COMMENT 'Detalles sobre lo que incluye el plan de recarga',
  `precio_plan` decimal(10,2) NOT NULL COMMENT 'Precio del plan en moneda local',
  `estado_plan` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado del plan (activo o inactivo)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL COMMENT 'Identificador único del rol',
  `nombre_rol` varchar(50) NOT NULL COMMENT 'Nombre del rol: administrador, cliente, etc.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL COMMENT 'Identificador único del usuario',
  `usuario` varchar(50) NOT NULL COMMENT 'Nombre de usuario para iniciar sesión',
  `clave` varchar(255) NOT NULL COMMENT 'Contraseña cifrada del usuario',
  `correo` varchar(100) NOT NULL COMMENT 'Correo electrónico del usuario',
  `id_rol` int(11) NOT NULL COMMENT 'Clave foránea al rol asignado al usuario',
  `estado` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado activo/inactivo del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_juego`
--
ALTER TABLE `categoria_juego`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Indices de la tabla `historial_estados_pedido`
--
ALTER TABLE `historial_estados_pedido`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`id_juego`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  ADD PRIMARY KEY (`id_metodo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD UNIQUE KEY `codigo_pedido` (`codigo_pedido`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_plan` (`id_plan`),
  ADD KEY `id_metodo` (`id_metodo`);

--
-- Indices de la tabla `plan_juego`
--
ALTER TABLE `plan_juego`
  ADD PRIMARY KEY (`id_plan`),
  ADD KEY `id_juego` (`id_juego`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_juego`
--
ALTER TABLE `categoria_juego`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la categoría de juego';

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del cliente';

--
-- AUTO_INCREMENT de la tabla `historial_estados_pedido`
--
ALTER TABLE `historial_estados_pedido`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del cambio en el historial';

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `id_juego` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del juego';

--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `id_metodo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del método de pago';

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del pedido';

--
-- AUTO_INCREMENT de la tabla `plan_juego`
--
ALTER TABLE `plan_juego`
  MODIFY `id_plan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del plan de recarga';

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del rol';

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del usuario';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `historial_estados_pedido`
--
ALTER TABLE `historial_estados_pedido`
  ADD CONSTRAINT `historial_estados_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `historial_estados_pedido_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `juego`
--
ALTER TABLE `juego`
  ADD CONSTRAINT `juego_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_juego` (`id_categoria`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_plan`) REFERENCES `plan_juego` (`id_plan`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`id_metodo`) REFERENCES `metodos_pago` (`id_metodo`);

--
-- Filtros para la tabla `plan_juego`
--
ALTER TABLE `plan_juego`
  ADD CONSTRAINT `plan_juego_ibfk_1` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;