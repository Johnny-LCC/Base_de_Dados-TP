CREATE USER 'adminBD'@'localhost' IDENTIFIED BY 'P4ssW0rd@';
GRANT ALL PRIVILEGES ON eventodesportivo.* TO 'adminBD'@'localhost';

CREATE USER 'gestorComp'@'localhost' IDENTIFIED BY 'gestor123Comp';
GRANT SELECT, INSERT, UPDATE ON EventoDesportivo.Competicao TO 'GestorCompeticao1'@'localhost';
GRANT SELECT, INSERT, UPDATE ON EventoDesportivo.Delegacao TO 'GestorCompeticao1'@'localhost';
GRANT SELECT, INSERT, UPDATE ON EventoDesportivo.Equipa TO 'GestorCompeticao1'@'localhost';
GRANT SELECT, INSERT, UPDATE ON EventoDesportivo.Funcionario TO 'GestorCompeticao1'@'localhost';

CREATE USER 'TecnicoResultados1'@'localhost' IDENTIFIED BY 'SenhaResultados2025';
GRANT SELECT ON EventoDesportivo.Atleta TO 'TecnicoResultados1'@'localhost';
GRANT SELECT ON EventoDesportivo.Evento TO 'TecnicoResultados1'@'localhost';
GRANT SELECT ON EventoDesportivo.Modalidade TO 'TecnicoResultados1'@'localhost';
GRANT INSERT, UPDATE ON EventoDesportivo.Resultado TO 'TecnicoResultados1'@'localhost';

CREATE USER 'GestorDelegacao1'@'localhost' IDENTIFIED BY 'SenhaDelegacao2025';
GRANT SELECT ON EventoDesportivo.Atleta TO 'GestorDelegacao1'@'localhost';
GRANT SELECT ON EventoDesportivo.Equipa TO 'GestorDelegacao1'@'localhost';
GRANT SELECT ON EventoDesportivo.Delegacao TO 'GestorDelegacao1'@'localhost';
GRANT SELECT ON EventoDesportivo.Resultado TO 'GestorDelegacao1'@'localhost';

FLUSH PRIVILEGES;