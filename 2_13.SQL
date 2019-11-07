set serveroutput on;
DECLARE
	n integer;
	rev integer  := 0;
	tmp integer;
BEGIN

	n := &n;
	
	tmp := n;

	while (tmp > 0) loop
		
		rev := rev*10 + tmp mod 10;
		tmp := tmp /10;
		
	end loop;

	dbms_output.put_line(rev);

END;
/
