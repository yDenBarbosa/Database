CREATE DATABASE Biblioteca;
USE Biblioteca;


CREATE TABLE Autor (
IdAutor SMALLINT IDENTITY,
NomeAutor VARCHAR(50) NOT NULL,
SobrenomeAutor VARCHAR(60) NOT NULL,
CONSTRAINT pk_id_autor PRIMARY KEY(IdAutor)
);
GO

CREATE TABLE Editora(
IdEditora SMALLINT PRIMARY KEY IDENTITY,
NomeEditora VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Assunto(
IdAssunto TINYINT PRIMARY KEY IDENTITY,
NomeAssunto VARCHAR(25) NOT NULL
);
GO

CREATE TABLE Livros(
IdLivro SMALLINT NOT NULL PRIMARY KEY IDENTITY(100,1),
NomeLivro VARCHAR(70) NOT NULL,
ISBN13 CHAR(13) UNIQUE NOT NULL,
DataPub DATE,
PrecoLivro Money NOT NULL,
NumeroPaginas SMALLINT NOT NULL,
IdEditora SMALLINT NOT NULL, -- Chave estrangeira
IdAssunto TINYINT NOT NULL,  -- chave estrangeira
CONSTRAINT fk_id_Editora FOREIGN KEY(IdEditora)
    REFERENCES Editora(IdEditora) ON DELETE CASCADE,
CONSTRAINT fk_id_Assunto FOREIGN KEY(IdAssunto)
    REFERENCES Assunto(IdAssunto) ON DELETE CASCADE,
CONSTRAINT Verifica_Preco CHECK(PrecoLivro >= 0)
);
GO

CREATE TABLE LivroAutor(
IdLivro SMALLINT NOT NULL,
IdAutor SMALLINT NOT NULL,
CONSTRAINT fk_id_livros FOREIGN KEY(IdLivro) REFERENCES Livros(IdLivro),
CONSTRAINT fk_id_autor FOREIGN KEY(IdAutor) REFERENCES Autor(IdAutor),
CONSTRAINT pk_livro_Autor PRIMARY KEY(IdLivro, IdAutor)
);
GO

INSERT INTO Assunto(NomeAssunto)
VALUES
('Ficção Científica'), ('Botânica'), ('Eletrônica'), ('Matemática'), ('Aventura'), ('Romance')
, ('Finanças'), ('Gastronomia'), ('Terror'), ('Administração'), ('Informática'), ('Suspense');

INSERT INTO Editora(NomeEditora)
VALUES
('Prentice Hall'),('Botânica');

INSERT INTO Editora(NomeEditora)
VALUES
('Aleph'), ('Microsoft Press'), ('Wiley'), ('HarperCollins'), ('Érica')
, ('Novatec'), ('McGraw-Hill'), ('Apress'), ('Francisco Alves'), ('Sybex')
, ('Globo'), ('Companhia das Letras'), ('Morro Branco'), ('Penguin Books')
, ('Martin Claret'), ('Redord'), ('Springer'), ('Melhoramentos'), ('Oxford')
, ('Taschen'), ('Ediouro'), ('Bookman');
GO


INSERT INTO Autor (NomeAutor, SobrenomeAutor)
VALUES
('Daniel', 'Barret'), ('Gerald', 'Carter'), ('Mark', 'Sobell'),
('William', 'Stanek'), ('Christine', 'Bresnahan'), ('William', 'Gibson'),
('James', 'Joyce'), ('John', 'Emsley'), ('José', 'Saramago'),
('Richard', 'Silverman'), ('Robert', 'Byrnes'), ('Jay', 'Ts'),
('Robert', 'Eckstein'), ('Paul', 'Horowitz'), ('Winfield', 'Hill'),
('Joel', 'Murach'), ('Paul', 'Scherz'), ('Simon', 'Monk'),
('George', 'Orwell'), ('Ítalo', 'Calvino'), ('Machado', 'de Assis'),
('Oliver', 'Sacks'), ('Ray', 'Bradbury'), ('Walter', 'Isaacson'),
('Benjamin', 'Graham'), ('Júlio', 'Verne'), ('Marcelo', 'Gleiser'),
('Harri', 'Lorenzi'), ('Humphrey', 'Carpenter'), ('Isaac', 'Asimov');
GO

INSERT INTO Livros(NomeLivro, ISBN13, DataPub, PrecoLivro,
NumeroPaginas, IdAssunto, IdEditora)
VALUES ('Vinte Mil Leguas Submarinas', '9788582850022',
'2014-09-16', 24.50, 448, 1, 16),
('O Investidor Inteligente', '9788595080805',
'2016-01-25', 79.90, 450, 7, 6);




==========================================================


-- Inserir em lote (bulk) a partir de arquivo CSV
INSERT INTO Livros (NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdEditora, IdAssunto)
SELECT
NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas,IdEditora, IdAssunto
FROM OPENROWSET(
BULK 'C:\SQL\Livros.CSV',
FORMATFILE = 'C:\SQL\Formato.xml',
CODEPAGE= '65001',-- UTF-8
FIRSTROW = 2
) AS LivrosCVS;