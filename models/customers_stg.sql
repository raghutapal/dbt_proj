
with customers_stg as (
SELECT 
CUSTOMERID,
FIRSTNAME, 
LASTNAME, 
EMAIL, 
PHONE, 
ADDRESS, 
CITY, 
STATE, 
ZIPCODE, 
UPDATED_AT,
CONCAT(FIRSTNAME,'_',LASTNAME) AS CUSTOMERNAME
FROM CUSTOMERS
) 

select * from customers_stg