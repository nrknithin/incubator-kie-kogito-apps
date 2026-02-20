-- Add exception details columns to Job_Execution_Log table
-- exception_message: NVARCHAR(MAX) for full flexibility
-- exception_details: NVARCHAR(MAX) for large content without space reservation when NULL
ALTER TABLE job_execution_log ADD exception_message NVARCHAR(MAX);
ALTER TABLE job_execution_log ADD exception_details NVARCHAR(MAX);
