set serveroutput on;
DECLARE
	ono sales_order_5353.order_no%type;
	odate sales_order_5353.order_date%type;
	cno sales_order_5353.client_no%type;
	delyaddr sales_order_5353.dely_addr%type;
	sman_no sales_order_5353.salesman_no%type;
	delytype sales_order_5353.dely_type%type;
	billed sales_order_5353.billed_yn%type;
	delydate sales_order_5353.dely_date%type;
	ostatus sales_order_5353.order_status%type;

	sno varchar(20);

	cursor sales(snum varchar) is select * from sales_order_5353 where salesman_no like snum;
BEGIN
	
	sno := &sno;

	open sales(sno);
	
	loop

	fetch sales into ono, odate, cno, delyaddr, sman_no, delytype, billed, delydate, ostatus;

	exit when sales%notfound;
	
	dbms_output.put_line(ono ||'	' || odate ||'	' || cno ||'	' || delyaddr ||'	' || sman_no ||'	' || delytype ||'	' || billed ||'	' || delydate ||'	' || ostatus); 
	
	end loop;

	close sales;
	
END;
/
