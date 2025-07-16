--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`) VALUES
(1, 'MOBA', 'Juegos de arena de batalla multijugador en línea.'),
(2, 'Battle Royale', 'Juegos donde el último jugador o equipo en pie gana.'),
(3, 'FPS', 'Juegos de disparos en primera persona.'),
(4, 'RPG', 'Juegos de rol con elementos de fantasía y aventura.'),
(5, 'Estrategia', 'Juegos que requieren planificación y toma de decisiones tácticas.');

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `descripcion_producto`, `imagen_producto`, `estado_producto`, `id_categoria`) VALUES
(1, 'Mobile Legends: Bang Bang', 'Juego MOBA 5v5 para móviles.', 'https://placehold.co/150x150/000000/FFFFFF?text=MLBB', 'activo', 1),
(2, 'Free Fire', 'Popular juego Battle Royale para móviles.', 'https://placehold.co/150x150/000000/FFFFFF?text=FreeFire', 'activo', 2),
(3, 'Call of Duty Mobile', 'Juego FPS de acción intensa para móviles.', 'https://placehold.co/150x150/000000/FFFFFF?text=CODM', 'activo', 3),
(4, 'Genshin Impact', 'Juego de rol de acción de mundo abierto.', 'https://placehold.co/150x150/000000/FFFFFF?text=Genshin', 'activo', 4),
(5, 'Clash Royale', 'Juego de estrategia en tiempo real con cartas.', 'https://placehold.co/150x150/000000/FFFFFF?text=ClashRoyale', 'activo', 5),
(6, 'PUBG Mobile', 'Otro popular juego Battle Royale.', 'https://placehold.co/150x150/000000/FFFFFF?text=PUBGM', 'activo', 2);

--
-- Volcado de datos para la tabla `plan_producto`
--

INSERT INTO `plan_producto` (`id_plan`, `id_producto`, `nombre_plan`, `precio_plan`, `estado_plan`) VALUES
(101, 1, '50 Diamantes MLBB', 0.99, 'activo'),
(102, 1, '100 Diamantes MLBB', 1.89, 'activo'),
(103, 1, '250 Diamantes MLBB', 4.50, 'activo'),
(201, 2, '100 Diamantes Free Fire', 1.00, 'activo'),
(202, 2, '300 Diamantes Free Fire', 2.80, 'activo'),
(203, 2, '500 Diamantes Free Fire', 4.50, 'activo'),
(301, 3, '500 CP CoD Mobile', 4.99, 'activo'),
(302, 3, '1000 CP CoD Mobile', 9.50, 'activo'),
(401, 4, '60 Cristales Génesis Genshin', 0.99, 'activo'),
(402, 4, '300 Cristales Génesis Genshin', 4.50, 'activo'),
(501, 5, '80 Gemas Clash Royale', 0.99, 'activo'),
(502, 5, '500 Gemas Clash Royale', 5.00, 'activo'),
(601, 6, '60 UC PUBG Mobile', 0.99, 'activo'),
(602, 6, '300 UC PUBG Mobile', 4.50, 'activo');

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre_cliente`, `correo_cliente`, `telefono_cliente`, `clave_cliente`, `es_admin`) VALUES
(1, 'Juan Perez', 'juan.perez@example.com', '1234567890', 'clavehashjp123', 0),
(2, 'Maria Garcia', 'maria.garcia@example.com', '0987654321', 'clavehashmg456', 0),
(3, 'Admin User', 'admin@example.com', '1122334455', 'clavehashadmin789', 1),
(4, 'Carlos Lopez', 'carlos.lopez@example.com', '5544332211', 'clavehashcl789', 0);

--
-- Volcado de datos para la tabla `metodos_pago`
--

INSERT INTO `metodos_pago` (`id_metodo`, `nombre_metodo`, `descripcion_metodo`, `requiere_referencia`, `requiere_captura`, `es_manual`) VALUES
(1, 'PagoMóvil', 'Transferencia bancaria a través de PagoMóvil.', 1, 1, 1),
(2, 'Binance Pay', 'Pago a través de Binance Pay.', 1, 1, 1),
(3, 'PayPal', 'Pago seguro a través de PayPal.', 0, 0, 0),
(4, 'Tarjeta de Crédito', 'Pago con tarjeta de crédito/débito.', 0, 0, 0);

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_cliente`, `id_metodo`, `fecha_pedido`, `total_pedido`, `estado_pedido`, `referencia_pago`, `captura_pago`, `observaciones`, `id_jugador`) VALUES
(1, 1, 1, '2024-07-15 10:00:00', 4.50, 'pendiente', 'REF12345', 'captura_pago_1.jpg', 'Recarga para evento especial.', 'MLBB_ID_12345'),
(2, 2, 2, '2024-07-15 11:30:00', 2.80, 'pagado', 'BINANCE67890', 'captura_pago_2.png', NULL, 'FF_ID_67890'),
(3, 1, 3, '2024-07-16 09:15:00', 1.89, 'pagado', NULL, NULL, 'Regalo para un amigo.', 'MLBB_ID_54321'),
(4, 4, 1, '2024-07-16 14:00:00', 9.50, 'pendiente', 'REF98765', 'captura_pago_4.jpg', 'Urgente, para torneo.', 'CODM_ID_98765'),
(5, 2, 4, '2024-07-16 16:45:00', 4.50, 'rechazado', NULL, NULL, 'Pago fallido por tarjeta.', 'Genshin_ID_11223'),
(6, 1, 1, '2024-07-17 08:00:00', 1.00, 'pendiente', 'REF55555', 'captura_pago_6.jpg', NULL, 'FF_ID_77889');

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle`, `id_pedido`, `id_plan`, `cantidad`, `subtotal`) VALUES
(1, 1, 103, 1, 4.50), -- Pedido 1: 1 x 250 Diamantes MLBB
(2, 2, 202, 1, 2.80), -- Pedido 2: 1 x 300 Diamantes Free Fire
(3, 3, 102, 1, 1.89), -- Pedido 3: 1 x 100 Diamantes MLBB
(4, 4, 302, 1, 9.50), -- Pedido 4: 1 x 1000 CP CoD Mobile
(5, 5, 402, 1, 4.50), -- Pedido 5: 1 x 300 Cristales Génesis Genshin
(6, 6, 201, 1, 1.00); -- Pedido 6: 1 x 100 Diamantes Free Fire

--
-- Volcado de datos para la tabla `historial_estados_pedido`
--

INSERT INTO `historial_estados_pedido` (`id_historial`, `id_pedido`, `estado_anterior`, `estado_nuevo`, `fecha`, `realizado_por`, `comentario`) VALUES
(1, 2, 'pendiente', 'pagado', '2024-07-15 11:35:00', 3, 'Pago verificado y confirmado.'),
(2, 5, 'pendiente', 'rechazado', '2024-07-16 16:50:00', 3, 'Transacción de tarjeta rechazada por el banco.'),
(3, 3, 'pendiente', 'pagado', '2024-07-16 09:20:00', 3, 'Pago automático de PayPal procesado.');
