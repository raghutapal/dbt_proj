{{config(materialized = 'table')}}

with customerorders as (
SELECT  
c.customerid,
concat(c.firstname,' ',c.lastname) as customername,
count(orderid) as ordercount
from customers c
inner join orders o on c.customerid = o.customerid
group by c.customerid,customername
order by ordercount desc)

select 
customerid,
customername,
ordercount
from customerorders