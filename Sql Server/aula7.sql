USE BIBLIOTECA;

--- SELECIONAR OS CAMPOS NOME LIVROS, PREÇO LIVROS, DATAPUB
SELECT
    NomeLivro,
    PrecoLivro,
    DataPub
FROM LIVROS;


--- MOSTRAR APENAS SOMENTE DOS AUTORES   ----

SELECT
    SobrenomeAutor AS Sobrenome
FROM AUTOR;

----- Retornar a lista dos Assuntos  ---

SELECT
    NomeAssunto AS Lista_de_Assuntos
FROM ASSUNTO;

---- Mostrar a lista de editoras com os IDs de cada uma,
--- com a coluna de nomes de editoras à esquerda da coluna de IDs.----

SELECT
NomeEditora,
IdEditora
FROM
EDITORA;


------ Mostras os IDs, de assuntos dos quais existem livros cadastrados na tabela de livros sem repetição

SELECT
    DISTINCT IdAssunto
FROM LIVROS;


--- Criar uma nova tabela chamada " LivrosFiccao" que contenha todos os dados dos Livros Relacionados ao assunto de ID1

SELECT     *
INTO Livrosficcao
FROM LIVROS
WHERE IdAssunto = 1;

SELECT * FROM Livrosficcao;


DROP TABLE Livrosficcao;
----- ORDENAR ==
SELECT * FROM LIVROS;

SELECT * FROM LIVROS
ORDER BY NomeLivro;

SELECT * FROM LIVROS
ORDER BY IdLivro desc;

SELECT NomeLivro,PrecoLivro,IdEditora FROM LIVROS
ORDER BY  PrecoLivro desc,IdEditora desc;


----- TOP ----
SELECT TOP (2)
    NomeLivro


FROM LIVROS

ORDER BY PrecoLivro desc;


SELECT TOP(4)
NomeLivro,
PrecoLivro

FROM LIVROS

ORDER BY PrecoLivro DESC

--- WITH TIES ---

SELECT TOP (11)
WITH TIES NomeLivro,IdAssunto
FROM LIVROS
ORDER BY IdAssunto DESC

----- WHERE -----

SELECT
NomeLivro,
DataPub,
IdEditora
FROM LIVROS
WHERE IdEditora = 3


SELECT
NomeLivro,
DataPub,
IdEditora
FROM LIVROS
WHERE IdEditora = 3;


SELECT
IdAutor, NomeAutor
FROM AUTOR
WHERE SobrenomeAutor = 'Verne';



SELECT
    NomeLivro,
    PrecoLivro
FROM LIVROS
WHERE PrecoLivro > 100.00


---- SUBQUERIES -----

SELECT
NomeLivro,
DataPub
FROM LIVROS    
WHERE IdEditora = (
    SELECT    IdEditora
    FROM EDITORA
    WHERE NomeEditora = 'ALEPH'
)
order by NomeLivro;


---------------

----- DELETAR LINHA **** SEMPRE UTILIZAR O WHERE ******

DELETE ASSUNTO
WHERE NomeAssunto =  'GASTRONOMIA';


DELETE FROM ASSUNTO
WHERE IdAssunto = 12


insert into ASSUNTO (NomeAssunto)
VALUES ('policial');

select * from ASSUNTO;

-------------


CREATE TABLE teste (

ID_TESTE SMALLINT PRIMARY KEY IDENTITY,
VALOR_TESTE SMALLINT NOT NULL
);


----  ROTINA PARA INSERIR DADOS NA TABELA ------

DECLARE @Contador INT = 1
WHILE @Contador <= 100
BEGIN
    INSERT INTO teste (VALOR_TESTE) VALUES (@Contador * 3 )
    SET @Contador = @Contador + 1
END


SELECT * FROM teste;



TRUNCATE TABLE TESTE;

SELECT *  FROM TESTE



SELECT IDENT_CURRENT ('TESTE');