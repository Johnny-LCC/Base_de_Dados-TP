-- Listagem de Atletas por Competição e Modalidade
SELECT A.nome, M.descricao, C.nome AS Competicao
FROM Atleta A
JOIN Realiza R ON A.idAtleta = R.idAtleta
JOIN Modalidade M ON R.idMod = M.idModalidade
JOIN Esporte E ON M.idEsporte = E.idEsporte
JOIN Competicao C ON E.idCompeticao = C.idCompeticao;

-- Pontuação total por Atleta em todos os Eventos
SELECT A.nome, SUM(R.pontos) AS Pontuacao_Total
FROM Atleta AS A
JOIN Resultado AS R ON A.idAtleta = R.idAtleta
GROUP BY A.nome;

-- Eventos por Localidade e Competição

SELECT E.dataHora, E.localidade, C.nome AS Competicao
FROM Evento E
JOIN Modalidade M ON E.idMod = M.idModalidade
JOIN Esporte S ON M.idEsporte = S.idEsporte
JOIN Competicao C ON S.idCompeticao = C.idCompeticao;

-- Atletas classificados em Modalidades específicas
SELECT A.nome, M.descricao, R.classificado
FROM Atleta A
JOIN Resultado R ON A.idAtleta = R.idAtleta
JOIN Evento E ON R.idEvento = E.idEvento
JOIN Modalidade M ON E.idMod = M.idModalidade
WHERE R.classificado = 1;
