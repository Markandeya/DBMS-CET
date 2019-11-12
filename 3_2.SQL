set serveroutput on;
DECLARE
	rowtype  sales_order_5353%rowtype;
	sno varchar(20);

	cursor sales(snum varchar) is select * from sales_order_5353 where salesman_no like snum;
BEGIN
	
	sno := &sno;

	open sales(sno);
	
	loop

	fetch sales into rowtype;

	exit when sales%notfound;
	
	dbms_output.put_line(rowtype.order_no ||'	' || rowtype.order_date ||'	' || rowtype.client_no ||'	' || rowtype.dely_addr ||'	' || rowtype.salesman_no ||'	' || rowtype.dely_type ||'	' || rowtype.billed_yn ||'	' || rowtype.dely_date ||'	' || rowtype.order_status); 
	
	end loop;

	close sales;
	
END;
/
