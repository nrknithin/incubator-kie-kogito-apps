-- Add exception details columns to job_details table for Embedded Jobs Addon
-- exception_message: NVARCHAR(MAX) for full flexibility
-- exception_details: NVARCHAR(MAX) for large content without space reservation when NULL
ALTER TABLE job_details ADD exception_message NVARCHAR(MAX);
ALTER TABLE job_details ADD exception_details NVARCHAR(MAX);

