/* 1A */


CREATE TABLE CLIENT_MASTER_5353(
	CLIENT_NO VARCHAR(20) PRIMARY KEY CHECK (CLIENT_NO LIKE 'C%'), 
	NAME VARCHAR(20) NOT NULL, 
	ADDRESS1 VARCHAR(20), 
	ADDRESS2 VARCHAR(20), 
	CITY VARCHAR(20), 
	PINCODE INT, 
	STATE VARCHAR(20), 
	BAL_DUE FLOAT
);



CREATE TABLE PRODUCT_MASTER_5353(PRODUCT_NO VARCHAR(20) PRIMARY KEY CHECK(PRODUCT_NO LIKE 'P%'), DESCRIPTION VARCHAR(20) NOT NULL, PROFIT_PERCENT FLOAT, UNIT_MEASURE VARCHAR(20), QTY_ON_HAND INT, REORDER_LVL INT, SELL_PRICE INT, COST_PRICE INT);



CREATE TABLE SALES_MASTER_5353(SALESMAN_NO VARCHAR(20) PRIMARY KEY CHECK(SALESMAN_NO LIKE 'S%'), SALESMAN_NAME VARCHAR(20) NOT NULL, ADDRESS1 VARCHAR(20) NOT NULL, CITY VARCHAR(20), PINCODE INT, STATE VARCHAR(20), SAL_AMT INT NOT NULL CHECK(SAL_AMT >0), TGT_TO_GET INT NOT NULL CHECK(TGT_TO_GET >0), TTD_SALES INT NOT NULL, REMARKS VARCHAR(20));



CREATE TABLE SALES_ORDER_5353(
	ORDER_NO VARCHAR(20) PRIMARY KEY CHECK(ORDER_NO LIKE 'O%'), 
	ORDER_DATE DATE, 
	CLIENT_NO VARCHAR(20),
	DELY_ADDR VARCHAR(20), 
	SALESMAN_NO VARCHAR(20), 
	DELY_TYPE CHAR(1) DEFAULT 'F',
	BILLED_YN CHAR(1), 
	DELY_DATE DATE, 
	ORDER_STATUS VARCHAR(20) CHECK( ORDER_STATUS IN ('IN PROCESS', 'FULFILLED', 'BACKORDER', 'CANCELLED')),
	FOREIGN KEY(CLIENT_NO) REFERENCES CLIENT_MASTER_5353(CLIENT_NO)
);

CREATE TABLE SALES_ORDER_DETAILS_5353(
	ORDER_NO VARCHAR(20),
	PRODUCT_NO VARCHAR(20),
	QTY_ORDERED INT,
	QTY_DISP INT,
	PRODUCT_RATE INT,
	FOREIGN KEY (ORDER_NO) REFERENCES SALES_ORDER_5353(ORDER_NO),
	FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT_MASTER_5353(PRODUCT_NO)
);

/* 2 */

--1

INSERT INTO CLIENT_MASTER_5353(CLIENT_NO , NAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, BAL_DUE ) VALUES
('C00001', 'IVAN BAYROSS', 'WANDON', 'WORLI', 'MUMBAI', 450005, 'MAHARASHTRA', 15000);

INSERT INTO CLIENT_MASTER_5353(CLIENT_NO , NAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, BAL_DUE ) VALUES
('C00002', 'VANDANA SHIVA', 'DON STREET', 'BANDRA', 'MADRAS', 780001, 'TAMILNADU', 0);

INSERT INTO CLIENT_MASTER_5353(CLIENT_NO , NAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, BAL_DUE ) VALUES
('C00003', 'PRAMADAJAGUST', 'MANDON', 'DADAR', 'MUMBAI', 450007, 'MAHARASHTRA', 5000);

INSERT INTO CLIENT_MASTER_5353(CLIENT_NO , NAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, BAL_DUE ) VALUES
('C00004', 'BASU NAVINDGI', 'JEROME', 'JUHU', 'MUMBAI', 450009, 'MAHARASHTRA', 0);

INSERT INTO CLIENT_MASTER_5353(CLIENT_NO , NAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, BAL_DUE ) VALUES
('C00005', 'RAVISREEDHARAN', 'DADAR', 'DADRA', 'DELHI', 100003, 'DELHI', 2000);

