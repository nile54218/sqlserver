
-----question 1---------

select first_name from sales.customers
order by first_name desc

------question 2----------

select first_name,last_name,city from sales.customers
order by city,first_name

------question 3----------

select top(3)list_price from production.products
order by list_price desc


------question 4---------

select * from production.products
where list_price > 300 and model_year=2018


------question 5---------

select * from production.products
where list_price > 3000 or model_year=2018


-----question 6----------

select * from production.products
where list_price between 1899 and 1999.99


-----question 7---------

select * from production.products
where list_price in (299.99,466.99,489.99)


------question 8----------

select * from sales.customers
where last_name like '[abc]%'


-------question 9---------

select * from sales.customers
where first_name not like 'a%'


--------question 10--------

select state,city,count(customer_id) 'customer count'
from sales.customers
group by state,city


-------qustion 11--------

select customer_id,year(order_date) 'year',count(order_id) 'order count'
from sales.orders
group by customer_id,year(order_date) 


-------question 12--------

select category_id,max(list_price) 'max_list_price',min(list_price) 'min_list_price'
from production.products
group by category_id
having max(list_price) > 4000 or min(list_price) < 500




	