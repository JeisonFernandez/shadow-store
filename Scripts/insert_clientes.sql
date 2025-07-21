USE shadowstore;

INSERT INTO cliente (id_cliente, nombre_cliente, correo_cliente, telefono_cliente, clave_cliente, es_admin) VALUES
(1, 'Carlos Pérez', 'carlos@example.com', '04141234567', 'hashedpass1', 0),
(2, 'Laura Díaz', 'laura@example.com', '04147654321', 'hashedpass2', 1),
(3, 'José Ramírez', 'jose@example.com', '04145551234', 'hashedpass3', 0);