INSERT INTO CLIENT_MASTER_5353(CLIENT_NO , NAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, BAL_DUE ) VALUES
('C00006', 'RUKMINI', 'ROURK', 'BANDRA', 'MUMBAI', 450002, 'MAHARASHTRA', 0);

--2
INSERT INTO PRODUCT_MASTER_5353(PRODUCT_NO, DESCRIPTION, PROFIT_PERCENT, UNIT_MEASURE, QTY_ON_HAND, REORDER_LVL, SELL_PRICE, COST_PRICE) VALUES
('P00001', '1.44 FLOPPIES', 5, 'PIECE', 100, 20, 525, 500);

INSERT INTO PRODUCT_MASTER_5353(PRODUCT_NO, DESCRIPTION, PROFIT_PERCENT, UNIT_MEASURE, QTY_ON_HAND, REORDER_LVL, SELL_PRICE, COST_PRICE) VALUES
('P03453', 'MONITORS', 6, 'PIECE', 10, 3, 12000, 11280);

INSERT INTO PRODUCT_MASTER_5353(PRODUCT_NO, DESCRIPTION, PROFIT_PERCENT, UNIT_MEASURE, QTY_ON_HAND, REORDER_LVL, SELL_PRICE, COST_PRICE) VALUES
('P45789', 'MOUSE', 5, 'PIECE', 20, 5, 1050, 1000);

INSERT INTO PRODUCT_MASTER_5353(PRODUCT_NO, DESCRIPTION, PROFIT_PERCENT, UNIT_MEASURE, QTY_ON_HAND, REORDER_LVL, SELL_PRICE, COST_PRICE) VALUES
('P44783', 'KEYBOARDS', 5, 'PIECE', 100, 20, 3150, 3050);

INSERT INTO PRODUCT_MASTER_5353(PRODUCT_NO, DESCRIPTION, PROFIT_PERCENT, UNIT_MEASURE, QTY_ON_HAND, REORDER_LVL, SELL_PRICE, COST_PRICE) VALUES
('P45123', 'CD DRIVE', 2, 'PIECE', 10, 3, 5250, 5100);

INSERT INTO PRODUCT_MASTER_5353(PRODUCT_NO, DESCRIPTION, PROFIT_PERCENT, UNIT_MEASURE, QTY_ON_HAND, REORDER_LVL, SELL_PRICE, COST_PRICE) VALUES
('P35412', '540 HDD', 2.5, 'PIECE', 10, 3, 8400, 8000);

--3

INSERT INTO SALES_MASTER_5353 VALUES ('S00001', 'KIRAN', 'A/14', 'WORLI', 450001, 'BOMBAY', 3000, 100, 50, 'GOOD');
INSERT INTO SALES_MASTER_5353 VALUES ('S00002', 'MANEESH', 'J-65', 'NARIMAN', 450001, 'BOMBAY', 3000, 200, 100, 'GOOD');
INSERT INTO SALES_MASTER_5353 VALUES ('S00003', 'RAVI', 'P-7', 'BANDRA', 450003, 'BOMBAY', 3000, 200, 100, 'GOOD');
INSERT INTO SALES_MASTER_5353 VALUES ('S00004', 'ASHISH', 'A/5', 'JUHU', 400041, 'BOMBAY', 3000, 200, 150, 'GOOD');


--4

INSERT INTO SALES_ORDER_5353  VALUES ('O19001', TO_DATE('1996-01-12', 'YYYY-MM-DD'), 'C00001', 'WANDON', 'S00001', 'F', 'N',  TO_DATE('1996-01-20', 'YYYY-MM-DD'), 'IN PROCESS');

INSERT INTO SALES_ORDER_5353  VALUES ('O19002', TO_DATE('1996-01-25', 'YYYY-MM-DD'), 'C00002', 'DON STREET', 'S00002', 'P', 'N',  TO_DATE('1996-01-27', 'YYYY-MM-DD'), 'CANCELLED');

INSERT INTO SALES_ORDER_5353  VALUES ('O46865', TO_DATE('1996-02-18', 'YYYY-MM-DD'), 'C00003', 'MANDON', 'S00003', 'F', 'Y',  TO_DATE('1996-02-20', 'YYYY-MM-DD'), 'FULFILLED');

INSERT INTO SALES_ORDER_5353  VALUES ('O19003', TO_DATE('1996-04-03', 'YYYY-MM-DD'), 'C00001', 'JEROME', 'S00001', 'F', 'Y',  TO_DATE('1996-04-07', 'YYYY-MM-DD'), 'FULFILLED');

