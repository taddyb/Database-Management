--List the order number and total dollars of all orders.	

Select ordnum, totalUSD
from orders;

-- List the name and city of agents named Smith.

Select name, city
from Agents
where name = 'Smith'

--List the id, name, and priceUSD of products with 
--quantity more than 201,000.

Select pid, name, priceUSD
from Products
where (quantity > 201000)

--List the names and cities of customers in Duluth.

Select name, city
from Customers
where city = 'Duluth'

--List the names of agents not in New York and not in Duluth.

Select name
from agents
Where (city != 'New York') and (city != 'Duluth')

--List all data	for products in	neither	Dallas 
--nor Duluth that cost US$1 or more.	

Select * 
from products
where ((city != 'Dallas') and (city != 'Duluth'))
   and priceUSD >= 1

--List all data for orders in February or March

Select *
from orders
Where (mon = 'feb') or (mon = 'mar')

--List all data for orders in February of US$600 or more

Select * 
from orders
where (mon = 'feb') 
and (totalUSD >= 600)

--List all orders from the customer whose cid is C005.

Select ordnum, products.name
from orders, products
where (cid = 'c005') and (orders.pid = products.pid)
