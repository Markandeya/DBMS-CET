set serveroutput on;
DECLARE 
	n1 integer;
	n2 integer; 
	n3 integer;
BEGIN 
	n1 := &n1;
	n2 := &n2;
	n3 := &n3;
	 
	IF(n1>=n2 and n1>=n3)THEN  
		dbms_output.put_line(n1 || ' is biggest'); 
	ELSIF(n2>=n1 and n2>=n3) THEN 
		dbms_output.put_line(n2  || ' is biggest');
	ELSE  
   		dbms_output.put_line(n3  || ' is biggest'); 
	END IF; 
END; 
/