INSERT INTO SALES_ORDER_5353  VALUES ('O46866', TO_DATE('1996-05-20', 'YYYY-MM-DD'), 'C00004', 'DADAR', 'S00002', 'P', 'N',  TO_DATE('1996-05-22', 'YYYY-MM-DD'), 'CANCELLED');

INSERT INTO SALES_ORDER_5353  VALUES ('O19008', TO_DATE('1996-05-24', 'YYYY-MM-DD'), 'C00005', 'ROURK', 'S00004', 'F', 'N',  TO_DATE('1996-05-26', 'YYYY-MM-DD'), 'IN PROCESS');

--5

INSERT INTO SALES_ORDER_DETAILS_5353 VALUES ('O19001', 'P00001', 4, 4, 525 );

INSERT INTO SALES_ORDER_DETAILS_5353 VALUES ('O19002', 'P00001', 10, 0, 525 );

INSERT INTO SALES_ORDER_DETAILS_5353 VALUES ('O46865', 'P00001', 10, 10, 525 );

INSERT INTO SALES_ORDER_DETAILS_5353 VALUES ('O46865', 'P03453', 4, 4, 1050 );

INSERT INTO SALES_ORDER_DETAILS_5353 VALUES ('O19003', 'P03453', 2, 2, 1050 );

INSERT INTO SALES_ORDER_DETAILS_5353 VALUES ('O19008', 'P00001', 10, 5, 525 );


/* 1B */


RENAME CLIENT_MASTER_5353 TO CLIENTMASTER_5353;

Table renamed

/* 1C */

ALTER TABLE SALES_ORDER_5353 ADD CONSTRAINT DELYAFTERORDER CHECK (ORDER_DATE < DELY_DATE);


/* 1D */

ALTER TABLE PRODUCT_MASTER_5353 ADD CONSTRAINT COSTNOTZERO CHECK(COST_PRICE>0);

/* 1E */

ALTER TABLE PRODUCT_MASTER_5353 MODIFY COST_PRICE INT NOT NULL;

/* 1F */

ALTER TABLE PRODUCT_MASTER_5353 ADD CONSTRAINT SELLNOTZERO CHECK(SELL_PRICE>0);

/* 3 A */

SELECT SALESMAN_NAME FROM SALES_MASTER_5353 WHERE SALESMAN_NAME LIKE '_A%';

SALESMAN_NAME
--------------------
MANEESH
RAVI

/* 3 B */

SELECT NAME FROM CLIENTMASTER_5353 WHERE NAME LIKE 'R%' AND CITY LIKE 'DELHI';

NAME
--------------------
RAVISREEDHARAN

/* 3 C */

SELECT NAME, ADDRESS1, ADDRESS2 FROM CLIENTMASTER_5353 WHERE STATE IN ('DELHI', 'MAHARASHTRA');

NAME		     ADDRESS1		  ADDRESS2
-------------------- -------------------- --------------------
IVAN BAYROSS	     WANDON		  WORLI
PRAMADAJAGUST	     MANDON		  DADAR
BASU NAVINDGI	     JEROME		  JUHU
RAVISREEDHARAN	     DADAR		  DADRA
RUKMINI 	     ROURK		  BANDRA


/* 3 D */

SELECT * FROM PRODUCT_MASTER_5353 WHERE COST_PRICE > 5000;

PRODUCT_NO	     DESCRIPTION	  PROFIT_PERCENT UNIT_MEASURE	      QTY_ON_HAND REORDER_LVL SELL_PRICE COST_PRICE
-------------------- -------------------- -------------- -------------------- ----------- ----------- ---------- ----------
P03453		     MONITORS			       6 PIECE			       10	    3	   12000      11280
P45123		     CD DRIVE			       2 PIECE			       10	    3	    5250       5100
P35412		     540 HDD			     2.5 PIECE			       10	    3	    8400       8000

/* 3 E */

select * from SALES_ORDER_5353 where extract( MONTH from ORDER_DATE) = 5;

ORDER_NO	     ORDER_DAT CLIENT_NO	    DELY_ADDR		 SALESMAN_NO	      D B DELY_DATE ORDER_STATUS
-------------------- --------- -------------------- -------------------- -------------------- - - --------- --------------------
O46866		     20-MAY-96 C00004		    DADAR		 S00002 	      P N 22-MAY-96 CANCELLED
O19008		     24-MAY-96 C00005		    ROURK		 S00004 	      F N 26-MAY-96 IN PROCESS


