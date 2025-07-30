USE shadowstore;

SELECT 
    h.id_historial,
    p.codigo_pedido,
    u.usuario AS admin_usuario,
    h.estado_anterior,
    h.nuevo_estado,
    h.fecha_cambio,
    h.comentario
FROM historial_estados_pedido h
JOIN pedido p ON h.id_pedido = p.id_pedido
JOIN users u ON h.id_user = u.id_user;
