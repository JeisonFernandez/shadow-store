USE shadowstore;

INSERT INTO metodos_pago (nombre_metodo, detalles_metodo, imagen_metodo) VALUES
('Pago Móvil', 'Banco: BNC, Tel: 0414XXXXXXX, CI: V12345678', 'qr_pago_movil.png'),
('Transferencia Binance', 'Binance ID: 8392012390, Red: BEP20', 'qr_binance.png'),
('Zelle', 'Correo: recargas@shadowstore.com', 'qr_zelle.png');