/* 3 F */

select * from SALES_MASTER_5353 where SALESMAN_NO like 'S00001' OR SALESMAN_NO like 'S00002';

SALESMAN_NO	     SALESMAN_NAME	  ADDRESS1	       CITY		       PINCODE STATE		       SAL_AMT TGT_TO_GET  TTD_SALES REMARKS
-------------------- -------------------- -------------------- -------------------- ---------- -------------------- ---------- ---------- ---------- --------------------
S00001		     KIRAN		  A/14		       WORLI			450001 BOMBAY			  3000	      100	  50 GOOD
S00002		     MANEESH		  J-65		       NARIMAN			450001 BOMBAY			  3000	      200	 100 GOOD


/* 3 G */

select * from PRODUCT_MASTER_5353 where SELL_PRICE > 2000 AND SELL_PRICE <= 5000;

PRODUCT_NO	     DESCRIPTION	  PROFIT_PERCENT UNIT_MEASURE	      QTY_ON_HAND REORDER_LVL SELL_PRICE COST_PRICE
-------------------- -------------------- -------------- -------------------- ----------- ----------- ---------- ----------
P44783		     KEYBOARDS			       5 PIECE			      100	   20	    3150       3050


/* 3 H */

select DESCRIPTION, SELL_PRICE*0.2 "NEW_PRICE" from PRODUCT_MASTER_5353 where SELL_PRICE > 3000; 


DESCRIPTION	      NEW_PRICE
-------------------- ----------
MONITORS		   2400
KEYBOARDS		    630
CD DRIVE		   1050
540 HDD 		   1680


/* 3 I */

select count(*) from PRODUCT_MASTER_5353;


  COUNT(*)
----------
	 6

/* 3 J */


select count(ORDER_STATUS) from SALES_ORDER_5353 where ORDER_STATUS LIKE 'FULFILLED';


COUNT(ORDER_STATUS)
-------------------
		  2

/* 3 K */

select avg(SELL_PRICE), avg(COST_PRICE) from PRODUCT_MASTER_5353;

AVG(SELL_PRICE) AVG(COST_PRICE)
--------------- ---------------
	 5062.5      4821.66667


/* 4 A */


select ORDER_NO, extract( DAY from ORDER_DATE) from SALES_ORDER_5353; //select ORDER_NO, to_char(ORDER_DATE, 'day') from SALES_ORDER_5353;

ORDER_NO	     EXTRACT(DAYFROMORDER_DATE)
-------------------- --------------------------
O19001					     12
O19002					     25
O46865					     18
O19003					      3
O46866					     20
O19008					     24

6 rows selected.

/* 4 B */

select extract(MONTH from DELY_DATE), DELY_DATE from SALES_ORDER_5353;


EXTRACT(MONTHFROMDELY_DATE) DELY_DATE
--------------------------- ---------
			  1 20-JAN-96
			  1 27-JAN-96
			  2 20-FEB-96
			  4 07-APR-96
			  5 22-MAY-96
			  5 26-MAY-96

6 rows selected.

/* 4 C */

select  to_char(order_date, 'dd/month/yy')  from sales_order_5353;



