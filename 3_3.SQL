set serveroutput on;
DECLARE
	rowtype clientmaster_5353%rowtype;

	p varchar(20);

	cursor clients(place varchar) is select * from clientmaster_5353 where state like place;
BEGIN
	
	p := &p;

	open clients(p);
	
	loop

	fetch clients into rowtype;

	exit when clients%notfound;
	
	dbms_output.put_line(rowtype.client_no ||'	' || rowtype.name ||'	' || rowtype.address1 ||'	' || rowtype.address2 ||'	' || rowtype.city ||'	' || rowtype.pincode ||'	' || rowtype.state ||'	' || rowtype.bal_due); 
	
	end loop;

	close clients;
	
END;
/
