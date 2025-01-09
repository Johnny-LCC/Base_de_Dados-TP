CREATE USER 'organizador'@'localhost' IDENTIFIED BY 'PassWord123';
GRANT ALL PRIVILEGES ON eventodesportivo.* TO 'organizador'@'localhost';

CREATE USER 'gerente'@'localhost' IDENTIFIED BY '321WordPass';
GRANT SELECT, INSERT, UPDATE, DELETE ON eventodesportivo.* TO 'gerente'@'localhost';

CREATE USER 'midia'@'localhost';
GRANT SELECT ON eventodesportivo.* TO 'midia'@'localhost';

CREATE USER 'user'@'localhost';
--
FLUSH PRIVILEGES;