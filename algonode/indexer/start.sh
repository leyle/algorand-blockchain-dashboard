#!/bin/bash

# algorand-indexer need some args
# also needs genesis.json file

# we need docker-compose and pm2 to start this application
# check docker-compose cli exist
if [ -z `which docker-compose` ]; then
    echo "No docker-compose cli"
    exit 1
fi

# check pm2 cli exist
if [ -z `which pm2` ]; then
    echo "No pm2 cli"
    exit 1
fi

# check if env.sh exist
if [ ! -f "./env.sh" ]; then
    echo "No env.sh, copy envexample.sh env.sh"
    exit 1
fi

. ./env.sh

# check if algorand-indexer binary file exist
if [ -z `which algorand-indexer` ]; then
    echo "No algorand-indexer in PATH"
    exit 1
fi


# 1. start db
echo "start postgres..."
docker-compose -f postgres.yaml up -d
sleep 20
echo "start postgres done"

# start foreground
# ./algorand-indexer daemon -P "$PARG" --algod-net $ALGONET --algod-token $ALGOTOKEN --genesis $GENESIS
PARG="host=$PG_HOST port=$PG_PORT user=$PG_USER password=$PG_PASSWD dbname=$PG_DB sslmode=disable"
set -x
pm2 start algorand-indexer -- daemon -S $INDEXER_ADDR -P "$PARG" --algod-net $ALGONET --algod-token $ALGOTOKEN --genesis $GENESIS
