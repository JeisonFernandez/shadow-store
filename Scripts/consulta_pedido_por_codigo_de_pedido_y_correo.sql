USE shadowstore;

SELECT 
    pe.id_pedido,
    pe.codigo_pedido,
    cl.nombre_cliente,
    pe.estado_pedido,
    pe.total_pedido,
    pe.fecha_pedido
FROM pedido pe
JOIN cliente cl ON pe.id_cliente = cl.id_cliente
WHERE pe.codigo_pedido = 'PED000002' AND cl.correo_cliente = 'laura@example.com';