#!/bin/bash
echo "******CREATING CROWD & CROWDID DATABASE******"
gosu postgres psql --username postgres <<- EOSQL
  CREATE DATABASE crowd WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' \
    TEMPLATE template0;
  CREATE DATABASE crowdid WITH ENCODING 'UNICODE' LC_COLLATE 'C' \
    LC_CTYPE 'C' TEMPLATE template0;
  CREATE USER crowd;
  GRANT ALL PRIVILEGES ON DATABASE crowd to crowd;
  GRANT ALL PRIVILEGES ON DATABASE crowdid to crowd;
EOSQL
echo ""

{ echo; echo "host crowd crowd 0.0.0.0/0 trust"; } >> "$PGDATA"/pg_hba.conf
{ echo; echo "host crowdid crowd 0.0.0.0/0 trust"; } >> "$PGDATA"/pg_hba.conf

if [ -r '/tmp/dumps/crowd.dump' ]; then
    echo "**IMPORTING CROWD DATABASE BACKUP**"
    gosu postgres postgres &
    SERVER=$!; sleep 2
    gosu postgres psql crowd < /tmp/dumps/crowd.dump
    kill $SERVER; wait $SERVER
    echo "**CROWD DATABASE BACKUP IMPORTED***"
fi

if [ -r '/tmp/dumps/crowdid.dump' ]; then
    echo "**IMPORTING CROWDID DATABASE BACKUP**"
    gosu postgres postgres &
    SERVER=$!; sleep 2
    gosu postgres psql crowdid < /tmp/dumps/crowdid.dump
    kill $SERVER; wait $SERVER
    echo "**CROWDID DATABASE BACKUP IMPORTED***"
fi

echo "******CROWD & CROWDID DATABASE CREATED******"
