ALTER TABLE process_instance_node_log DROP CONSTRAINT process_instance_node_log_event_type_check;
ALTER TABLE process_instance_state_log DROP CONSTRAINT process_instance_state_log_event_type_check;

ALTER TABLE process_instance_node_log ADD CONSTRAINT process_instance_node_log_event_type_check CHECK (event_type in ('ENTER','EXIT','ABORTED','ASYNC_ENTER','OBSOLETE','SKIPPED','ERROR','SLA_VIOLATION','STATE_UPDATED'));
ALTER TABLE process_instance_state_log ADD CONSTRAINT process_instance_state_log_event_type_check CHECK (event_type in ('ACTIVE','COMPLETED','SLA_VIOLATION','MIGRATED','STATE_UPDATED'));