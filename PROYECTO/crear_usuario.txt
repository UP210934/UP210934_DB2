alter session set "_ORACLE_SCRIPT"=true;

drop user BD_FLIX CASCADE;

CREATE USER BD_FLIX 
IDENTIFIED BY bd_flix
default tablespace users
temporary tablespace temp
quota unlimited on users;

GRANT CONNECT, 
      RESOURCE, 
	  CREATE VIEW,
	  CREATE SYNONYM
 TO BD_FLIX;

grant create any index to BD_FLIX;
GRANT EXECUTE any PROCEDURE TO BD_FLIX;