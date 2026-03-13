create view v_customer_email_list as select 
	user_id,
    name as 고객명,
    email as 이메일
from users

select * from v_customer_email_list;

create view v_order_summary as select 
	o.order_id,
    u.name as 고객명,
    p.name as 상품명,
    o.quantity as 주문수량,
    o.status as 주문상태
from orders o join users u on o.order_id = u.user_id 
join products p on o.product_id = p.product_id;

select * from v_order_summary;

create view v_electornics_sales_status as 
select 
	p.category, 
	count(*) as total_orders ,
	sum(o.quantity*p.price) as total_sales
from orders o 
join products p on o.product_id = p.product_id
where p.category = '전자기기'
group by p.category;

select * from v_electornics_sales_status;

alter view v_electornics_sales_status as 
select 
	p.category, 
	count(*) as total_orders ,
	sum(o.quantity*p.price) as total_sales,
    avg(o.quantity*p.price) as average_order_value
from orders o 
join products p on o.product_id = p.product_id
where p.category = '전자기기'
group by p.category;

select * from v_electornics_sales_status;