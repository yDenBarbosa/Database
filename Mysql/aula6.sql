-- between seleciona um range

/*select * from users u 
where
created_at >= '2020-01-26 04:16:58' 
and 
created_at <= '2020-03-05 13:41:49';*/

select * from users u 
where
created_at between '2020-01-26 04:16:58'
and '2020-03-10 01:38:18'
and id between 19 and 60;