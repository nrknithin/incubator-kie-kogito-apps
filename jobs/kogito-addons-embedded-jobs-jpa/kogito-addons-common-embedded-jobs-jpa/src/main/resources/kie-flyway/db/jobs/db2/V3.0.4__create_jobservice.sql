-- IBM Confidential
-- PID 5900-AR4
-- Copyright IBM Corp. 2026

CREATE TABLE job_details (
    id VARCHAR(50) NOT NULL,
    correlation_id VARCHAR(50),
    status VARCHAR(40), -- the job status: 'ERROR' or 'EXECUTED' or 'SCHEDULED' or 'RETRY' or 'CANCELED' or 'RUNNING'
    last_update TIMESTAMP,
    retries INTEGER,
    execution_counter INTEGER,
    scheduled_id VARCHAR(40),
    priority INTEGER,
    recipient CLOB(2M),
    trigger CLOB(2M),
    fire_time TIMESTAMP,
    execution_timeout BIGINT,
    execution_timeout_unit VARCHAR(40),
    created TIMESTAMP,
    exception_message VARCHAR(32672),
    exception_details CLOB(2M),
    CONSTRAINT job_details_pkey1 PRIMARY KEY (id)
);

CREATE TABLE job_service_management (
    id VARCHAR(40) NOT NULL,
    last_heartbeat TIMESTAMP,
    TOKEN VARCHAR(40) NOT NULL,
    CONSTRAINT job_service_management_pkey PRIMARY KEY (id),
    CONSTRAINT job_service_management_token_key UNIQUE (TOKEN)
);

CREATE INDEX job_details_created_idx ON job_details (created);

CREATE INDEX job_details_fire_time_idx ON job_details (fire_time);
