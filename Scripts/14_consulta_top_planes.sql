USE shadowstore;

SELECT 
    pl.nombre_plan,
    COUNT(p.id_pedido) AS veces_comprado
FROM pedido p
JOIN plan_juego pl ON p.id_plan = pl.id_plan
GROUP BY p.id_plan
ORDER BY veces_comprado DESC
LIMIT 5;
