USE shadowstore;

INSERT INTO historial_estados_pedido (id_pedido, id_user, estado_anterior, nuevo_estado, comentario)
VALUES
(1, 1, 'pendiente', 'pagado', 'Pago verificado por admin'),
(2, 1, 'pendiente', 'rechazado', 'Pago no válido'),
(3, 1, 'pendiente', 'pagado', 'Pago confirmado sin problemas');
