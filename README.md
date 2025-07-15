# ShadowStore 🎮

**ShadowStore** es un sistema integral de gestión para una tienda online enfocada en la venta de recargas digitales por ID para videojuegos. El sistema incluye tanto una interfaz pública para los clientes como un panel administrativo para la gestión de pedidos, verificación de pagos y administración de productos.

## 🛠️ Características principales

- Catálogo en línea de juegos con planes de recarga definidos
- Formulario de compra con selección de plan, método de pago y carga de captura
- Gestión de pedidos y validación manual por administradores
- Panel de administración con control total de productos, métodos de pago y usuarios
- Historial de cambios de estado en pedidos para trazabilidad
- Soporte para múltiples métodos de pago (Pago Móvil, Binance Pay, etc.)
- Acceso con inicio de sesión obligatorio para realizar pedidos

## 📦 Estructura del proyecto

- **Base de datos:** MySQL
- **Frontend:** (a definir: HTML/CSS/JS, Blade, etc.)
- **Backend:** Laravel 12

## 💡 Flujo del cliente

1. El cliente navega el catálogo de juegos.
2. Selecciona un juego y un plan de recarga.
3. Llena el formulario: ID del jugador, teléfono, correo, método de pago y captura.
4. Se genera el pedido con estado “pendiente”.
5. El administrador valida manualmente el pago y actualiza el estado.
6. El cliente puede verificar el estado del pedido desde una página de seguimiento.

## 🔐 Acceso

- Los pedidos solo pueden ser realizados por **usuarios registrados**.
- Los administradores tienen acceso a un panel privado para la gestión total del sistema.

## 📁 Scripts incluidos

- Por definir...
