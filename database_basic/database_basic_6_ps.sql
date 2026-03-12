select
	name,
    category,
    case category
    when '전자기기' then 'Electronics'
    when '도서' then 'Books'
    when '패션' then 'Fashion'
    end as category_english
    from products;


select
	order_id,
    quantity,
    case
    when quantity >= 2 then '다량 주문'
    else '단일 주문'
    end as order_type
	from orders
    order by order_type;

select 
	case
    when stock_quantity >=50 then '재고 충분'
    when stock_quantity <50 and stock_quantity >=20 then '재고 보통'
    when stock_quantity <20 then '재고 부족'
    end as stock_level,
    count(*) as product_count
 from products
 group by case
    when stock_quantity >=50 then '재고 충분'
    when stock_quantity <50 and stock_quantity >=20 then '재고 보통'
    when stock_quantity <20 then '재고 부족'
	end;


select 
	u.name as user_name,
	count(*) as total_orders,
    sum(case when p.category =  '전자기기' then 1 else 0 end) as electronics_orders,
    sum(case when p.category = '도서' then 1 else 0 end) as book_orders,
    sum(case when p.category = '패션' then 1 else 0 end) as fashion_orders
from users u left join orders o on u.user_id = o.user_id
left join products p on p.product_id = o.product_id
group by u.name;