TO_CHAR(ORDER_D
---------------
12/january  /96
25/january  /96
18/february /96
03/april    /96
20/may	    /96
24/may	    /96

6 rows selected.


/* 4 D */

select sysdate + 15 as "15 days" from dual;

15 days
---------
20-SEP-19


/* 4 E */

select order_no, dely_date - order_date as "Days elapsed" from sales_order_5353;


ORDER_NO	     Days elapsed
-------------------- ------------
O19001				8
O19002				2
O46865				2
O19003				4
O46866				2
O19008				2

6 rows selected.

/* 5 */

create table item_order12_5353(
	cust_name varchar(15),
	address varchar(10),
	item varchar(15),
	price number(5) );

Table created.


insert into item_order12_5353 values('BASU', 'WORLI', 'MONITOR', 1000);

1 row created.

insert into item_order12_5353 values('IVAN', 'JUHU', 'KEYBOARD', 800);
insert into item_order12_5353 values('IVAN', 'WORLI', 'PRINTER', 1500);
insert into item_order12_5353 values('BAYROSS', 'WANDON', 'PRINTER', 1500);
insert into item_order12_5353 values('BASU', 'DADAR', 'MOUSE', 500);
insert into item_order12_5353 values('VANDANA', 'WANDON', 'MONITOR', 1000);
insert into item_order12_5353 values('VANDANA', 'WANDON', 'KEYBOARD', 800);
insert into item_order12_5353 values('BAYROSS', 'JUHU', 'MOUSE', 500);

/* 5 A */

select item,sum(price) from item_order12_5353 group by item;

ITEM		SUM(PRICE)
--------------- ----------
MONITOR 	      2000
PRINTER 	      3000
MOUSE		      1000
KEYBOARD	      1600

4 rows selected.

/* 5 B */

select cust_name, item from item_order12_5353 order by cust_name;

CUST_NAME	ITEM
--------------- ---------------
BASU		MONITOR
BASU		MOUSE
BAYROSS 	PRINTER
BAYROSS 	MOUSE
IVAN		KEYBOARD
IVAN		PRINTER
VANDANA 	MONITOR
VANDANA 	KEYBOARD

8 rows selected.

/* 5 C */

select item, address from item_order12_5353 order by address;

ITEM		ADDRESS
--------------- ----------
MOUSE		DADAR
KEYBOARD	JUHU
MOUSE		JUHU
PRINTER 	WANDON
MONITOR 	WANDON
KEYBOARD	WANDON
PRINTER 	WORLI
MONITOR 	WORLI

8 rows selected.

/* 5 D */

select cust_name, sum(price) from item_order12_5353 group by cust_name having sum(price) > 200;

CUST_NAME	SUM(PRICE)
--------------- ----------
BAYROSS 	      2000
BASU		      1500
IVAN		      2300
VANDANA 	      1800

/* 6 A */

select name, address1, address2, city, pincode from clientmaster_5353 where client_no like (select client_no
from sales_order_5353 where order_no like 'O19001');


NAME		     ADDRESS1		  ADDRESS2	       CITY		       PINCODE
-------------------- -------------------- -------------------- -------------------- ----------
IVAN BAYROSS	     WANDON		  WORLI 	       MUMBAI			450005


/* 6 B */

select name from clientmaster_5353 where client_no IN (select client_no from sales_order_5353 where  extract(MONTH from order_date) < 5);


NAME
--------------------
IVAN BAYROSS
VANDANA SHIVA
PRAMADAJAGUST


/* 6 C */ 

select client_no, name from clientmaster_5353 where client_no in (select client_no from sales_order_5353 where order_no in (select order_no from sales_order_details_5353 where product_no like (select product_no from product_master_5353 where description like '1.44 FLOPPIES')));


CLIENT_NO	     NAME
-------------------- --------------------
C00001		     IVAN BAYROSS
C00003		     PRAMADAJAGUST
C00002		     VANDANA SHIVA
C00005		     RAVISREEDHARAN

/* 6 D */

select product_no, description from product_master_5353 where product_no not in (select distinct product_no from sales_order_details_5353);

PRODUCT_NO	     DESCRIPTION
-------------------- --------------------
P35412		     540 HDD
P44783		     KEYBOARDS
P45123		     CD DRIVE
P45789		     MOUSE

/* 6 E */


select name from clientmaster_5353 where client_no IN (select client_no from sales_order_5353 where order_no IN (select order_no from sales_order_details_5353 where product_rate * qty_ordered >= 1000));

NAME
--------------------
IVAN BAYROSS
VANDANA SHIVA
PRAMADAJAGUST
RAVISREEDHARAN



/* 7 A */

create view clientmaster_5353_view as select client_no, name, city from clientmaster_5353;

View created.


/* 7 B */

update clientmaster_5353_view set name='IVAN BAYROSE' where client_no LIKE 'C00001';

1 row updated.

update clientmaster_5353_view set name='PADMAJA AGUST' where client_no LIKE 'C00003';

1 row updated.

select * from clientmaster_5353_view;


CLIENT_NO	     NAME		  CITY
-------------------- -------------------- --------------------
C00001		     IVAN BAYROSE	  MUMBAI
C00002		     VANDANA SHIVA	  MADRAS
C00003		     PADMAJA AGUST	  MUMBAI
C00004		     BASU NAVINDGI	  MUMBAI
C00005		     RAVISREEDHARAN	  DELHI
C00006		     RUKMINI		  MUMBAI

6 rows selected.




