#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE itversity_sms_db;
    CREATE USER itversity_sms_user WITH ENCRYPTED PASSWORD 'itversity';
    GRANT ALL ON DATABASE itversity_sms_db TO itversity_sms_user;
    GRANT pg_read_server_files TO itversity_sms_user;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE itversity_retail_db;
    CREATE USER itversity_retail_user WITH ENCRYPTED PASSWORD 'retail_password';
    GRANT ALL ON DATABASE itversity_retail_db TO itversity_retail_user;
    GRANT pg_read_server_files TO itversity_retail_user;
EOSQL