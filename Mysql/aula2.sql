-- seleciona a base de dados
use base_de_dados;
-- mostra as tabelas a base de dados
show tables;
-- descreve as colunas da tabela
describe users;
-- inserir registros na base de dados
insert into users (first_name , last_name, email, passaword_hash) values 
("Helena", "Souza", "1@email.com", "4_hash"),
("Joana", "Santos", "2@email.com", "a5_hash"),
("Rosana", "almeida", "3@email.com", "6_hash");

