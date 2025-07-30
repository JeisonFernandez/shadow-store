USE shadowstore;

SELECT 
    mp.nombre_metodo,
    COUNT(p.id_pedido) AS cantidad_pedidos,
    SUM(p.total_pedido) AS total_ingresado
FROM pedido p
JOIN metodos_pago mp ON p.id_metodo = mp.id_metodo
WHERE p.estado_pedido = 'pagado'
GROUP BY mp.id_metodo;
