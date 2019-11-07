set serveroutput on;
declare
	string varchar(20);
	reverse varchar(20);
	len integer;	

begin
	string := &string;
	
	len := length(string);

	reverse := '';

	for i in reverse 1..len loop
		reverse := reverse || substr(string, i, 1);

	end loop;
	
	dbms_output.put_line(reverse);
end;
/
