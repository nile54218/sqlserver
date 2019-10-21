--------question 1------------

create view sales_info
as
select ord.customer_id,ord.order_id,ord.order_date,ord.order_status,pro.product_id,orit.quantity,orit.list_price
from sales.order_items orit inner join sales.orders ord
on orit.order_id=ord.order_id inner join
production.products pro on pro.product_id=orit.product_id

 select * from sales_info
 -------question 2-----------

create view staff_sales
 as
 select sta.first_name,sta.last_name,sum(orit.quantity*orit.list_price) as 'order value'
 from sales.staffs sta inner join sales.orders ord
 on sta.staff_id=ord.staff_id inner join sales.order_items orit
 on ord.order_id=orit.order_id
 group by sta.first_name,sta.last_name

 select * from staff_sales

----------question 3-------------

create procedure usp_add_store
@store_name varchar(255),
@phone varchar(25),
@email varchar(255),
@street varchar(255),
@city varchar(255),
@state varchar(10),
@zip_code varchar(5),
@store_count int output
as
begin
	insert into sales.stores(store_name,phone,email,street,city,state,zip_code)
	 values(@store_name,@phone,@email,@street,@city,@state,@zip_code)
	select @store_count=count(store_id) from sales.stores
end


declare @st_count int
exec usp_add_store
@store_name='gift shopee',
@phone='1728312',
@email='gift@gmail.com',
@street='AB street',
@city='mumbai',
@state='maharashtra',
@zip_code='4324',
@store_count =@st_count output
select @st_count as 'store count'



----------question 4--------------

alter procedure usp_store_wise_sales
as
begin
	select sto.store_id,sto.store_name,sto.city,count(ord.order_id) as 'order count'
	from sales.orders ord inner join sales.stores sto
	on ord.store_id=sto.store_id
	group by sto.store_id,sto.store_name,sto.city
	order by sto.store_id
end

exec usp_store_wise_sales



-----------question 5-------------

create function udf_avg_qty(
@customer_id int,
@year int
)
returns int
as
begin
	declare @order_count int
	select @order_count=sum(quantity*list_price)
	from sales.order_items orit inner join sales.orders ord
	on orit.order_id=ord.order_id
	where customer_id=@customer_id and year(order_date)=@year
	return @order_count
end;

select dbo.udf_avg_qty(94,2016) as 'order amount'


