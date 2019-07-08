#!/bin/bash
echo "******CREATING CONFLUENCE DATABASE******"
PGPASSWORD=postgres psql -h ${DB_HOST} -p 5432 --username postgres <<- EOSQL
   CREATE USER confluence WITH PASSWORD 'confluence';
   CREATE DATABASE confluence WITH ENCODING 'UTF8' LC_COLLATE 'en_US.UTF-8' LC_CTYPE 'en_US.UTF-8' \
       TEMPLATE template0;
   GRANT ALL PRIVILEGES ON DATABASE confluence to confluence;
EOSQL
echo "******CONFLUENCE DATABASE CREATED******"
if [ -r '/data.sql' ]; then
    echo "**IMPORTING CONFLUENCE DATABASE BACKUP**"
    SERVER=$!; sleep 2
    PGPASSWORD=postgres psql -h ${DB_HOST} -p 5432 --username postgres confluence < /data.sql
    kill $SERVER; wait $SERVER
    echo "**Confluence DATABASE BACKUP IMPORTED***"
fi
