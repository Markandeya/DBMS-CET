set serveroutput on;
DECLARE
	n integer;
	fact integer := 1;
	i integer;
BEGIN
	n := &n;
	for i in 2..n loop
		fact := fact*i;
	end loop;
	
	dbms_output.put_line('Factorial of '|| n ||' is ' ||fact);
END;
/
