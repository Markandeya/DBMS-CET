set serveroutput on;
DECLARE 
	n1 integer := 0;
	n2 integer := 1; 
	cur integer := 1;
	i integer; 
	tmp integer; 
BEGIN 
	i := &i;
	
	for tmp in 1..i loop
		dbms_output.put_line(cur);
		cur := n1+n2;
		n1 := n2;
		n2 := cur;
	end loop;
	 
END; 
/
