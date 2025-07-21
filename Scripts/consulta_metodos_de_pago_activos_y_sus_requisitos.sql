USE shadowstore;

SELECT 
    id_metodo,
    nombre_metodo,
    requiere_referencia,
    requiere_captura,
    es_manual
FROM metodos_pago;