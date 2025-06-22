-- like (parecido)
-- % qualquer coisa 
-- _ um caractere faltante
SELECT * from users u 
-- where first_name like '%a'; -- termina com 'a'
-- where first_name like 'a%'; -- começa com 'a'
-- where first_name like 'he%a'; -- começa com 'he' e termina com 'a'
-- where first_name like '%na%'; -- meio da palavra que contenha 'na'
-- where first_name like '%a%b%'; -- meio da palavra que contenha 'a' e qualquer coisa depois 'b'
where first_name like 'D_nnis'; -- _ um caractere que está faltando