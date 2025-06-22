-- deleta registros com joins
select u.first_name, p.bio from users u 
left join profiles as p
on p.user_id = u.id
where u.first_name = 'Xanthus'

delete p, u from users as u
left join profiles as p
on p.user_id = u.id
where u.first_name = 'Xanthus'