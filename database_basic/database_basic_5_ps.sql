select 
	name as 이름, 
    email as 이메일
    from users
union
select name, 
	email
	from retired_users

select 
	u.name as 고객명,
    u.email as 이메일 
from users u 
join orders o on u.user_id = o.user_id
join products p on  o.product_id = p.product_id
where p.category = '전자기기'
union all
select 
	distinct u.name,
	u.email
from users u 
join orders o on u.user_id = o.user_id 
where o.quantity>1

select 
	distinct created_at as 이벤트_날짜, 
    '고객 가입' as 이벤트_종류,
	name as 상세_내용
from users
union
select 
	o.order_date, 
    '상품 주문' ,
	p.name  
from orders o 
join products p on o.product_id = p.product_id
order by 이벤트_날짜 desc

select 
	name as 이름, 
    '고객' as 역할, 
    email as 이메일
from users
union
select 
	name as 이름, 
    '직원' as 역할, 
    concat(name, '@my-shop.com') as 이메일 
from employees
order by 이름;
