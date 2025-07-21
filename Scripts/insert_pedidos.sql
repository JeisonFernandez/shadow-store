USE shadowstore;

INSERT INTO pedido (id_pedido, codigo_pedido, id_cliente, id_metodo, fecha_pedido, total_pedido, estado_pedido, referencia_pago, captura_pago, observaciones, id_jugador) VALUES
(1, 'PED000001', 1, 1, NOW(), 4.50, 'pendiente', '123456789', 'captura1.jpg', 'Primera compra', 'freefire_123'),
(2, 'PED000002', 2, 2, NOW(), 1.20, 'pagado', NULL, 'captura2.jpg', NULL, 'mobilelegends_456'),
(3, 'PED000003', 3, 1, NOW(), 3.00, 'pagado', '987654321', 'captura3.jpg', 'Urgente', 'cod_789');
