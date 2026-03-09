select 
	product_id as 상품ID, 
    name as 상품명, 
    price as 가격 
from products
where price = (select max(price) from products) 
limit 1


select 
	order_id,
    user_id,
    order_date
from orders 
where product_id = (
	select product_id 
    from orders 
    where order_id = 1
    )
    and order_id != 1;

-- sol 1
select 
	u.name as 고객명, 
    count(o.order_id) as 총주문횟수 
from orders o right join users u on o.user_id = u.user_id 
group by u.user_id, u.name
order by u.user_id;

-- sol 2
select 
	name as 고객명, 
    (select count(*) from orders o where o.user_id = u.user_id) as 총주문횟수
from users u
order by user_id;