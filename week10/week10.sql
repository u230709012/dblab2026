use company;
#1) Shows the customer locations.

CREATE VIEW view_customer_location AS
select CustomerName, Country from Customers;

select * from view_customer_location;

#2) Total quantity ordered for each product.

select P.ProductName, 
	SUM(OD.Quantity) AS TotalQuantity
From orderdetails OD
join Products P on OD.ProductId = P.ProductId
Group by P.ProductName;    

select * from  view_product_sales
Where TotalQuantity < 159;

#3) Countries With the Most Customers.

create view view_customer_country_count AS
select
	Country,
    count(*) AS TotalCustomers
From customers
group by Country
order by TotalCustomers desc;

select * from view view_customer_country_count;

#4) Orders with Shipper Information.

create view view_order_shipper as

select 
	O.OrderID,
    O.OrderDate,
    C.CustomerName,
    S.ShipperName
From Orders O
join Customers C on O.CustomerId= C.CustomerId   
join Shippers S on O.ShipperId = S.ShipperId;

select ShipperName, Count(*) as OrderCount
from view_order_shipper
group by ShipperName
Order by OrderCount desc;
