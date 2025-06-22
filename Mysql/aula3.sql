-- seleciona colunas
-- "as" apelido para as colunas e "text" para nomer a coluna tbm 
select email, id as i, first_name "eu posso fazer essa merda aqui" from users as u;
-- usar a primeira leta da tabela para identificar as colunas no caso de "join"/ juntar colunas
select u.email uemail, u.id uid, u.first_name ufirst_name from users as u;