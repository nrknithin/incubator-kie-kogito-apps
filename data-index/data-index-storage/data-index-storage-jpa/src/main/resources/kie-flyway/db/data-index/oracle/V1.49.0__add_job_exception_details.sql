-- Add exception details columns to jobs table
-- exception_message: VARCHAR2(4000) matching VARCHAR (Oracle's maximum for VARCHAR-like types)
-- exception_details: CLOB matching TEXT for large content
ALTER TABLE jobs ADD exception_message VARCHAR2(4000);
ALTER TABLE jobs ADD exception_details CLOB;
