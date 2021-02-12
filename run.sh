#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
    CREATE USER web_usr;
    ALTER USER web_usr WITH PASSWORD 'postgres';
    ALTER ROLE web_usr WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
    CREATE DATABASE breedbase;
    GRANT ALL PRIVILEGES ON DATABASE breedbase TO web_usr;
EOSQL

psql -U postgres -d breedbase -f empty_fixture.sql
