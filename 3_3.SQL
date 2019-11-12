set serveroutput on;
DECLARE
	cno clientmaster_5353.client_no%type;
	nam clientmaster_5353.name%type;
	add1 clientmaster_5353.address1%type;
	add2 clientmaster_5353.address2%type;
	city clientmaster_5353.city%type;
	pin clientmaster_5353.pincode%type;
	stat clientmaster_5353.state%type;
	bal clientmaster_5353.bal_due%type;

	sno varchar(20);

	cursor clients(place varchar) is select * from clientmaster_5353 where state like place;
BEGIN
	
	p := &p;

	open clients(p);
	
	loop

	fetch clients into cno, nam, add1, add2, city, pin, stat, bal;

	exit when clients%notfound;
	
	dbms_output.put_line(cno ||'	' || nam ||'	' || add1 ||'	' || add2 ||'	' || city ||'	' || pin ||'	' || stat ||'	' || bal); 
	
	end loop;

	close clients;
	
END;
/
