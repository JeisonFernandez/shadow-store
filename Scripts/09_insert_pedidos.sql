USE shadowstore;

INSERT INTO pedido (id_cliente, id_plan, id_metodo, codigo_pedido, id_jugador, captura_pago, total_pedido, referencia_pago, observaciones, estado_pedido)
VALUES
(1, 1, 1, 'A1B2C3', 'userCODM123', 'captura1.png', 5.00, 'REF123', 'Sin observaciones', 'pendiente'),
(2, 3, 2, 'D4E5F6', 'ffplayer456', 'captura2.png', 3.50, 'REF456', 'Cliente frecuente', 'rechazado'),
(3, 5, 3, 'G7H8I9', 'wildrift789', 'captura3.png', 5.25, 'REF789', NULL, 'pagado');
