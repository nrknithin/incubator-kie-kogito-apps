-- IBM Confidential
-- PID 5900-AR4
-- Copyright IBM Corp. 2026

CREATE TABLE attachments (
    id VARCHAR(255) NOT NULL,
    content VARCHAR(255),
    name VARCHAR(255),
    updated_at TIMESTAMP,
    updated_by VARCHAR(255),
    task_id VARCHAR(255) NOT NULL,
    CONSTRAINT attachments_pkey PRIMARY KEY (id)
);

CREATE TABLE comments (
    id VARCHAR(255) NOT NULL,
    content VARCHAR(1000),
    updated_at TIMESTAMP,
    updated_by VARCHAR(255),
    task_id VARCHAR(255) NOT NULL,
    CONSTRAINT comments_pkey PRIMARY KEY (id)
);

CREATE TABLE definitions (
    id VARCHAR(255) NOT NULL,
    version VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    type VARCHAR(255),
    source BLOB(10M),
    endpoint VARCHAR(255),
    description VARCHAR(255),
    metadata CLOB(2M),
    CONSTRAINT definitions_pkey PRIMARY KEY (id, version)
);

CREATE TABLE definitions_addons (
    process_id VARCHAR(255) NOT NULL,
    process_version VARCHAR(255) NOT NULL,
    addon VARCHAR(255) NOT NULL,
    CONSTRAINT definitions_addons_pkey PRIMARY KEY (process_id, process_version, addon)
);

CREATE TABLE definitions_annotations (
    annotation VARCHAR(255) NOT NULL,
    process_id VARCHAR(255) NOT NULL,
    process_version VARCHAR(255) NOT NULL,
    CONSTRAINT definitions_annotations_pkey PRIMARY KEY (annotation, process_id, process_version)
);

CREATE TABLE definitions_nodes (
    id VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    unique_id VARCHAR(255),
    type VARCHAR(255),
    process_id VARCHAR(255) NOT NULL,
    process_version VARCHAR(255) NOT NULL,
    CONSTRAINT definitions_nodes_pkey PRIMARY KEY (id, process_id, process_version)
);

CREATE TABLE definitions_nodes_metadata (
    node_id VARCHAR(255) NOT NULL,
    process_id VARCHAR(255) NOT NULL,
    process_version VARCHAR(255) NOT NULL,
    meta_value VARCHAR(255),
    name VARCHAR(200) NOT NULL,
    CONSTRAINT definitions_nodes_metadata_pkey PRIMARY KEY (node_id, process_id, process_version, name)
);

CREATE TABLE definitions_roles (
    process_id VARCHAR(255) NOT NULL,
    process_version VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL,
    CONSTRAINT definitions_roles_pkey PRIMARY KEY (process_id, process_version, role)
);

CREATE TABLE jobs (
    id VARCHAR(255) NOT NULL,
    callback_endpoint VARCHAR(255),
    endpoint VARCHAR(255),
    execution_counter INTEGER,
    expiration_time TIMESTAMP,
    last_update TIMESTAMP,
    node_instance_id VARCHAR(255),
    priority INTEGER,
    process_id VARCHAR(255),
    process_instance_id VARCHAR(255),
    repeat_interval BIGINT,
    repeat_limit INTEGER,
    retries INTEGER,
    root_process_id VARCHAR(255),
    root_process_instance_id VARCHAR(255),
    scheduled_id VARCHAR(255),
    status VARCHAR(255),
    exception_message VARCHAR(32672),
    exception_details CLOB(2M),
    CONSTRAINT jobs_pkey PRIMARY KEY (id)
);

CREATE TABLE milestones (
    id VARCHAR(255) NOT NULL,
    process_instance_id VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    status VARCHAR(255),
    CONSTRAINT milestones_pkey PRIMARY KEY (id, process_instance_id)
);

