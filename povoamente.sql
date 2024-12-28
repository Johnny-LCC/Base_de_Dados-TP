Use EventoDesportivo;

-- Competicao e Tipo
INSERT INTO Competicao
	(idCompeticao, dataInicio, dataFim, localidade, nome)
VALUES
	(1, '2024-06-10', '2024-06-24', 'Rio de Janeiro', 'Olimpíadas 2024'),
	(2, '2024-07-01', '2024-07-15', 'São Paulo', 'Jogos Panamericanos');

INSERT INTO Tipo
	(idTipo, descricao)
VALUES
	(1, 'Organizador'),
	(2, 'Juiz'),
	(3, 'Assistente Técnico');

-- Funcionario, Esporte, Delegacao
INSERT INTO Funcionario
	(idFuncionario, nome, idTipo, idCompeticao)
VALUES
	(1, 'Carlos Silva', 1, 1),
	(2, 'Ana Paula', 2, 1),
	(3, 'João Souza', 3, 2);

INSERT INTO Esporte
	(idEsporte, nome, idCompeticao)
VALUES
	(1, 'Atletismo', 1),
	(2, 'Natação', 1),
	(3, 'Vôlei', 2);

INSERT INTO Delegacao
	(idDelegacao, pais, idCompeticao)
VALUES
	(1, 'Brasil', 1),
	(2, 'Estados Unidos', 1),
	(3, 'Argentina', 2);

-- Modalidade, Equipa
INSERT INTO Modalidade
	(idModalidade, descricao, idEsporte)
VALUES
	(1, '100m Rasos', 1),
	(2, 'Salto em Altura', 1),
	(3, '50m Livre', 2),
	(4, 'Vôlei de Praia', 3);

INSERT INTO Equipa
	(idEquipa, idEsporte, idDelegacao)
VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 3, 2);

-- Treinador, Atleta, Evento
INSERT INTO Treinador
	(idTreinador, nome, idEquipa)
VALUES
	(1, 'Fernando Costa', 1),
	(2, 'Mariana Lima', 2),
	(3, 'Pedro Oliveira', 3);

INSERT INTO Atleta
	(idAtleta, nome, idade, genero, peso, altura, idEquipa)
VALUES
	(1, 'Lucas Santos', 25, 'M', 70.5, 1.80, 1),
	(2, 'Maria Clara', 22, 'F', 60.0, 1.65, 2),
	(3, 'João Pedro', 28, 'M', 85.0, 1.90, 3);

INSERT INTO Evento
	(idEvento, dataHora, localidade, idMod)
VALUES
	(1, '2024-06-11 10:00:00', 'Estádio Olímpico', 1),
	(2, '2024-06-12 14:00:00', 'Estádio Olímpico', 2),
	(3, '2024-06-13 09:00:00', 'Piscina Olímpica', 3);

-- Resultado, Realiza
INSERT INTO Resultado
	(idRealiza, posicao, pontos, tempo, classificado, idAtleta, idEvento)
VALUES
	(1, 1, 10, '00:10:25', 1, 1, 1),
	(2, 2, 8, '00:10:50', 1, 2, 2),
	(3, 3, NULL, NULL, 0, 3, 3);

INSERT INTO Realiza
	(idAtleta, idMod)
VALUES
	(1, 1),
	(2, 3),
	(3, 4);

-- Povoamento Adicional

INSERT INTO Competicao
	(idCompeticao, dataInicio, dataFim, localidade, nome)
VALUES
	(3, '2024-08-01', '2024-08-15', 'Paris', 'Jogos Mundiais'),
	(4, '2024-09-05', '2024-09-20', 'Tóquio', 'Campeonato Mundial de Esportes');

INSERT INTO Tipo
	(idTipo, descricao)
VALUES
	(4, 'Treinador Principal'),
	(5, 'Fisioterapeuta');

INSERT INTO Funcionario
	(idFuncionario, nome, idTipo, idCompeticao)
VALUES
	(4, 'Rafael Gomes', 4, 3),
	(5, 'Juliana Araújo', 5, 4),
	(6, 'Daniel Santos', 2, 2);

INSERT INTO Esporte
	(idEsporte, nome, idCompeticao)
VALUES
	(4, 'Ginástica Artística', 3),
	(5, 'Basquete', 4),
	(6, 'Futebol', 4);

INSERT INTO Modalidade
	(idModalidade, descricao, idEsporte)
VALUES
	(5, 'Solo', 4),
	(6, 'Argolas', 4),
	(7, '3x3 Masculino', 5),
	(8, 'Futebol Feminino', 6);

INSERT INTO Delegacao
	(idDelegacao, pais, idCompeticao)
VALUES
	(4, 'França', 3),
	(5, 'Japão', 4),
	(6, 'Alemanha', 4);

INSERT INTO Equipa
	(idEquipa, idEsporte, idDelegacao)
VALUES
	(4, 4, 4),
	(5, 5, 5),
	(6, 6, 6);

INSERT INTO Treinador
	(idTreinador, nome, idEquipa)
VALUES
	(4, 'Beatriz Almeida', 4),
	(5, 'Carlos Menezes', 5),
	(6, 'Eduardo Matos', 6);

INSERT INTO Atleta
	(idAtleta, nome, idade, genero, peso, altura, idEquipa)
VALUES
	(4, 'Gabriela Santos', 21, 'F', 48.5, 1.50, 4),
	(5, 'Thiago Oliveira', 24, 'M', 75.0, 1.85, 5),
	(6, 'Fernanda Costa', 26, 'F', 65.0, 1.70, 6);

INSERT INTO Evento
	(idEvento, dataHora, localidade, idMod)
VALUES
	(4, '2024-08-02 15:00:00', 'Arena de Ginástica', 5),
	(5, '2024-08-04 16:00:00', 'Arena de Ginástica', 6),
	(6, '2024-09-10 19:00:00', 'Ginásio de Basquete', 7),
	(7, '2024-09-15 21:00:00', 'Estádio Nacional', 8);

INSERT INTO Resultado
	(idRealiza, posicao, pontos, tempo, classificado, idAtleta, idEvento)
VALUES
	(4, 1, 15, NULL, 1, 4, 4),
	(5, 2, 12, NULL, 1, 5, 6),
	(6, 3, NULL, '01:35:45', 0, 6, 7);

INSERT INTO Realiza
	(idAtleta, idMod)
VALUES
	(4, 5),
	(5, 7),
	(6, 8);