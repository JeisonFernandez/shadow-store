USE shadowstore;

SELECT *
FROM pedido
WHERE DATE(fecha_pedido) = CURDATE() AND estado_pedido = 'pendiente';
