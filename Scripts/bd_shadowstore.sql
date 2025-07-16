-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
-- Servidor: 127.0.0.1
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

create database recargas_juegos;

use recargas_juegos;

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id_categoria` int(11) NOT NULL COMMENT 'ID único de la categoría del juego',
  `nombre_categoria` varchar(100) NOT NULL COMMENT 'Nombre de la categoría del juego',
  `descripcion_categoria` text DEFAULT NULL COMMENT 'Descripción opcional del juego'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena las categorías de los juegos';

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`) VALUES
(1, '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL COMMENT 'ID único del cliente o administrador',
  `nombre_cliente` varchar(150) NOT NULL COMMENT 'Nombre del cliente',
  `correo_cliente` varchar(150) NOT NULL COMMENT 'Correo electrónico único del cliente',
  `telefono_cliente` varchar(50) NOT NULL COMMENT 'Número de teléfono del cliente',
  `clave_cliente` varchar(255) NOT NULL COMMENT 'Contraseña cifrada del cliente',
  `es_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Indica si el cliente tiene privilegios de administrador'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Usuarios del sistema, incluyendo clientes y administradores';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL COMMENT 'ID único del detalle del pedido',
  `id_pedido` int(11) NOT NULL COMMENT 'Pedido al que pertenece este detalle',
  `id_plan` int(11) NOT NULL COMMENT 'Plan de recarga seleccionado',
  `cantidad` int(11) NOT NULL COMMENT 'Cantidad de veces que se compró este plan',
  `subtotal` decimal(10,2) NOT NULL COMMENT 'Subtotal = cantidad * precio del plan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Detalle de cada producto o plan incluido en un pedido';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_estados_pedido`
--

CREATE TABLE `historial_estados_pedido` (
  `id_historial` int(11) NOT NULL COMMENT 'ID único del historial de estado',
  `id_pedido` int(11) NOT NULL COMMENT 'Pedido afectado por el cambio de estado',
  `estado_anterior` enum('pendiente','pagado','rechazado','cancelado') NOT NULL COMMENT 'Estado previo del pedido',
  `estado_nuevo` enum('pendiente','pagado','rechazado','cancelado') NOT NULL COMMENT 'Nuevo estado del pedido',
  `fecha` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora del cambio de estado',
  `realizado_por` int(11) NOT NULL COMMENT 'Administrador que realizó el cambio de estado',
  `comentario` text DEFAULT NULL COMMENT 'Comentario u observación sobre el cambio de estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Historial de cambios de estado de los pedidos, realizado por administradores';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago`
--

CREATE TABLE `metodos_pago` (
  `id_metodo` int(11) NOT NULL COMMENT 'ID único del método de pago',
  `nombre_metodo` varchar(100) NOT NULL COMMENT 'Nombre del método (ej. PagoMóvil, Binance)',
  `descripcion_metodo` text DEFAULT NULL COMMENT 'Descripción detallada del método de pago',
  `requiere_referencia` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Indica si se requiere referencia para el pago',
  `requiere_captura` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Indica si se requiere subir comprobante del pago',
  `es_manual` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Indica si la validación del pago es manual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Métodos de pago disponibles para los pedidos';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL COMMENT 'ID único del pedido realizado',
  `id_cliente` int(11) NOT NULL COMMENT 'Cliente que realizó el pedido',
  `id_metodo` int(11) NOT NULL COMMENT 'Método de pago seleccionado para este pedido',
  `fecha_pedido` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora del pedido',
  `total_pedido` decimal(10,2) NOT NULL COMMENT 'Monto total del pedido',
  `estado_pedido` enum('pendiente','pagado','rechazado','cancelado') NOT NULL DEFAULT 'pendiente' COMMENT 'Estado actual del pedido',
  `referencia_pago` varchar(100) DEFAULT NULL COMMENT 'Número de referencia del pago (si aplica)',
  `captura_pago` varchar(255) DEFAULT NULL COMMENT 'URL o nombre del archivo del comprobante de pago (imagen)',
  `observaciones` text DEFAULT NULL COMMENT 'Comentarios u observaciones adicionales del pedido',
  `id_jugador` varchar(100) NOT NULL COMMENT 'ID del jugador al que se realizará la recarga'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Pedidos realizados por los clientes con método de pago e ID de jugador';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_producto`
--

CREATE TABLE `plan_producto` (
  `id_plan` int(11) NOT NULL COMMENT 'ID único del plan de recarga',
  `id_producto` int(11) NOT NULL COMMENT 'juego al que pertenece este plan',
  `nombre_plan` varchar(100) NOT NULL COMMENT 'Nombre del plan (ej. Lux 99 diamantes)',
  `precio_plan` decimal(10,2) NOT NULL COMMENT 'Precio del plan en la moneda local',
  `estado_plan` enum('activo','inactivo') NOT NULL DEFAULT 'activo' COMMENT 'Estado del plan de recarga'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Planes de recarga disponibles para cada juego';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL COMMENT 'ID único del producto (juego)',
  `nombre_producto` varchar(150) NOT NULL COMMENT 'Nombre del juego',
  `descripcion_producto` text DEFAULT NULL COMMENT 'Descripción detallada del producto',
  `imagen_producto` varchar(255) DEFAULT NULL COMMENT 'URL de la imagen del juego',
  `estado_producto` enum('activo','inactivo') NOT NULL DEFAULT 'activo' COMMENT 'Estado actual del juego',
  `id_categoria` int(11) NOT NULL COMMENT 'Categoría a la que pertenece el juego'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena los juegos disponibles para recargar';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `correo_cliente` (`correo_cliente`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_plan` (`id_plan`);

--
-- Indices de la tabla `historial_estados_pedido`
--
ALTER TABLE `historial_estados_pedido`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `realizado_por` (`realizado_por`);

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
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_metodo` (`id_metodo`);

--
-- Indices de la tabla `plan_producto`
--
ALTER TABLE `plan_producto`
  ADD PRIMARY KEY (`id_plan`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único de la categoría del juego', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único del cliente o administrador';

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único del detalle del pedido';

--
-- AUTO_INCREMENT de la tabla `historial_estados_pedido`
--
ALTER TABLE `historial_estados_pedido`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único del historial de estado';

--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `id_metodo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único del método de pago';

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único del pedido realizado';

--
-- AUTO_INCREMENT de la tabla `plan_producto`
--
ALTER TABLE `plan_producto`
  MODIFY `id_plan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único del plan de recarga';

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único del producto (juego)';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_plan`) REFERENCES `plan_producto` (`id_plan`);

--
-- Filtros para la tabla `historial_estados_pedido`
--
ALTER TABLE `historial_estados_pedido`
  ADD CONSTRAINT `historial_estados_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `historial_estados_pedido_ibfk_2` FOREIGN KEY (`realizado_por`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_metodo`) REFERENCES `metodos_pago` (`id_metodo`);

--
-- Filtros para la tabla `plan_producto`
--
ALTER TABLE `plan_producto`
  ADD CONSTRAINT `plan_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_producto` (`id_categoria`);

