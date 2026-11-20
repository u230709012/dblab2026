use company;
DELIMITER $$
CREATE PROCEDURE SelectCustomerByCountry(IN c varchar(45))

BEGIN
	SELECT * FROM Customers
    Where country =c;
end $$
DELIMITER ;

SET @country = "Spain";
Select @country;
call SelectCustomerByCountry(@country);
select @country;


DELIMITER $$
CREATE PROCEDURE GetOrderCountByShipper(IN shipper varchar(45), out count INT)

BEGIN
	SELECT COUNT(OrderID) INTO count
    FROM Orders
    JOIN Shippers on Orders.ShipperID = Shippers.ShipperID
    Where ShipperName= shipper;
end $$
DELIMITER ;

select ShipperName from Shippers;
Set @order_cnt = 0;
select @order_cnt;
call GetOrderCountByShipper("United Package",@order_cnt);

DELIMITER $$
CREATE PROCEDURE GetCustomerSalesOut(IN inCustomerID INT, OUT outName VARCHAR(45), OUT outSales FLOAT)


BEGIN
	SELECT CustomerName INTO outName
    From Customers 
    WHERE CustomerID=inCustomerID;
    
    select IFNULL(SUM(p.price*od.quantity),0) INTO outSales
    From orders o
    JOIN OrderDetails od on o.OrderID = od.OrderID
    join Products p on p.productID =od.ProductID
    where o.CustomerID =inCustomerID;
    
end $$
DELIMITER ;

call GetCustomerSalesOut(5, @name, @sales);
select @name, @sales
call GetCustomerSalesOut(1, @name, @sales);
select @name, @sales




