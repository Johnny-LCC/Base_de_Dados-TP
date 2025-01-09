CREATE INDEX idx_anome ON Atleta(nome);

CREATE INDEX idx_resultados ON Resultado(idAtleta, idEvento);

CREATE INDEX idx_eventoS on Evento(dataHora);

CREATE INDEX idx_modalidades ON Modalidade(descricao);

CREATE INDEX idx_competicoes ON Competicao(nome,dataInicio);

CREATE INDEX idx_delegacoes ON Delegacao(pais);