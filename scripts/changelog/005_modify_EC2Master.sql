ALTER TABLE INSTANCE_MASTER ADD DNS_NAME varchar(64); 
ALTER TABLE INSTANCE_MASTER ADD CLIENT varchar(40); 
ALTER TABLE INSTANCE_MASTER CHANGE PROJECT PRODUCT varchar(40); 
ALTER TABLE INSTANCE_MASTER MODIFY LAUNCH_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;
