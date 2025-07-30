USE shadowstore;

SELECT 
    pe.id_pedido,
    pe.codigo_pedido,
    cl.nombre_cliente,
    pe.fecha_pedido,
    pe.total_pedido,
    mp.nombre_metodo,
    pe.estado_pedido,
    pe.referencia_pago,
    pe.captura_pago
FROM pedido pe
JOIN cliente cl ON pe.id_cliente = cl.id_cliente
JOIN metodos_pago mp ON pe.id_metodo = mp.id_metodo
WHERE pe.estado_pedido = 'pendiente'
ORDER BY pe.fecha_pedido ASC;
