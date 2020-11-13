#!/bin/bash

# algorand-indexer need some args
# also needs genesis.json file

# docker network prefix
export COMPOSE_PROJECT_NAME=algo

# postgres db ocnfig
export PG_HOST="192.168.2.133"
export PG_PORT="5432"
export PG_USER="algorand"
export PG_PASSWD="indexer"
export PG_DB="pgdb"
export PG_HOST_VOLUME="/tmp/pgdata"

# 1. stop algorand-indexer process
pm2 stop algorand-indexer
pm2 delete algorand-indexer

# 2. start db
echo "stop postgres..."
docker-compose -f postgres.yaml down -v

echo "stop done"
