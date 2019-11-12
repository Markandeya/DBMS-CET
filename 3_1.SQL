set serveroutput on;
DECLARE
	rowtype product_master_5353%rowtype;	

	cursor products is select * from product_master_5353;
BEGIN
	
	open products;
	
	loop

	fetch products into rowtype;

	exit when products%notfound;
	
	dbms_output.put_line(rowtype.product_no ||'		'|| rowtype.description ||'		'  || rowtype.profit_percent ||'		' || rowtype.unit_measure ||'		' || rowtype.qty_on_hand ||'		' || rowtype.reorder_lvl ||'		' || rowtype.sell_price ||'		' || rowtype.cost_price); 
	
	end loop;

	close products;
	
END;
/
