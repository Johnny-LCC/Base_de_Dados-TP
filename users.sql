CREATE USER 'adminBD'@'localhost' IDENTIFIED BY 'P4ssW0rd@';
GRANT ALL PRIVILEGES ON eventodesportivo.* TO 'adminBD'@'localhost';

CREATE ROLE Organizadores;
GRANT SELECT, INSERT, UPDATE, DELETE ON EventoDesportivo.* TO Organizadores;

CREATE USER 'org1'@'localhost' IDENTIFIED BY 'org123@Comp456';
GRANT ROLE Organizador TO 'org1'@'localhost';

CREATE ROLE Juiz;
GRANT SELECT ON EventoDesportivo.Atleta TO Juiz;
GRANT SELECT ON EventoDesportivo.Evento TO Juiz;
GRANT SELECT ON EventoDesportivo.Modalidade TO Juiz;
GRANT INSERT, UPDATE ON EventoDesportivo.Resultado TO Juiz;

CREATE USER 'judge1'@'localhost' IDENTIFIED BY 'pass_judge_2025';
CREATE USER 'juizA'@'localhist' IDENTIFIED BY 'juizA2025senha';
GRANT ROLE Juiz TO 'judge1'@'localhost', 'juizA'@'localhost';

CREATE ROLE GerenteDelegacao;
GRANT SELECT ON EventoDesportivo.Atleta TO GerenteDelegacao;
GRANT SELECT ON EventoDesportivo.Equipa TO GerenteDelegacao;
GRANT SELECT ON EventoDesportivo.Delegacao TO GerenteDelegacao;
-- GRANT SELECT ON EventoDesportivo.Resultado TO GerenteDelegacao;

CREATE USER 'gestorDeleg1'@'localhost' IDENTIFIED BY 'Senha2025Delegacao1';
GRANT ROLE GerenteDelegação TO 'gestorDeleg1'@'localhost';

CREATE ROLE Usuario;
GRANT EXECUTE ON PROCEDURE 
    eventodesportivo.ListarResultadosAtleta,
    eventodesportivo.ContarAtletasPorDelegacao 
TO Usuario;

CREATE USER 'user1'@'localhost' IDENTIFIED BY 'PASSWORD123'
    WITH MAX_QUERIES_PER_HOUR 100;
GRANT Usuario TO 'user1'@'localhost';

FLUSH PRIVILEGES;