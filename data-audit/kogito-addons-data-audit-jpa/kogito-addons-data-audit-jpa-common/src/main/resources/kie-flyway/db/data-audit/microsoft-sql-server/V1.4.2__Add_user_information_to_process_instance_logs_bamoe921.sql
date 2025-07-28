ALTER TABLE process_instance_error_log
ADD event_user NVARCHAR(255);

ALTER TABLE process_instance_node_log
ADD event_user NVARCHAR(255);

ALTER TABLE process_instance_state_log
ADD event_user NVARCHAR(255);

ALTER TABLE process_instance_variable_log
ADD event_user NVARCHAR(255);
