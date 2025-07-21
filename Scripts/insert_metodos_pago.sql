USE shadowstore;

INSERT INTO metodos_pago (id_metodo, nombre_metodo, descripcion_metodo, requiere_referencia, requiere_captura, es_manual) VALUES
(1, 'Pago Móvil', 'Transferencia bancaria vía pago móvil', 1, 1, 1),
(2, 'Binance Pay', 'Pago a través de Binance Pay', 0, 1, 1),
(3, 'Zelle', 'Pago internacional vía Zelle', 0, 1, 1);