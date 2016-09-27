--Get the cities of agents booking an order for a customer whose cid is 'c006'

select city
from agents
where aid in (select aid
	      from orders
	      where cid = 'c006')

--Get the ids of products ordered through any agent who	takes at least one order from a	
--customer in Kyoto, sorted by pid from highest to lowest. (This is not the same as 
--asking for ids of products ordered by customers in Kyoto.)
select distinct pid
from orders
where aid in (select aid
	      from orders
	      where (qty>= 1) and (cid in (select cid
					   from customers
					   where city = 'Kyoto')
				   )
	      )
order by pid ASC

--Get the ids and names of customers who did not place an order through agent a03.	

select name, cid
from customers
where cid in (select distinct cid 
	      from orders
	     )
except
select name, cid
from customers
where cid in (select distinct cid 
	      from orders
	      where (aid = 'a03')
	     )

--Get the ids of customers who ordered both product p01 and p07
select cid
from orders
where pid = 'p01'
intersect
select cid
from orders
where pid = 'p07'

--Get the ids of products not ordered by any customers who placed any order through	
--agent a08 in pid order from highest to lowest.	

select pid
from Orders
except
select pid
from Orders
where cid in (select cid
	      from orders
	      where aid = 'a08'
	      )
order by pid asc

--Get the name, discounts, and city for all customers who place	orders through agents	
--in Dallas or New York.

select name, discount, city
from customers
where cid in (select cid
		from orders
		where aid in ( select aid
				from agents
				where city = 'Dallas' or city = 'New York'
			      )
	      )


--Get all customers who have the same discount as that of any customers in Dallas or London

(select cid, name 
from customers
where discount in (select discount
		  from customers 
		  where city = 'Dallas'))
intersect
(select cid, name 
from customers
where discount in (select discount
		  from customers 
		  where city = 'London'))



--8)Tell me about check constraints
Check constraints limit the range of values that the user can input into a table. You can use check
constraints on single columns to limit values in the column, or on the table to limit the columns 
based on other values in the row. They are good for making sure there are no duplicate values or to 
exclude certain values. The advantage to putting this in your table is so you can control
the data that is inputed. An example of a check constraint is "Check pid>0 and city = 'Dallas' This
would check to make sure a positive PID and the city would be equal to dallas. An example of a bad check
constraint would be "Check pid = 0" which would always fail for the pid would never be directly equal to
zero. My first example makes sure each primary key is greater than zero while the second example makes sure
each primary key is equal to zero. The first will assure a positve primary key, while the second one will 
assure that all primary keys are the same. The second example will always break because a primary key cannot
be the same as another primary key.




