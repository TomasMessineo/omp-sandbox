# OMP Sandbox Multi-Versión (3.3, 3.4 y 3.5)

Entorno Docker reproducible y aislado para desarrollo y pruebas en **Open Monograph Press (OMP)** con MySQL 8.0 y phpMyAdmin.

---

## 🚀 Inicio Rápido

### 1. Inicializar permisos y directorios
```bash
make init
```

### 2. Levantar una versión específica
- **OMP 3.3 (PHP 7.4):**
  ```bash
  make up-33
  ```
  Acceso: [http://localhost:8033](http://localhost:8033)

- **OMP 3.4 (PHP 8.0):**
  ```bash
  make up-34
  ```
  Acceso: [http://localhost:8034](http://localhost:8034)

- **OMP 3.5 (PHP 8.2):**
  ```bash
  make up-35
  ```
  Acceso: [http://localhost:8035](http://localhost:8035)

- **phpMyAdmin:**
  Acceso: [http://localhost:8081](http://localhost:8081)

### 3. Detener los servicios
```bash
make down
```

---

## 🗄️ Datos de Conexión a la Base de Datos

| Parámetro | Valor |
| :--- | :--- |
| **Host** | `db` (desde contenedor) / `localhost` (desde host) |
| **Puerto** | `3306` (red interna Docker) / `3307` (host) |
| **Usuario BD** | `omp` |
| **Contraseña BD** | `omp` |
| **Usuario Root** | `root` / `root` |
| **Base OMP 3.3** | `omp_33` |
| **Base OMP 3.4** | `omp_34` |
| **Base OMP 3.5** | `omp_35` |
| **Directorio de archivos** | `/var/www/files` |

---

## 📸 Snapshots de Base de Datos y Configuración

Para respaldar el estado de una versión luego de instalarla o configurarla:
```bash
make snapshot-33
make snapshot-34
make snapshot-35
```
Esto guardará automáticamente los dumps SQL en `fixtures/sql/omp<VER>-seed.sql` y las configuraciones en `fixtures/configs/config.omp<VER>.php`.
