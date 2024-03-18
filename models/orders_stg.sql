SELECT
ORDERID, 
ORDERDATE, 
CUSTOMERID, 
EMPLOYEEID, 
STOREID, 
STATUS, 
CASE WHEN STATUS = 'Shipped' THEN 'Order is Shipped'
     WHEN STATUS = 'Pending' THEN 'Order is in pending state'
     WHEN STATUS = 'Processing' THEN 'Order is being processed'
     WHEN STATUS = 'Delivered' THEN 'Order is delivered' ELSE 'Some unknown status' END AS STATUSDESC,
UPDATED_AT
FROM ORDERS