CREATE VIEW View_Atletas_Equipas AS
SELECT A.idAtleta, A.nome AS nomeAtleta, A.idade, A.genero,
       Eq.idEquipa, Es.nome AS nomeEsporte, D.pais AS paisDelegacao
    FROM Atleta AS A
    JOIN Equipa AS Eq ON A.idEquipa = Eq.idEquipa
    JOIN Esporte AS Es ON Eq.idEsporte = Es.idEsporte
    JOIN Delegacao AS D ON Eq.idDelegacao = D.idDelegacao;

CREATE VIEW View_Resultados_Eventos AS
SELECT E.idEvento, E.dataHora, E.localidade, M.descricao AS modalidade,
       A.nome AS nomeAtleta, R.posicao, R.pontos, R.tempo, R.classificado
    FROM Resultado AS R
    JOIN Evento AS E ON R.idEvento = E.idEvento
    JOIN Atleta AS A ON R.idAtleta = A.idAtleta
    JOIN Modalidade AS M ON E.idMod = M.idModalidade;

CREATE VIEW View_Funcionarios_Competicoes AS
SELECT C.nome AS nomeCompeticao, C.localidade AS localCompeticao,
       F.nome AS nomeFuncionario, T.descricao AS tipoFuncionario
    FROM Funcionario AS F
    JOIN Competicao AS C ON F.idCompeticao = C.idCompeticao
    JOIN Tipo AS T ON F.idTipo = T.idTipo;

CREATE VIEW View_Desempenho_Delegacoes AS
SELECT D.pais, SUM(R.pontos) AS totalPontos,
       COUNT(CASE WHEN R.classificado = 1 THEN 1 END) AS totalClassificados
    FROM Resultado AS R
    JOIN Atleta AS A ON R.idAtleta = A.idAtleta
    JOIN Equipa AS E ON A.idEquipa = E.idEquipa
    JOIN Delegacao AS D ON E.idDelegacao = D.idDelegacao
    GROUP BY D.pais;

CREATE VIEW View_Agenda_Eventos AS
SELECT Ev.idEvento, Ev.dataHora, Ev.localidade,
    M.descricao AS modalidade, C.nome AS nomeCompeticao
    FROM Evento AS Ev
    JOIN Modalidade AS M ON Ev.idMod = M.idModalidade
    JOIN Esporte AS Es ON M.idEsporte = Es.idEsporte
    JOIN Competicao AS C ON Es.idCompeticao = C.idCompeticao;