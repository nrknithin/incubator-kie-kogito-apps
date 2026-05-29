-- IBM Confidential
-- PID 5900-AR4
-- Copyright IBM Corp. 2026

CREATE TABLE audit_query (
    identifier VARCHAR(255) NOT NULL,
    graph_ql_definition VARCHAR(5000),
    query VARCHAR(5000),
    CONSTRAINT audit_query_pkey PRIMARY KEY (identifier)
);

CREATE SEQUENCE job_execution_history_id_seq
    START WITH 1
    INCREMENT BY 50
    CACHE 5;

CREATE TABLE job_execution_log (
    id BIGINT NOT NULL,
    event_date TIMESTAMP(6),
    execution_counter INTEGER,
    expiration_time TIMESTAMP(6),
    job_id VARCHAR(255),
    node_instance_id VARCHAR(255),
    priority INTEGER,
    process_instance_id VARCHAR(255),
    repeat_interval BIGINT,
    repeat_limit INTEGER,
    retries INTEGER,
    scheduled_id VARCHAR(255),
    status VARCHAR(255),
    exception_message VARCHAR(32672),
    exception_details CLOB(2M),
    CONSTRAINT job_execution_log_pkey PRIMARY KEY (id)
);

CREATE TABLE process_instance_error_log (
    id BIGINT NOT NULL,
    business_key VARCHAR(255),
    event_date TIMESTAMP(6),
    event_id VARCHAR(255),
    parent_process_instance_id VARCHAR(255),
    process_id VARCHAR(255),
    process_instance_id VARCHAR(255),
    process_type VARCHAR(255),
    process_version VARCHAR(255),
    root_process_id VARCHAR(255),
    root_process_instance_id VARCHAR(255),
    error_message VARCHAR(255),
    node_definition_id VARCHAR(255),
    node_instance_id VARCHAR(255),
    event_user VARCHAR(255),
    CONSTRAINT process_instance_error_log_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE process_instance_error_log_seq_id
    START WITH 1
    INCREMENT BY 50
    NO MAXVALUE
    NO MINVALUE
    CACHE 5;

CREATE TABLE process_instance_node_log (
    id BIGINT NOT NULL,
    business_key VARCHAR(255),
    event_date TIMESTAMP(6),
    event_id VARCHAR(255),
    parent_process_instance_id VARCHAR(255),
    process_id VARCHAR(255),
    process_instance_id VARCHAR(255),
    process_type VARCHAR(255),
    process_version VARCHAR(255),
    root_process_id VARCHAR(255),
    root_process_instance_id VARCHAR(255),
    connection VARCHAR(255),
    event_data VARCHAR(255),
    event_type VARCHAR(255),
    node_definition_id VARCHAR(255),
    node_instance_id VARCHAR(255),
    node_name VARCHAR(255),
    node_type VARCHAR(255),
    sla_due_date TIMESTAMP(6),
    work_item_id VARCHAR(255),
    event_user VARCHAR(255),
    CONSTRAINT process_instance_node_log_event_type_check CHECK (event_type IN ('ENTER', 'EXIT', 'ABORTED', 'ASYNC_ENTER', 'OBSOLETE', 'SKIPPED', 'ERROR', 'SLA_VIOLATION', 'STATE_UPDATED')),
    CONSTRAINT process_instance_node_log_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE process_instance_node_log_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MAXVALUE
    NO MINVALUE
    CACHE 5;

CREATE TABLE process_instance_state_log (
    id BIGINT NOT NULL,
    business_key VARCHAR(255),
    event_date TIMESTAMP(6),
    event_id VARCHAR(255),
    parent_process_instance_id VARCHAR(255),
    process_id VARCHAR(255),
    process_instance_id VARCHAR(255),
    process_type VARCHAR(255),
    process_version VARCHAR(255),
    root_process_id VARCHAR(255),
    root_process_instance_id VARCHAR(255),
    event_type VARCHAR(255) NOT NULL,
    outcome VARCHAR(255),
    sla_due_date TIMESTAMP(6),
    state VARCHAR(255),
    event_user VARCHAR(255),
    CONSTRAINT process_instance_state_log_event_type_check CHECK (event_type IN ('ACTIVE', 'COMPLETED', 'SLA_VIOLATION', 'MIGRATED', 'STATE_UPDATED', 'RETRIGGERED')),
    CONSTRAINT process_instance_state_log_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE process_instance_state_log_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MAXVALUE
    NO MINVALUE
    CACHE 5;

CREATE TABLE process_instance_state_roles_log (
    process_instance_state_log_id BIGINT NOT NULL,
    role VARCHAR(255)
);

CREATE TABLE process_instance_variable_log (
    id BIGINT NOT NULL,
    business_key VARCHAR(255),
    event_date TIMESTAMP(6),
    event_id VARCHAR(255),
    parent_process_instance_id VARCHAR(255),
    process_id VARCHAR(255),
    process_instance_id VARCHAR(255),
    process_type VARCHAR(255),
    process_version VARCHAR(255),
    root_process_id VARCHAR(255),
    root_process_instance_id VARCHAR(255),
    variable_id VARCHAR(255),
    variable_name VARCHAR(255),
    variable_value CLOB(2M),
    event_user VARCHAR(255),
    CONSTRAINT process_instance_variable_log_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE process_instance_variable_log_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MAXVALUE
    NO MINVALUE
    CACHE 5;

CREATE TABLE task_instance_assignment_log (
    id BIGINT NOT NULL,
    business_key VARCHAR(255),
    event_date TIMESTAMP(6),
    event_id VARCHAR(255),
    event_user VARCHAR(255),
    process_instance_id VARCHAR(255),
    user_task_definition_id VARCHAR(255),
    user_task_instance_id VARCHAR(255),
    assignment_type VARCHAR(255),
    task_name VARCHAR(255),
    CONSTRAINT task_instance_assignment_log_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE task_instance_assignment_log_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MAXVALUE
    NO MINVALUE
    CACHE 5;

CREATE TABLE task_instance_assignment_users_log (
    task_instance_assignment_log_id BIGINT NOT NULL,
    user_id VARCHAR(255)
);

CREATE TABLE task_instance_attachment_log (
    id BIGINT NOT NULL,
    business_key VARCHAR(255),
    event_date TIMESTAMP(6),
    event_id VARCHAR(255),
    event_user VARCHAR(255),
    process_instance_id VARCHAR(255),
    user_task_definition_id VARCHAR(255),
    user_task_instance_id VARCHAR(255),
    attachment_id VARCHAR(255),
    attachment_name VARCHAR(255),
    attachment_uri VARCHAR(255),
    event_type INTEGER,
    CONSTRAINT task_instance_attachment_log_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE task_instance_attachment_log_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MAXVALUE
    NO MINVALUE
    CACHE 5;

CREATE TABLE task_instance_comment_log (
    id BIGINT NOT NULL,
    business_key VARCHAR(255),
    event_date TIMESTAMP(6),
    event_id VARCHAR(255),
    event_user VARCHAR(255),
    process_instance_id VARCHAR(255),
    user_task_definition_id VARCHAR(255),
    user_task_instance_id VARCHAR(255),
    comment_content VARCHAR(1000),
    comment_id VARCHAR(255),
    event_type INTEGER,
    CONSTRAINT task_instance_comment_log_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE task_instance_comment_log_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MAXVALUE
    NO MINVALUE
    CACHE 5;

CREATE TABLE task_instance_deadline_log (
    id BIGINT NOT NULL,
    business_key VARCHAR(255),
    event_date TIMESTAMP(6),
    event_id VARCHAR(255),
    event_user VARCHAR(255),
    process_instance_id VARCHAR(255),
    user_task_definition_id VARCHAR(255),
    user_task_instance_id VARCHAR(255),
    event_type VARCHAR(255),
    CONSTRAINT task_instance_deadline_log_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE task_instance_deadline_log_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MAXVALUE
    NO MINVALUE
    CACHE 5;

CREATE TABLE task_instance_deadline_notification_log (
    task_instance_deadline_log_id BIGINT NOT NULL,
    property_value VARCHAR(255),
    property_name VARCHAR(255) NOT NULL,
    CONSTRAINT task_instance_deadline_notification_log_pkey PRIMARY KEY (task_instance_deadline_log_id, property_name)
);

CREATE TABLE task_instance_state_log (
    id BIGINT NOT NULL,
    business_key VARCHAR(255),
    event_date TIMESTAMP(6),
    event_id VARCHAR(255),
    event_user VARCHAR(255),
    process_instance_id VARCHAR(255),
    user_task_definition_id VARCHAR(255),
    user_task_instance_id VARCHAR(255),
    actual_user VARCHAR(255),
    description VARCHAR(255),
    event_type VARCHAR(255),
    name VARCHAR(255),
    state VARCHAR(255),
    CONSTRAINT task_instance_state_log_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE task_instance_state_log_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MAXVALUE
    NO MINVALUE
    CACHE 5;

CREATE TABLE task_instance_variable_log (
    id BIGINT NOT NULL,
    business_key VARCHAR(255),
    event_date TIMESTAMP(6),
    event_id VARCHAR(255),
    event_user VARCHAR(255),
    process_instance_id VARCHAR(255),
    user_task_definition_id VARCHAR(255),
    user_task_instance_id VARCHAR(255),
    variable_id VARCHAR(255),
    variable_name VARCHAR(255),
    variable_type VARCHAR(255),
    variable_value CLOB(2M),
    CONSTRAINT task_instance_variable_log_variable_type_check CHECK (variable_type IN ('INPUT', 'OUTPUT')),
    CONSTRAINT task_instance_variable_log_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE task_instance_variable_log_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MAXVALUE
    NO MINVALUE
    CACHE 5;

CREATE INDEX ix_jel_jid ON job_execution_log (job_id);

CREATE INDEX ix_jel_pid ON job_execution_log (process_instance_id);

CREATE INDEX ix_jel_status ON job_execution_log (status);

CREATE INDEX ix_piel_event_date ON process_instance_error_log (event_date);

CREATE INDEX ix_piel_key ON process_instance_error_log (business_key);

CREATE INDEX ix_piel_pid ON process_instance_error_log (process_instance_id);

CREATE INDEX ix_pinl_event_date ON process_instance_node_log (event_date);

CREATE INDEX ix_pinl_key ON process_instance_node_log (business_key);

CREATE INDEX ix_pinl_pid ON process_instance_node_log (process_instance_id);

CREATE INDEX ix_pisl_event_date ON process_instance_state_log (event_date);

CREATE INDEX ix_pisl_key ON process_instance_state_log (business_key);

CREATE INDEX ix_pisl_pid ON process_instance_state_log (process_instance_id);

CREATE INDEX ix_pisl_state ON process_instance_state_log (state);

CREATE INDEX ix_pivl_event_date ON process_instance_variable_log (event_date);

CREATE INDEX ix_pivl_key ON process_instance_variable_log (business_key);

CREATE INDEX ix_pivl_pid ON process_instance_variable_log (process_instance_id);

CREATE INDEX ix_pivl_var_id ON process_instance_variable_log (variable_id);

CREATE INDEX ix_tavl_event_date ON task_instance_variable_log (event_date);

CREATE INDEX ix_tavl_key ON task_instance_variable_log (business_key);

CREATE INDEX ix_tavl_pid ON task_instance_variable_log (process_instance_id);

CREATE INDEX ix_tavl_utid ON task_instance_variable_log (user_task_instance_id);

CREATE INDEX ix_utasl_event_date ON task_instance_assignment_log (event_date);

CREATE INDEX ix_utasl_key ON task_instance_assignment_log (business_key);

CREATE INDEX ix_utasl_pid ON task_instance_assignment_log (process_instance_id);

CREATE INDEX ix_utasl_utid ON task_instance_assignment_log (user_task_instance_id);

CREATE INDEX ix_utatl_event_date ON task_instance_attachment_log (event_date);

CREATE INDEX ix_utatl_key ON task_instance_attachment_log (business_key);

CREATE INDEX ix_utatl_pid ON task_instance_attachment_log (process_instance_id);

CREATE INDEX ix_utatl_utid ON task_instance_attachment_log (user_task_instance_id);

CREATE INDEX ix_utcl_event_date ON task_instance_comment_log (event_date);

CREATE INDEX ix_utcl_key ON task_instance_comment_log (business_key);

CREATE INDEX ix_utcl_pid ON task_instance_comment_log (process_instance_id);

CREATE INDEX ix_utcl_utid ON task_instance_comment_log (user_task_instance_id);

CREATE INDEX ix_utdl_event_date ON task_instance_deadline_log (event_date);

CREATE INDEX ix_utdl_key ON task_instance_deadline_log (business_key);

CREATE INDEX ix_utdl_pid ON task_instance_deadline_log (process_instance_id);

CREATE INDEX ix_utdl_utid ON task_instance_deadline_log (user_task_instance_id);

CREATE INDEX ix_utsl_event_date ON task_instance_state_log (event_date);

CREATE INDEX ix_utsl_key ON task_instance_state_log (business_key);

CREATE INDEX ix_utsl_pid ON task_instance_state_log (process_instance_id);

CREATE INDEX ix_utsl_state ON task_instance_state_log (state);

CREATE INDEX ix_utsl_utid ON task_instance_state_log (user_task_instance_id);

CREATE INDEX idx_tiaul_tialid ON task_instance_assignment_users_log(task_instance_assignment_log_id);

CREATE INDEX idx_pisrl_pislid ON process_instance_state_roles_log(process_instance_state_log_id);

ALTER TABLE process_instance_state_roles_log
    ADD CONSTRAINT fk_process_instance_state_pid FOREIGN KEY (process_instance_state_log_id) REFERENCES process_instance_state_log(id) ON DELETE CASCADE;

ALTER TABLE task_instance_assignment_users_log
    ADD CONSTRAINT fk_task_instance_assignment_log_tid FOREIGN KEY (task_instance_assignment_log_id) REFERENCES task_instance_assignment_log(id) ON DELETE CASCADE;

ALTER TABLE task_instance_deadline_notification_log
    ADD CONSTRAINT fk_task_instance_deadline_tid FOREIGN KEY (task_instance_deadline_log_id) REFERENCES task_instance_deadline_log(id) ON DELETE CASCADE;
