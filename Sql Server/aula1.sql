USE [SQL-DB_1];
GO

CREATE TABLE ALUNO
(Id_aluno int PRIMARY KEY NOT NULL,
nome varchar(200) NOT NULL,
data_nascimento date NOT NULL,
sexo varchar(1) NOT NULL, -- M para Masculino e F para Feminino
data_cadastro datetime NOT NULL,
login_cadastro varchar(15) NOT NULL
);

CREATE TABLE CURSO
(
id_curso int PRIMARY KEY NOT NULL,
nome_curso varchar(200) NOT NULL,
data_cadastro datetime NOT NULL,
login_cadastro varchar(15) NOT NULL
);

CREATE TABLE SITUACAO
(
id_situacao int PRIMARY KEY NOT NULL,
situacao varchar(25) NOT NULL,
data_cadastro datetime NOT NULL,
login_cadastro varchar(15) NOT NULL
);

CREATE TABLE TURMA
(
id_turma int PRIMARY KEY NOT NULL,
id_aluno int NOT NULL,
id_curso int NOT NULL,
valor_turma numeric(15,2) NOT NULL,
desconto numeric(3,2) NOT NULL,
data_inicio date NOT NULL,
data_cadastro datetime NOT NULL,
login_cadastro varchar(15) NOT NULL
);

CREATE TABLE REGISTRO_PRESENCA
(
id_turma int NOT NULL,
id_aluno int NOT NULL,
id_situacao int NOT NULL,
data_presenca date NOT NULL,
data_cadastro date NOT NULL,
login_cadastro varchar(15) NOT NULL
);

DROP TABLE ALUNO;
DROP TABLE CURSO;
DROP TABLE REGISTRO_PRESENCA;
DROP TABLE SITUACAO;
DROP TABLE TURMA;

-- Turma x Alunos - Relacionamentos
ALTER TABLE turma
    ADD CONSTRAINT FK_TurmaAluno FOREIGN KEY (id_aluno) REFERENCES ALUNO (id_aluno);

-- Turma x Curso
ALTER TABLE turma
    ADD CONSTRAINT FK_turmaCurso FOREIGN KEY (id_curso) REFERENCES CURSO (id_curso);

-- REGISTRO_PRESENCA x TURMA
ALTER TABLE REGISTRO_PRESENCA
   ADD CONSTRAINT FK_RPTurma FOREIGN KEY (id_Turma) REFERENCES Turma (id_turma);

-- REGISTRO_PRESENCA X ALUNO
ALTER TABLE REGISTRO_PRESENCA
    ADD CONSTRAINT FK_RPAlunos FOREIGN KEY (id_aluno) REFERENCES Aluno (id_aluno);

-- REGISTRO_PRESENCA X SITUACAO
ALTER TABLE REGISTRO_PRESENCA
    ADD CONSTRAINT FK_RPSituacao FOREIGN KEY (id_situacao) REFERENCES Situacao (id_situacao);