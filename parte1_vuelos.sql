CREATE TABLE vuelos (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL UNIQUE,
    precio_boleto NUMERIC(10,2) NOT NULL CHECK (precio_boleto >= 0),
    asientos_disponibles INTEGER NOT NULL CHECK (asientos_disponibles >= 0)
);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AA-101', 120.50, 50);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('LA-202', 450.00, 10);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AV-303', 300.75, 0);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('IB-404', 999.99, 2);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('DL-505', 150.00, 25);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('UA-606', 700.20, 3);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('EM-707', 1200.00, 80);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('KL-808', 350.40, 15);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AF-909', 870.00, 0);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('CM-111', 220.10, 7);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AA-222', 180.00, 4);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('LA-333', 1450.00, 100);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AV-444', 600.60, 1);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('IB-555', 410.80, 9);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('DL-666', 250.00, 0);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('UA-777', 980.99, 60);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('EM-888', 1100.00, 12);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('KL-999', 320.45, 5);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AF-121', 760.00, 0);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('CM-232', 199.99, 45);

SELECT * FROM vuelos
WHERE asientos_disponibles < 5;

UPDATE vuelos SET precio_boleto = precio_boleto * 1.15
WHERE id = 1;

DELETE FROM vuelos
WHERE asientos_disponibles = 0;