CREATE TABLE nodes (
    id VARCHAR(255) NOT NULL,
    definition_id VARCHAR(255),
    enter TIMESTAMP,
    exit TIMESTAMP,
    name VARCHAR(255),
    node_id VARCHAR(255),
    type VARCHAR(255),
    process_instance_id VARCHAR(255) NOT NULL,
    sla_due_date TIMESTAMP,
    retrigger BOOLEAN DEFAULT FALSE,
    error_message VARCHAR(32672),
    cancel_type VARCHAR(255),
    input_args CLOB(2M),
    output_args CLOB(2M),
    CONSTRAINT nodes_pkey PRIMARY KEY (id)
);

CREATE TABLE processes (
    id VARCHAR(255) NOT NULL,
    business_key VARCHAR(255),
    end_time TIMESTAMP,
    endpoint VARCHAR(255),
    message VARCHAR(32672),
    node_definition_id VARCHAR(255),
    last_update_time TIMESTAMP,
    parent_process_instance_id VARCHAR(255),
    process_id VARCHAR(255),
    process_name VARCHAR(255),
    root_process_id VARCHAR(255),
    root_process_instance_id VARCHAR(255),
    start_time TIMESTAMP,
    state INTEGER,
    variables CLOB(2M),
    version VARCHAR(255),
    created_by VARCHAR(32672),
    updated_by VARCHAR(32672),
    sla_due_date TIMESTAMP,
    node_instance_id VARCHAR(255),
    cloud_event_id VARCHAR(1000),
    cloud_event_source VARCHAR(1000),
    CONSTRAINT processes_pkey PRIMARY KEY (id)
);

CREATE TABLE processes_addons (
    process_id VARCHAR(255) NOT NULL,
    addon VARCHAR(255) NOT NULL,
    CONSTRAINT processes_addons_pkey PRIMARY KEY (process_id, addon)
);

CREATE TABLE processes_roles (
    process_id VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL,
    CONSTRAINT processes_roles_pkey PRIMARY KEY (process_id, role)
);

CREATE TABLE tasks (
    id VARCHAR(255) NOT NULL,
    actual_owner VARCHAR(255),
    completed TIMESTAMP,
    description VARCHAR(255),
    endpoint VARCHAR(255),
    inputs CLOB(2M),
    last_update TIMESTAMP,
    name VARCHAR(255),
    outputs CLOB(2M),
    priority VARCHAR(255),
    process_id VARCHAR(255),
    process_instance_id VARCHAR(255),
    reference_name VARCHAR(255),
    root_process_id VARCHAR(255),
    root_process_instance_id VARCHAR(255),
    started TIMESTAMP,
    state VARCHAR(255),
    external_reference_id VARCHAR(4000),
    sla_due_date TIMESTAMP,
    user_task_id VARCHAR(255),
    CONSTRAINT tasks_pkey PRIMARY KEY (id)
);

CREATE TABLE tasks_admin_groups (
    task_id VARCHAR(255) NOT NULL,
    group_id VARCHAR(255) NOT NULL,
    CONSTRAINT tasks_admin_groups_pkey PRIMARY KEY (task_id, group_id)
);

CREATE TABLE tasks_admin_users (
    task_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    CONSTRAINT tasks_admin_users_pkey PRIMARY KEY (task_id, user_id)
);

CREATE TABLE tasks_excluded_users (
    task_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    CONSTRAINT tasks_excluded_users_pkey PRIMARY KEY (task_id, user_id)
);

CREATE TABLE tasks_potential_groups (
    task_id VARCHAR(255) NOT NULL,
    group_id VARCHAR(255) NOT NULL,
    CONSTRAINT tasks_potential_groups_pkey PRIMARY KEY (task_id, group_id)
);

CREATE TABLE tasks_potential_users (
    task_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    CONSTRAINT tasks_potential_users_pkey PRIMARY KEY (task_id, user_id)
);

CREATE INDEX idx_attachments_tid ON attachments (task_id);

CREATE INDEX idx_comments_tid ON comments (task_id);

CREATE INDEX idx_definitions_addons_pid_pv ON definitions_addons (process_id, process_version);

CREATE INDEX idx_definitions_annotations_pid_pv ON definitions_annotations (process_id, process_version);

