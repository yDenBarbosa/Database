-- order by ordena
-- order by id asc (id crescente)
-- order by id desc (id decrescente)
select id, first_name, email as uemail
FROM users

where id between 50 and 100
order by id asc;