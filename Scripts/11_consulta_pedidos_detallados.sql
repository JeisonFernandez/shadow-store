USE shadowstore;

SELECT 
    p.id_pedido,
    c.nombre_cliente,
    c.apellido_cliente,
    j.nombre_juego,
    pl.nombre_plan,
    mp.nombre_metodo,
    p.total_pedido,
    p.estado_pedido,
    p.fecha_pedido
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id_cliente
JOIN plan_juego pl ON p.id_plan = pl.id_plan
JOIN juego j ON pl.id_juego = j.id_juego
JOIN metodos_pago mp ON p.id_metodo = mp.id_metodo;
