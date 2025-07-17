# ShadowStore 🎮

**ShadowStore** es un sistema integral para una tienda online especializada en la venta de recargas digitales por ID para videojuegos. Ofrece una interfaz para clientes y un panel administrativo para la gestión completa de productos, pedidos y pagos.

---

## 🛠️ Características principales

- Catálogo online con juegos y planes de recarga activos
- Formulario de compra con selección de plan, método de pago y carga de captura
- Generación automática de código único para cada pedido
- Gestión manual de pedidos y actualización de estados (`pendiente`, `pagado`, `rechazado`, `cancelado`)
- Historial detallado de cambios de estado para trazabilidad
- Soporte para múltiples métodos de pago: Pago Móvil, Binance Pay, PayPal, tarjeta de crédito
- Control de acceso mediante registro e inicio de sesión obligatorio
- Panel administrativo para gestión total del sistema (productos, planes, pagos, usuarios y pedidos)

---

## 📦 Estructura del proyecto

- **Base de datos:** MySQL (con esquema normalizado y relaciones bien definidas)
- **Backend:** Laravel 12
- **Frontend:** (por definir: HTML/CSS/JS, Blade, Vue, React, etc.)

---

## 💡 Flujo del cliente

1. Navega el catálogo y selecciona un juego y un plan de recarga
2. Completa formulario con ID del jugador, datos de contacto, método de pago y captura de pago
3. Se crea un pedido con código único y estado inicial `pendiente`
4. Administrador valida manualmente el pago y actualiza el estado del pedido
5. Cliente puede consultar el estado y detalles de su pedido desde la plataforma

---

## 🔐 Acceso

- Solo usuarios registrados pueden realizar pedidos
- Los administradores tienen acceso a un panel privado para gestionar todo el sistema

---

## 📁 Scripts incluidos

- `insert_test.sql`: inserción de datos iniciales para categorías, productos, planes, clientes, métodos de pago, pedidos, detalles y historial de estados
- `consulta_test.sql`: consultas para obtener información completa de pedidos, detalles y historial de estados

---

## 📝 Notas técnicas

- La tabla `pedido` tiene un campo `codigo_pedido` único y legible, separado del ID auto-incremental
- Los estados del pedido son un enum: `pendiente`, `pagado`, `rechazado` y `cancelado`
- Claves foráneas estrictas garantizan integridad referencial entre tablas
- El historial de estados registra fecha, usuario que realiza el cambio y comentarios opcionales para auditoría

---

¡Gracias por visitar ShadowStore! 🎉
