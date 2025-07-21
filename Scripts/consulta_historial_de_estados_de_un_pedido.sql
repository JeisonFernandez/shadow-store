USE shadowstore;

SELECT 
    he.fecha,
    he.estado_anterior,
    he.estado_nuevo,
    cl.nombre_cliente AS admin_nombre,
    he.comentario
FROM historial_estados_pedido he
JOIN cliente cl ON he.realizado_por = cl.id_cliente
WHERE he.id_pedido = 1
ORDER BY he.fecha ASC;