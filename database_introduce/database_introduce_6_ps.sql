select name,price,price*0.85 as sale_price from products;
select concat(name, ' - ',email) as customer_info from customers;
select name,coalesce(description,name) as product_display_info from products; 
select name,description,coalesce(description,name,'정보 없음') as display_text from products; 
select email,substring_index(email, '@', 1)  as user_id , char_length(substring_index(email, '@', 1)) as id_length from customers;