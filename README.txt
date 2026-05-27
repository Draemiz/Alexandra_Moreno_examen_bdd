# Examen Práctico Evaluativo - Desarrollo Backend

Examen Práctico Evaluativo: Taller de Desarrollo Backend 
Alexandra Moreno

Parte 1: PostgreSQL Básico y Manipulación de Datos

En esta parte se creó una tabla llamada `vuelos` utilizando PostgreSQL para almacenar información relacionada con vuelos.

La tabla contiene:
- id
- codigo
- precio_boleto
- asientos_disponibles

También se generaron 20 registros utilizando apoyo de Inteligencia Artificial para simular datos reales.

Posteriormente se realizaron consultas SQL para:
- detectar vuelos con pocos asientos disponibles
- actualizar precios
- eliminar vuelos sin disponibilidad

- Script utilizado
sql
CREATE TABLE vuelos (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL UNIQUE,
    precio_boleto NUMERIC(10,2) NOT NULL CHECK (precio_boleto >= 0),
    asientos_disponibles INTEGER NOT NULL CHECK (asientos_disponibles >= 0)
);

Parte 2: Spring Boot API REST, Hibernate & JPA

En esta parte se desarrolló una API REST utilizando:

Spring Boot
PostgreSQL
Spring Data JPA
Hibernate

La aplicación permite realizar operaciones CRUD sobre la tabla vuelos.

Arquitectura utilizada

El proyecto fue organizado en capas siguiendo la estructura solicitada:

src/main/java/com/krakedev/examen/vuelos

controllers
entities
repositories
services

Funcionalidades implementadas
Crear vuelos
Listar vuelos
Buscar vuelos por ID
Actualizar vuelos
Eliminar vuelos
Método personalizado de búsqueda por precio


Tecnologías utilizadas
Java
Spring Boot
PostgreSQL
Maven
Bruno en lugar de Postman

Manejo de respuestas HTTP

Se utilizó ResponseEntity<?> para manejar respuestas semánticas HTTP.
También se implementó manejo de excepciones utilizando bloques try-catch.

Método personalizado implementado:
En el repositorio se implementó el siguiente método personalizado:
List<Vuelo> findByPrecioBoletoLessThan(BigDecimal precio);
Este método permite buscar vuelos con precio menor a un valor específico.

Parte 3: Mantenimiento y Extensibilidad

En esta parte se realizó una modificación al sistema para agregar el nuevo atributo destino a los vuelos.
Modificación de la tabla vuelos en PostgreSQL
Actualización de la entidad Vuelo.java
Ajustes en la capa service
Actualización de payloads JSON en Bruno/Postman

Script SQL utilizado:

ALTER TABLE vuelos
ADD COLUMN destino VARCHAR(100);

Pruebas realizadas

Se realizaron pruebas CRUD utilizando Bruno

Videos Explicativo:
https://drive.google.com/drive/folders/1ABuB9oT52d2WM_pP3WLxG1rvsXj-0A0q?usp=sharing

Parte 4 - Relaciones Muchos a Muchos

En esta parte se modeló una relación muchos a muchos entre proyectos y tecnologías utilizando PostgreSQL.

Se crearon las tablas:
- proyectos
- tecnologias
- proyectos_tecnologias

La tabla intermedia `proyectos_tecnologias` contiene llaves foráneas y una llave primaria compuesta para evitar registros duplicados.

También se realizaron consultas SQL utilizando JOIN para:
- obtener tecnologías utilizadas en un proyecto
- consultar proyectos que usan una tecnología
- generar un reporte del uso de tecnologías utilizando COUNT y GROUP BY