CREATE INDEX idx_definitions_nodes_metadata_pid_pv ON definitions_nodes_metadata (process_id, process_version);

CREATE INDEX idx_definitions_nodes_pid_pv ON definitions_nodes (process_id, process_version);

CREATE INDEX idx_definitions_roles_pid_pv ON definitions_roles (process_id, process_version);

CREATE INDEX idx_jobs_piid ON jobs (process_instance_id);

CREATE INDEX idx_milestones_piid ON milestones (process_instance_id);

CREATE INDEX idx_nodes_piid ON nodes (process_instance_id);

CREATE INDEX idx_processes_addons_pid ON processes_addons (process_id);

CREATE INDEX idx_processes_roles_pid ON processes_roles (process_id);

CREATE INDEX idx_tasks_admin_groups_tid ON tasks_admin_groups (task_id);

CREATE INDEX idx_tasks_admin_users_tid ON tasks_admin_users (task_id);

CREATE INDEX idx_tasks_excluded_users_tid ON tasks_excluded_users (task_id);

CREATE INDEX idx_tasks_piid ON tasks (process_instance_id);

CREATE INDEX idx_tasks_potential_groups_tid ON tasks_potential_groups (task_id);

CREATE INDEX idx_tasks_potential_users_tid ON tasks_potential_users (task_id);

ALTER TABLE attachments
    ADD CONSTRAINT fk_attachments_tasks FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE;

ALTER TABLE comments
    ADD CONSTRAINT fk_comments_tasks FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE;

ALTER TABLE definitions_addons
    ADD CONSTRAINT fk_definitions_addons_definitions FOREIGN KEY (process_id, process_version) REFERENCES definitions(id, version) ON DELETE CASCADE;

ALTER TABLE definitions_annotations
    ADD CONSTRAINT fk_definitions_annotations FOREIGN KEY (process_id, process_version) REFERENCES definitions(id, version) ON DELETE CASCADE;

ALTER TABLE definitions_nodes
    ADD CONSTRAINT fk_definitions_nodes_definitions FOREIGN KEY (process_id, process_version) REFERENCES definitions(id, version) ON DELETE CASCADE;

ALTER TABLE definitions_nodes_metadata
    ADD CONSTRAINT fk_definitions_nodes_metadata_definitions_nodes FOREIGN KEY (node_id, process_id, process_version) REFERENCES definitions_nodes(id, process_id, process_version) ON DELETE CASCADE;

ALTER TABLE definitions_roles
    ADD CONSTRAINT fk_definitions_roles_definitions FOREIGN KEY (process_id, process_version) REFERENCES definitions(id, version) ON DELETE CASCADE;

ALTER TABLE milestones
    ADD CONSTRAINT fk_milestones_process FOREIGN KEY (process_instance_id) REFERENCES processes(id) ON DELETE CASCADE;

ALTER TABLE nodes
    ADD CONSTRAINT fk_nodes_process FOREIGN KEY (process_instance_id) REFERENCES processes(id) ON DELETE CASCADE;

ALTER TABLE processes_addons
    ADD CONSTRAINT fk_processes_addons_processes FOREIGN KEY (process_id) REFERENCES processes(id) ON DELETE CASCADE;

ALTER TABLE processes_roles
    ADD CONSTRAINT fk_processes_roles_processes FOREIGN KEY (process_id) REFERENCES processes(id) ON DELETE CASCADE;

ALTER TABLE tasks_admin_groups
    ADD CONSTRAINT fk_tasks_admin_groups_tasks FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE;

ALTER TABLE tasks_admin_users
    ADD CONSTRAINT fk_tasks_admin_users_tasks FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE;

ALTER TABLE tasks_excluded_users
    ADD CONSTRAINT fk_tasks_excluded_users_tasks FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE;

ALTER TABLE tasks_potential_groups
    ADD CONSTRAINT fk_tasks_potential_groups_tasks FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE;

ALTER TABLE tasks_potential_users
    ADD CONSTRAINT fk_tasks_potential_users_tasks FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE;
