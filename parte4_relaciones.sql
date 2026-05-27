CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dias_estimados INTEGER NOT NULL CHECK (dias_estimados > 0)
);

SELECT * FROM proyectos

CREATE TABLE tecnologias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL
);

SELECT * FROM tecnologias

CREATE TABLE proyectos_tecnologias (
    id_proyecto INTEGER NOT NULL,
    id_tecnologia INTEGER NOT NULL,

    PRIMARY KEY (id_proyecto, id_tecnologia),

    FOREIGN KEY (id_proyecto)
        REFERENCES proyectos(id),

    FOREIGN KEY (id_tecnologia)
        REFERENCES tecnologias(id)
);

SELECT * FROM proyectos_tecnologias

INSERT INTO proyectos (nombre, dias_estimados)
VALUES
('Sistema Bancario', 120),
('Tienda Virtual', 90),
('App Delivery', 60);

SELECT * FROM proyectos

INSERT INTO tecnologias (nombre, categoria)
VALUES
('Java', 'Backend'),
('React', 'Frontend'),
('PostgreSQL', 'Base de Datos'),
('Spring Boot', 'Backend');

SELECT * FROM tecnologias


INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia)
VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3);

SELECT * FROM proyectos_tecnologias

-- Mostrar las tecnologías utilizadas en el proyecto Sistema Bancario

SELECT t.nombre, t.categoria FROM proyectos p JOIN proyectos_tecnologias pt
ON p.id = pt.id_proyecto JOIN tecnologias t ON t.id = pt.id_tecnologia
WHERE p.nombre = 'Sistema Bancario';

-- Mostrar los proyectos que utilizan la tecnología con id = 1

SELECT p.nombre, p.dias_estimados FROM tecnologias t JOIN proyectos_tecnologias pt
ON t.id = pt.id_tecnologia JOIN proyectos p ON p.id = pt.id_proyecto
WHERE t.id = 1;

-- Mostrar cuántos proyectos utilizan cada tecnología

SELECT t.nombre,COUNT(pt.id_proyecto) AS total_proyectos
FROM tecnologias t JOIN proyectos_tecnologias pt ON t.id = pt.id_tecnologia
GROUP BY t.nombre
ORDER BY total_proyectos DESC;

