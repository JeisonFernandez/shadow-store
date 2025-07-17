USE shadowstore;

-- Categorías de productos
INSERT INTO categoria_producto (id_categoria, nombre_categoria, descripcion_categoria) VALUES
(1, 'Juegos', 'Recargas y monedas para videojuegos');

-- Productos
INSERT INTO producto (id_producto, nombre_producto, descripcion_producto, imagen_producto, estado_producto, id_categoria) VALUES
(1, 'Free Fire', 'Recargas de diamantes para Free Fire', 'freefire.jpg', 'activo', 1),
(2, 'Mobile Legends', 'Recargas de diamantes para Mobile Legends', 'mobilelegends.jpg', 'activo', 1),
(3, 'Call of Duty', 'Recargas para Call of Duty', 'cod.jpg', 'activo', 1);

-- Planes de productos
INSERT INTO plan_producto (id_plan, id_producto, nombre_plan, precio_plan, estado_plan) VALUES
(1, 1, '100 Diamantes', 1.00, 'activo'),
(2, 1, '500 Diamantes', 4.50, 'activo'),
(3, 2, '100 Diamantes ML', 1.20, 'activo'),
(4, 3, '100 Créditos COD', 3.00, 'activo'),
(5, 3, '500 Créditos COD', 13.00, 'activo');

-- Clientes
INSERT INTO cliente (id_cliente, nombre_cliente, correo_cliente, telefono_cliente, clave_cliente, es_admin) VALUES
(1, 'Carlos Pérez', 'carlos@example.com', '04141234567', 'hashedpass1', 0),
(2, 'Laura Díaz', 'laura@example.com', '04147654321', 'hashedpass2', 1),
(3, 'José Ramírez', 'jose@example.com', '04145551234', 'hashedpass3', 0);

-- Métodos de pago
INSERT INTO metodos_pago (id_metodo, nombre_metodo, descripcion_metodo, requiere_referencia, requiere_captura, es_manual) VALUES
(1, 'Pago Móvil', 'Transferencia bancaria vía pago móvil', 1, 1, 1),
(2, 'Binance Pay', 'Pago a través de Binance Pay', 0, 1, 1),
(3, 'Zelle', 'Pago internacional vía Zelle', 0, 1, 1);

-- Pedidos
INSERT INTO pedido (id_pedido, codigo_pedido, id_cliente, id_metodo, fecha_pedido, total_pedido, estado_pedido, referencia_pago, captura_pago, observaciones, id_jugador) VALUES
(1, 'PED000001', 1, 1, NOW(), 4.50, 'pendiente', '123456789', 'captura1.jpg', 'Primera compra', 'freefire_123'),
(2, 'PED000002', 2, 2, NOW(), 1.20, 'pagado', NULL, 'captura2.jpg', NULL, 'mobilelegends_456'),
(3, 'PED000003', 3, 1, NOW(), 3.00, 'pagado', '987654321', 'captura3.jpg', 'Urgente', 'cod_789');

-- Detalle de pedidos
INSERT INTO detalle_pedido (id_detalle, id_pedido, id_plan, cantidad, subtotal) VALUES
(1, 1, 2, 1, 4.50),
(2, 2, 3, 1, 1.20),
(3, 3, 4, 1, 3.00);

-- Historial de estados de pedido
INSERT INTO historial_estados_pedido (id_historial, id_pedido, estado_anterior, estado_nuevo, fecha, realizado_por, comentario) VALUES
(1, 1, 'pendiente', 'pendiente', NOW(), 2, 'Pago confirmado'),
(2, 2, 'pendiente', 'pagado', NOW(), 2, 'Pago confirmado'),
(3, 3, 'pendiente', 'pagado', NOW(), 2, 'Pago verificado');
