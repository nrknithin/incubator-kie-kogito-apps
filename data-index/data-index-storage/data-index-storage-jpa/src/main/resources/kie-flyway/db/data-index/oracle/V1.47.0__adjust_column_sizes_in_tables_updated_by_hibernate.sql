/*
    The changes introduced in `V1.47.0__adjust_column_sizes_in_tables_updated_by_hibernate.sql` are intended to
    fix a problem introduced in the upstream project, when hibernate was regenerating the In-Memory Data Index database schema
    changing some table columns sizes to the hibernate defaults.

    This migration has been added just to keep the version consistency between the migrations for all databases.
*/