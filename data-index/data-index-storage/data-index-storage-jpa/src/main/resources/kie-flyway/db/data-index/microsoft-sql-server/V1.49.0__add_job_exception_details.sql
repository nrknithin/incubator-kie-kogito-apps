-- Add exception details columns to jobs table
-- exception_message: NVARCHAR(MAX) for full flexibility
-- exception_details: NVARCHAR(MAX) for large content without space reservation when NULL
ALTER TABLE jobs ADD exception_message NVARCHAR(MAX);
ALTER TABLE jobs ADD exception_details NVARCHAR(MAX);
