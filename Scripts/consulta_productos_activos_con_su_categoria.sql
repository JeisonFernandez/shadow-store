USE shadowstore;

SELECT 
    p.id_producto, 
    p.nombre_producto, 
    p.descripcion_producto, 
    p.estado_producto,
    c.nombre_categoria
FROM producto p
JOIN categoria_producto c ON p.id_categoria = c.id_categoria
WHERE p.estado_producto = 'activo';