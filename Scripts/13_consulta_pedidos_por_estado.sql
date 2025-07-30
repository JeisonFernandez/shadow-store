USE shadowstore;

SELECT estado_pedido, COUNT(*) AS total_pedidos
FROM pedido
GROUP BY estado_pedido;
