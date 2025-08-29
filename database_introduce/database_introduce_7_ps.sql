use my_shop;
select count(*),count(category) from order_stat;
select sum(quantity*price) as `총 매출액` ,
 avg(quantity*price) as `평균 주문 금액`,
 max(price) as `최고 단가`,
 min(price) as `최저 단가` from order_stat;  
select category,sum(quantity) as `카테고리별 총 판매 수량` ,sum(quantity*price) as `카테고리별 총 매출액`
 from 
	order_stat 
group by 
	category
order by 
	`카테고리별 총 매출액` desc;
--
select customer_name ,count(*) as `총 주문 횟수`,sum(quantity) as `총 구매 수량`
 from 
	order_stat 
group by
	customer_name
order by 
	`총 주문 횟수` desc,`총 구매 수량` desc ;
--
select customer_name,sum(quantity*price) as `총 구매 금액`
from order_stat 
group by customer_name
having sum(quantity*price)>=400000 
order by  `총 구매 금액` desc;
-- 
select customer_name, count(*) as `주문 횟수` , sum(quantity* price) as `총 사용 금액`
from 
	order_stat 
where 
	category!='도서' 
group by 
	customer_name 
having 
	count(*)>=2
order by `총 사용 금액` desc ;