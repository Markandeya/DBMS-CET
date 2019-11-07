set serveroutput on;
DECLARE
	pid varchar(20);
	price integer;
BEGIN
	
	pid := &pid;

	select cost_price into price from product_master_5353 where product_no like pid;
	
	if price >= 3000 then
		
		price := price - 200;
		
		update product_master_5353 set cost_price = price where product_no like pid;

	end if;
	
	dbms_output.put_line('Price:' || price);

EXCEPTION

	when no_data_found then
		dbms_output.put_line('The entered product id is not available in the database');
	
END;
/
