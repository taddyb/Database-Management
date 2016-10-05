--1. Show the cities of agents booking an order for a customer whose id is 'c006'. Use joins	
--this time; no subqueries.	

select a.city
from agents a
inner join orders o on o.aid= a.aid
where o.cid = 'c006'

--2. Show the ids of products ordered through any agent	who makes at least one order for	
--a customer in	Kyoto, sorted by pid from highest to lowest. Use joins;	no subqueries.	

select distinct o.pid
from orders o
inner join agents a on a.aid =o.aid
inner join customers c on c.cid=o.cid
where c.city = 'Kyoto' and o.qty>=1

--3. Show the names of customers who have never placed an order. Use a subquery.

select name
from customers
where cid not in (select cid
		  from orders
		 )

--4. Show the names of customers who have never placed an order. Use an outer join.	

select c.name 
from customers c
left outer join orders o on o.cid=c.cid
where o.cid is null

--5. Show the names of customers who placed at least one order	through	an agent in their	
-- own city, along with those agent(s') names.	

select distinct c.name, a.name
from customers c
inner join orders o on o.cid=c.cid
inner join agents a on a.aid = o.aid
where a.city=c.city
	and (select count(o.cid)
		from orders o, agents a
		where o.aid = a.aid
		) >= 1

-- 6. Show the names of customers and agents living in the same city, along with the name	
-- of the shared city, regardless of whether or	not the customer has ever placed an order	
-- with that agent.	

select distinct a.name, c.name, a.city, c.city
from customers c
inner join agents a on a.city = c.city

--7. Show the name and city of customers who live in the city that makes the fewest
-- different kinds of products. (Hint: Use count and group by on the Products table.)

select c.name, c.city
from customers c
inner join products p on p.city = c.city
group by c.name, c.city
order by count(p.city) asc
limit 1




