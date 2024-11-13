CREATE DATABASE IF NOT EXISTS  EventoDesportivo;
USE EventoDesportivo;

CREATE TABLE IF NOT EXISTS Competicao (
  idCompeticao INT NOT NULL,
  dataInicio DATE NOT NULL,
  dataFim DATE NOT NULL,
  localidade VARCHAR(45) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCompeticao)
);

CREATE TABLE IF NOT EXISTS Tipo (
  idTipo INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idTipo)
);

CREATE TABLE IF NOT EXISTS Funcionario (
  idFuncionario INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  idTipo INT NOT NULL,
  idCompeticao INT NOT NULL,
  PRIMARY KEY (idFuncionario),
  FOREIGN KEY (idTipo) REFERENCES Tipo (idTipo),
  FOREIGN KEY (idCompeticao) REFERENCES Competicao (idCompeticao)
);

CREATE TABLE IF NOT EXISTS Esporte (
  idEsporte INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  idCompeticao INT NOT NULL,
  PRIMARY KEY (idEsporte),
  FOREIGN KEY (idCompeticao) REFERENCES Competicao (idCompeticao)
);

CREATE TABLE IF NOT EXISTS Modalidade (
  idModalidade INT NOT NULL,
  descricao VARCHAR(100) NOT NULL,
  idEsporte INT NOT NULL,
  PRIMARY KEY (idModalidade),
  FOREIGN KEY (idEsporte) REFERENCES Esporte (idEsporte)
);

CREATE TABLE IF NOT EXISTS Delegacao (
  idDelegacao INT NOT NULL,
  pais VARCHAR(45) NOT NULL,
  idCompeticao INT NOT NULL,
  PRIMARY KEY (idDelegacao),
  FOREIGN KEY (idCompeticao) REFERENCES Competicao (idCompeticao)
);

CREATE TABLE IF NOT EXISTS Equipa (
  idEquipa INT NOT NULL,
  idEsporte INT NOT NULL,
  idDelegacao INT NOT NULL,
  PRIMARY KEY (idEquipa),
  FOREIGN KEY (idDelegacao) REFERENCES Delegacao (idDelegacao),
  FOREIGN KEY (idEsporte) REFERENCES Esporte (idEsporte)
);

CREATE TABLE IF NOT EXISTS Treinador (
  idTreinador INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  idEquipa INT NOT NULL,
  PRIMARY KEY (idTreinador),
  FOREIGN KEY (idEquipa) REFERENCES Equipa (idEquipa)
);

CREATE TABLE IF NOT EXISTS Atleta (
  idAtleta INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  idade INT NOT NULL,
  genero VARCHAR(1) NOT NULL,
  peso DECIMAL(5,2) NULL,
  altura DECIMAL(3,2) NULL,
  idEquipa INT NOT NULL,
  PRIMARY KEY (idAtleta),
  FOREIGN KEY (idEquipa) REFERENCES Equipa (idEquipa)
);

CREATE TABLE IF NOT EXISTS Evento (
  idEvento INT NOT NULL,
  dataHora DATETIME NOT NULL,
  localidade VARCHAR(45) NOT NULL,
  idMod INT NOT NULL,
  PRIMARY KEY (idEvento),
  FOREIGN KEY (idMod) REFERENCES Modalidade (idModalidade)
);

CREATE TABLE IF NOT EXISTS Resultado (
  idRealiza INT NOT NULL,
  posicao INT NOT NULL,
  pontos INT NULL,
  tempo TIME NULL,
  classificado TINYINT NOT NULL,
  idAtleta INT NOT NULL,
  idEvento INT NOT NULL,
  PRIMARY KEY (idRealiza),
  FOREIGN KEY (idAtleta) REFERENCES Atleta (idAtleta),
  FOREIGN KEY (idEvento) REFERENCES Evento (idEvento)
);

CREATE TABLE IF NOT EXISTS Realiza (
  idAtleta INT NOT NULL,
  idMod INT NOT NULL,
  FOREIGN KEY (idAtleta) REFERENCES Atleta (idAtleta),
  FOREIGN KEY (idMod) REFERENCES Modalidade (idModalidade)
);