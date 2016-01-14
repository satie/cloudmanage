CREATE DATABASE quartz;

USE quartz;

-- LDAP AD Authorities or Groups

CREATE TABLE LDAP_AUTHORITY_MASTER (
	LDAP_AUTH_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	LDAP_AUTH_NAME varchar(80)
);

-- Applications Authorities

CREATE TABLE APP_AUTHORITY_MASTER (
	APP_AUTH_ID TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	APP_AUTH_NAME varchar(40)
);

-- Mapping table of the above two
CREATE TABLE AUTHORITY_MAP (
	LDAP_AUTHORITY_ID INT,
	APP_AUTHORITY_ID TINYINT,
	PRIMARY KEY (LDAP_AUTHORITY_ID, APP_AUTHORITY_ID),
	CONSTRAINT APP_FK FOREIGN KEY (APP_AUTHORITY_ID) REFERENCES APP_AUTHORITY_MASTER (APP_AUTH_ID),
  	CONSTRAINT LDAP_FK FOREIGN KEY (LDAP_AUTHORITY_ID) REFERENCES LDAP_AUTHORITY_MASTER (LDAP_AUTH_ID)
);

-- Access Condition Mapper

CREATE TABLE AUTHORITY_TAG_MAP (
	TAG_TYPE varchar(40), 
	TAG_VALUE varchar(40),
	LDAP_AUTH_NAMES varchar(40),
	PRIMARY KEY (TAG_TYPE, TAG_VALUE)
);

-- Audit 

CREATE TABLE AUDIT_INFO (
	AUDIT_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	EVENT_TYPE varchar(100),
    EVENT_PARAMS varchar(400),
    USER varchar(40),
    EVENT_TIME datetime
);
