#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE itversity_sms_db;
    CREATE USER itversity_sms_user WITH ENCRYPTED PASSWORD 'itversity';
    GRANT ALL ON DATABASE itversity_sms_db TO itversity_sms_user;
EOSQL