USE shadowstore;

INSERT INTO historial_estados_pedido (id_historial, id_pedido, estado_anterior, estado_nuevo, fecha, realizado_por, comentario) VALUES
(1, 1, 'pendiente', 'pendiente', NOW(), 2, 'Pago confirmado'),
(2, 2, 'pendiente', 'pagado', NOW(), 2, 'Pago confirmado'),
(3, 3, 'pendiente', 'pagado', NOW(), 2, 'Pago verificado');