# Implementación de Aplicación de Reservas en AWS

## Requisitos Previos

- Cuenta en Amazon AWS con permisos para:
  - RDS (Relational Database Service)
  - Elastic Beanstalk
  - EC2 (Elastic Compute Cloud)
- Cliente de base de datos (HeidiSQL u otra herramienta equivalente)

### Componentes Clave

- **Backend**: Microservicio basado en Symfony encapsulado en un contenedor Docker. Se encuentra dentro de una VPC para mayor seguridad y accede a una base de datos MariaDB (RDS).
- **Frontend**: Aplicación web que obtiene la información del backend a través de API internas.
- **VPC**: Red privada dentro de AWS que facilita la comunicación segura entre los servicios.
- **RDS**: Instancia de base de datos MariaDB utilizada por el backend.

## Software Utilizado en los Contenedores

- Servidor Apache2
- PHP 8.3 con módulos necesarios
- Composer para la gestión de dependencias
- Herramientas esenciales de Ubuntu 24.04

## Procedimiento de Implementación

### 1. Configuración de la Base de Datos (RDS)

1. Ingresar a la consola de AWS y navegar a RDS.
2. Crear una nueva instancia de base de datos.
3. Seleccionar MariaDB o MySQL en la opción de capa gratuita.
4. Configurar credenciales (usuario y contraseña) y habilitar acceso público para la importación inicial de datos.
5. Finalizar la configuración y crear la base de datos.

### 2. Configuración del Backend

1. Editar el archivo `Dockerfile` y actualizar la conexión a la base de datos:
   ```
   ENV DATABASE_URL=mysql://usuario:contraseña@hostDB:3306/nombreBD?serverVersion=10.6.18-MariaDB&charset=utf8mb4
   ```
2. Sustituir los valores:
   - `usuario`: Nombre de usuario configurado en RDS.
   - `contraseña`: Contraseña establecida en RDS.
   - `hostDB`: Dirección DNS de la base de datos en AWS.
   - `nombreBD`: Nombre de la base de datos.

#### Importación de Datos

1. Descargar e instalar HeidiSQL.

2. Conectarse a la base de datos remota.

3. Crear la base de datos y ejecutar el script `installMe.sql`.

### 3. Despliegue del Backend en Elastic Beanstalk

1. Ir a Elastic Beanstalk y crear una nueva aplicación.
2. Definir un nombre para la aplicación y su entorno.
3. Seleccionar "Plataforma Docker" sobre Amazon Linux 2023.
4. Comprimir el contenido del backend en un archivo ZIP (excluyendo `docker-compose.yml`).
5. Subir el archivo ZIP al entorno de AWS y proceder con la configuración.
6. Seleccionar la VPC y subred configuradas previamente.
7. Completar la implementación.

### 4. Configuración del Frontend

1. Editar el `Dockerfile` para actualizar la conexión con el backend:
   ```
   RUN sed -i 's/<backend_domain>/dominio_backend/g' /var/www/html/main-ZKT6JCA3.js
   ```
2. Reemplazar `dominio_backend` con la URL generada en Elastic Beanstalk.

### 5. Despliegue del Frontend en Elastic Beanstalk

1. Crear una nueva aplicación en Elastic Beanstalk.
2. Elegir "Plataforma Docker" y Amazon Linux 2023.
3. Comprimir el frontend en un archivo ZIP (excluyendo `docker-compose.yml`).
4. Subir el archivo a AWS y proceder con la configuración.
5. Asignar la misma VPC y subred utilizada en el backend.
6. Habilitar IP pública para acceder a la web.
7. Completar la implementación.

---

Este documento proporciona una guía optimizada para la implementación de la aplicación en AWS, asegurando una infraestructura robusta y segura.

