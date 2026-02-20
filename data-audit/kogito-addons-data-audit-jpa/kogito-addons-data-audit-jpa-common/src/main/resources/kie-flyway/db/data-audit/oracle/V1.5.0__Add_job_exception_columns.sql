-- Add exception details columns to Job_Execution_Log table
-- exception_message: VARCHAR2(4000) matching VARCHAR (Oracle's maximum for VARCHAR-like types)
-- exception_details: CLOB matching TEXT for large content
ALTER TABLE job_execution_log ADD exception_message VARCHAR2(4000);
ALTER TABLE job_execution_log ADD exception_details CLOB;
