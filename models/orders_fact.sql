{{config(materialized = 'table')}}

SELECT
o.ORDERID, 
o.ORDERDATE, 
o.CUSTOMERID, 
o.EMPLOYEEID, 
o.STOREID, 
o.STATUS, 
o.STATUSDESC,
count(distinct oi.orderid) as ordercount,
sum(oi.totalprice) as revenue
from {{ref("orders_stg")}} as o
join {{ref("orderitems_stg")}} as oi on o.orderid = oi.orderid

group by 
o.ORDERID, 
o.ORDERDATE, 
o.CUSTOMERID, 
o.EMPLOYEEID, 
o.STOREID, 
o.STATUS, 
o.STATUSDESC




