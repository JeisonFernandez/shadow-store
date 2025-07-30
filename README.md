# 🎮 ShadowStore

**ShadowStore** es un sistema de gestión para una tienda en línea especializada en la venta de recargas digitales por ID para videojuegos. Combina una experiencia de compra sencilla para los clientes con un panel administrativo robusto, permitiendo una gestión eficiente de productos, pedidos y pagos.

---

## 🛠️ Características principales

- Catálogo organizado de juegos con planes de recarga activos.
- Proceso de compra intuitivo: selección de plan, método de pago y carga de comprobante.
- Generación automática de un **código único por pedido** para seguimiento fácil.
- Gestión manual de pedidos con estados actualizables: `pendiente`, `pagado`, `rechazado`, `cancelado`.
- Historial detallado de cambios de estado con fecha, usuario responsable y comentarios.
- Soporte para múltiples métodos de pago (como Pago Móvil, transferencias bancarias o criptomonedas).
- Sistema de autenticación seguro: solo usuarios registrados pueden realizar compras.
- Panel administrativo completo para gestionar juegos, planes, métodos de pago, clientes y pedidos.

---

## 📦 Tecnologías y estructura

- **Base de datos:** MySQL (esquema normalizado con relaciones claras y claves foráneas).
- **Backend:** Laravel 12 (gestión de lógica, autenticación y API).
- **Frontend:** Por definir (Blade, HTML/CSS/JS o framework moderno como Vue/React).

---

## 💡 Flujo de uso

1. El cliente navega el catálogo, selecciona un juego y un plan de recarga.
2. Completa el formulario con su ID de jugador, método de pago y **sube la captura del pago**.
3. Se genera un pedido con estado inicial `pendiente` y un código único para seguimiento.
4. El administrador revisa manualmente el comprobante y actualiza el estado del pedido.
5. El cliente puede consultar en cualquier momento el estado de su pedido.

---

## 🔐 Control de acceso

- Acceso restringido por roles: **clientes** y **administradores**.
- Registro e inicio de sesión obligatorios para realizar compras.
- Los administradores tienen acceso total al sistema desde un panel privado.

---

## 📝 Notas técnicas

- El campo `codigo_pedido` es único y legible, ideal para compartir con el cliente sin exponer IDs internos.
- Los estados del pedido están definidos como `ENUM` para mantener consistencia.
- La integridad referencial está garantizada mediante claves foráneas en todas las relaciones.
- El historial de estados (`historial_estados_pedido`) registra cada cambio con auditoría completa: quién lo hizo, cuándo y por qué.

---

## 👥 Integrantes del grupo – Sección 331

- **Jeison David Fernandez Ponce** – fernandezjeison86@gmail.com
- **Oscar David Bordones Rangel** – oscarbordones26@gmail.com
- **Ricardo Jesus Padilla Sánchez** – ricardopsj3043@gmail.com

---

✨ ¡Gracias por visitar ShadowStore!  
Un sistema diseñado para vender recargas con seguridad, claridad y control total.
