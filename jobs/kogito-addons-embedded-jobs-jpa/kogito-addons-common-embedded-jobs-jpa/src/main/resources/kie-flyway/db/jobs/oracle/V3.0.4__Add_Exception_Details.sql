-- Add exception details columns to job_details table for Embedded Jobs Addon
-- exception_message: VARCHAR2(4000) matching VARCHAR (Oracle's maximum for VARCHAR-like types)
-- exception_details: CLOB matching TEXT for large content
ALTER TABLE job_details ADD exception_message VARCHAR2(4000);
ALTER TABLE job_details ADD exception_details CLOB;
