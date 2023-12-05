use oliststore;
select * from orders;
select * from payments;
select * from reviews;

-- 1) Weekday Vs Weekend (order_purchase_timestamp) Payment Statistics.
select orders.weekday_weekend,round(AVG(payments.payment_value),0) as Average_payment
from
orders
LEFT JOIN
Payments
ON
orders.order_id=payments.order_id
group by orders.weekday_weekend;

-- 2) Number of Orders with review score 5 and payment type as credit card.
select reviews.review_score,payments.payment_type,count(orders.order_id) as Total_orders
FROM
Orders
LEFT JOIN
reviews
ON
orders.order_id = reviews.order_id
JOIN
payments
ON
orders.order_id=payments.order_id
GROUP BY  reviews.review_score,payments.payment_type
HAVING reviews.review_score= 5 AND payments.payment_type='Credit_card';

-- 3)Average number of days taken for order_delivered_customer_date for pet_shop

select * from orders;
select * from products;
select * from order_items;
select count(*) from order_items;


SELECT Round(AVG(orders.shipping_days),0) AS avg_shipping_days, products.product_category_name_english
FROM 
orders
LEFT JOIN 
order_items 
ON 
orders.order_id = order_items.order_id
JOIN 
products 
ON 
order_items.product_id = products.product_id
GROUP BY products.product_category_name_english 
HAVING products.product_category_name_english='pet_shop';


-- 4)Average price and payment values from customers of sao paulo city

select * from customers;
select * from order_items;
select * from payments;

select ROUND(AVG(order_items.price),0) as Average_price,ROUND(AVG(payments.payment_value),0) as Average_payment, customers.customer_city 
FROM
order_items
LEFT JOIN
payments
ON
order_items.order_id = payments.order_id
JOIN
orders
ON
order_items.order_id = orders.order_id
JOIN
customers
ON
orders.customer_id = customers.customer_id
GROUP BY
Customers.customer_city
HAVING Customers.customer_city='sao paulo' ;


-- 5)Relationship between shipping days (order_delivered_customer_date - order_purchase_timestamp) Vs review scores.
 select reviews.review_score , ROUND(AVG(Orders.shipping_days),0) as Average_days
 FROM
 orders
 LEFT JOIN
 reviews
 ON
 orders.order_id = reviews.order_id
 GROUP BY
 reviews.review_score
 HAVING reviews.review_score is NOT NULL
 order by 1;
 













