CREATE TABLE LDAP_AUTHORITY_MASTER (
	LDAP_AUTH_ID TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	LDAP_AUTH_NAME varchar(40)
);

CREATE TABLE APP_AUTHORITY_MASTER (
	APP_AUTH_ID TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	APP_AUTH_NAME varchar(40)
);

CREATE TABLE AUTHORITY_MAP (
	LDAP_AUTHORITY_ID TINYINT,
	APP_AUTHORITY_ID TINYINT,
	PRIMARY KEY (LDAP_AUTHORITY_ID, APP_AUTHORITY_ID),
	CONSTRAINT APP_FK FOREIGN KEY (APP_AUTHORITY_ID) REFERENCES APP_AUTHORITY_MASTER (APP_AUTH_ID),
  	CONSTRAINT LDAP_FK FOREIGN KEY (LDAP_AUTHORITY_ID) REFERENCES LDAP_AUTHORITY_MASTER (LDAP_AUTH_ID)
);

insert into LDAP_AUTHORITY_MASTER(LDAP_AUTH_NAME) value ('techops');
insert into APP_AUTHORITY_MASTER(APP_AUTH_NAME) value ('Operator');
insert into APP_AUTHORITY_MASTER(APP_AUTH_NAME) value ('Administrator');
insert into APP_AUTHORITY_MASTER(APP_AUTH_NAME) value ('Manager');
insert into AUTHORITY_MAP value (1,1);
insert into AUTHORITY_MAP value (1,2);
insert into AUTHORITY_MAP value (1,3);