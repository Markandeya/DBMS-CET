set serveroutput on;
DECLARE
	no integer;
	odd integer :=1;
	i integer;
	total integer := 0;


BEGIN
	no := &no;
	
	for i in 1..no loop
		total := total + odd;
		odd := odd+2;
	end loop;

	dbms_output.put_line('Sum of '|| no || ' odd no: is ' || total);
END;
/
