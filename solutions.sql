-- Desafío 1 - ¿Quién ha publicado qué y dónde?
select a.au_id as "Author ID", 
b.au_lname as "Last Name", 
b.au_fname as "First Name", 
c.title as Title, 
d.pub_name as Publisher
from titleauthor a
inner join authors b
on a.au_id = b.au_id
inner join titles c
on a.title_id = c.title_id
inner join publishers d
on c.pub_id = d.pub_id
order by a.au_id;


-- Desafío 2 - ¿Quién ha publicado cuántos y dónde?
select a.au_id as "Author ID", 
b.au_lname as "Last Name", 
b.au_fname as "First Name", 
d.pub_name as Publisher,
count(c.title) as "Title Count" 
from titleauthor a
inner join authors b
on a.au_id = b.au_id
inner join titles c
on a.title_id = c.title_id
inner join publishers d
on c.pub_id = d.pub_id
group by a.au_id, b.au_lname, b.au_fname, d.pub_name
order by count(c.title_id) DESC;

-- Desafío 3 - Autores Más Vendidos

select b.au_id, c.au_lname, c.au_fname, sum(qty) as Total

from sales a
inner join titleauthor b
on a.title_id = b.title_id

inner join authors c
on c.au_id = b.au_id
group by b.au_id, c.au_lname, c.au_fname
order by Total DESC
LIMIT 3;


-- Desafío 4 - Ranking de Autores Más Vendidos

select b.au_id, c.au_lname, c.au_fname, sum(ifnull(qty,0)) as Total

from sales a
inner join titleauthor b
on a.title_id = b.title_id

right join authors c
on c.au_id = b.au_id
group by b.au_id, c.au_lname, c.au_fname
order by Total DESC;


