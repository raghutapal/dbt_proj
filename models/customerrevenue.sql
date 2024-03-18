{{config(materialized = 'table')}}

select 
f.orderid,
c.customername,
sum(f.ordercount) as ordercount,
sum(f.revenue) as revenue
from {{ref("orders_fact")}} f
inner join {{ref("customers_stg")}} c on f.customerid = c.customerid
group by 
f.orderid,
c.customername