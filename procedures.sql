DELIMITER $$
CREATE PROCEDURE CadastrarAtleta (
    IN in_nome VARCHAR(45),
    IN in_idade INT,
    IN in_genero CHAR(1),
    IN in_peso DECIMAL(5,2),
    IN in_altura DECIMAL(3,2),
    IN in_idEquipa INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM Equipa WHERE idEquipa = in_idEquipa) THEN
        INSERT INTO Atleta (nome, idade, genero, peso, altura, idEquipa)
        VALUES (in_nome, in_idade, in_genero, in_peso, in_altura, in_idEquipa);
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'A equipa especificada não existe.';
    END IF;
END
$$

CALL CadastrarAtleta('Carlos Silva', 25, 'M', 70.5, 1.80, 1);

DELIMITER $$
CREATE PROCEDURE AtualizarResultadoEvento (
    IN in_idAtleta INT,
    IN in_idEvento INT,
    IN in_posicao INT,
    IN in_pontos INT,
    IN in_tempo TIME,
    IN in_classificado TINYINT
)
BEGIN
    IF EXISTS (SELECT 1 FROM Resultado WHERE idAtleta = in_idAtleta AND idEvento = in_idEvento) THEN
        UPDATE Resultado
        SET posicao = in_posicao, 
            pontos = in_pontos, 
            tempo = in_tempo, 
            classificado = in_classificado
        WHERE idAtleta = in_idAtleta AND idEvento = in_idEvento;
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'O resultado especificado não existe.';
    END IF;
END
$$

CALL AtualizarResultadoEvento(1, 1, 2, 90, '00:11:30', 1);

DELIMITER $$
CREATE PROCEDURE RegistrarEvento (
    IN in_dataHora DATETIME,
    IN in_localidade VARCHAR(45),
    IN in_idMod INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM Modalidade WHERE idModalidade = in_idMod) THEN
        INSERT INTO Evento (dataHora, localidade, idMod)
        VALUES (in_dataHora, in_localidade, in_idMod);
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'A modalidade especificada não existe.';
    END IF;
END
$$

CALL RegistrarEvento('2025-01-10 15:00:00', 'Estádio Central', 1);

DELIMITER $$
CREATE PROCEDURE ListarResultadosAtleta (
    IN in_idAtleta INT
)
BEGIN
    SELECT 
        E.idEvento, E.dataHora, E.localidade, M.descricao AS modalidade,
        R.posicao, R.pontos, R.tempo, R.classificado
    FROM Resultado AS R
    JOIN Evento AS E ON R.idEvento = E.idEvento
    JOIN Modalidade AS M ON E.idMod = M.idModalidade
    WHERE R.idAtleta = in_idAtleta;
END
$$

CALL ListarResultadosAtleta(1);

DELIMITER $$
CREATE PROCEDURE ContarAtletasPorDelegacao (
    IN in_idCompeticao INT
)
BEGIN
    SELECT 
        Delegacao.pais, COUNT(A.idAtleta) AS totalAtletas
    FROM Atleta AS A
    JOIN Equipa AS E ON A.idEquipa = E.idEquipa
    JOIN Delegacao AS D ON E.idDelegacao = D.idDelegacao
    WHERE D.idCompeticao = in_idCompeticao
    GROUP BY Delegacao.pais;
END
$$

CALL ContarAtletasPorDelegacao(1);