USE shadowstore;

SELECT 
    pe.id_pedido,
    pe.codigo_pedido,
    cl.nombre_cliente,
    pe.fecha_pedido,
    pe.total_pedido,
    pe.estado_pedido,
    pe.id_jugador
FROM pedido pe
JOIN cliente cl ON pe.id_cliente = cl.id_cliente
ORDER BY pe.fecha_pedido DESC;