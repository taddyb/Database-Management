--1) Display the name and city of customers who live in any city that makes the most 
--different kinds of products. (There are two cities that make the most different products.
--Return the name and city of customers from either one of those.)
select c.name, cities.city
from customers c, (select max(foo.diffProd), foo.city
			from 	(select count(city) as diffProd, city
				     from products p
				     group by city
				     order by count(city) desc
				) as foo
			group by foo.city
			order by max(foo.diffProd) desc
			limit 2
		) as cities
where c.city = cities.city

--2) Display the names of products whose priceUSD is strictly below the 
--average priceUSD, in reverse-alphabetical order.
select name
from products p, (select(avg(priceUSD)) as average 
		from products
		) as price
where p.priceUSD > price.average
order by name desc

--3) Display the customer name, pid ordered, 
--and the total for all orders, sorted by total from low to high.
select c.name, o.pid, o.totalUSD
from customers c
inner join orders o on (o.cid = c.cid)
order by o.totalUSD asc

--4) Display all customer names (in alphabetical order) and their total ordered, 
--and nothing more. Use coalesce to avoid showing NULLs.

select c.name, sum(coalesce(o.totalUSD))
from customers c, orders o
where o.cid = c.cid
group by c.name
order by name asc

--5) Display the names of all customers who bought products from agents 
--based in New York along with the names of the products they ordered, 
--and the names of the agents who sold it to them.
select c.name, p.name, a.name
from orders o
inner join agents a on(a.aid = o.aid)
inner join products p on (p.pid = o.pid)
inner join customers c on (c.cid = o.cid)
where o.aid in(select a.aid
		from agents a
		where city ='New York'
		)

--6) Write a query to check the accuracy of the dollars column in the Orders table. 
--This means calculating Orders.totalUSD from data in other tables and comparing those 
--values to the values in Orders.totalUSD. Display all 
--rows in Orders where Orders.totalUSD is incorrect, if any
select o.ordnum, (o.qty * p.priceUSD)as realUSD, o.totalUSD
from orders o
inner join products p on (p.pid = o.pid)
where ((o.qty*p.priceUSD)!= o.totalUSD)

--7) What’s the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? 
--Give example queries in SQL to demonstrate. 
--(Feel free to use the CAP database to make your points here.)

-- The left outer join command will take all the rows from the first table as well as any matching
-- rows from the second table. The right outer join command will take all of the rows from the second
-- table as well as any matching values on the first table. An example is:
select c.city
from customers c
left outer join agents a on (a.city = c.city)

--This join returns all of the cities in the customers table and any cities from the agents table
-- that match. Another example is: 
select c.city
from customers c
right outer join agents a on (a.city = c.city)

--This join will give some null values for there are no matches for some of the values in the tables.
--It returns the values which have matches, which in this case are Duluth and Dallas.














