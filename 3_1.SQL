set serveroutput on;
DECLARE
	pid product_master_5353.product_no%type;
	des product_master_5353.description%type;
	profit product_master_5353.profit_percent%type;
	unit product_master_5353.unit_measure%type;
	qty product_master_5353.qty_on_hand%type;
	reorder product_master_5353.reorder_lvl%type;
	sell product_master_5353.sell_price%type;
	cost product_master_5353.cost_price%type;	

	cursor products is select * from product_master_5353;
BEGIN
	
	open products;
	
	loop

	fetch products into pid, des, profit, unit, qty, reorder, sell, cost;

	exit when products%notfound;
	
	dbms_output.put_line(pid ||'		'|| des ||'		'  || profit ||'		' || unit ||'		' || qty ||'		' || reorder ||'		' || sell ||'		' || cost); 
	
	end loop;

	close products;
	
END;
/
