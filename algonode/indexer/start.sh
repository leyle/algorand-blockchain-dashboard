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
export PG_HOST_VOLUME="~/.algoindexer/pgdata"

export PARG="host=$PG_HOST port=$PG_PORT user=$PG_USER password=$PG_PASSWD dbname=$PG_DB sslmode=disable"

# algo node config
export ALGONET="http://192.168.2.31:8080"
export ALGOTOKEN="65a03e7551a31d94ec0439a008eaa86f8d7f41fd75a2f6a8de588d963cc6f530"

# genesis.json path
export GENESIS=./genesis.json

# 1. start db
echo "start postgres..."
docker-compose -f postgres.yaml up -d
sleep 20
echo "start postgres done"

# start foreground
# ./algorand-indexer daemon -P "$PARG" --algod-net $ALGONET --algod-token $ALGOTOKEN --genesis $GENESIS

set -x
pm2 start algorand-indexer -- daemon -P "$PARG" --algod-net $ALGONET --algod-token $ALGOTOKEN --genesis $GENESIS

