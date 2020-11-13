#!/bin/bash

# example of env.sh
# copy this file to env.sh

# docker network prefix
export COMPOSE_PROJECT_NAME=algo
export PG_IMAGE_TAG=latest
export PG_CONTAINER_NAME=algo_indexer_postgres

# postgres db config
export PG_HOST="192.168.2.133"
export PG_PORT="5432"
export PG_USER="algorand"
export PG_PASSWD="indexer"
export PG_DB="pgdb"
export PG_HOST_VOLUME="~/.algoindexer/pgdata"

# algo node config
export ALGONET="http://192.168.2.31:8080"
export ALGOTOKEN="65a03e7551a31d94ec0439a008eaa86f8d7f41fd75a2f6a8de588d963cc6f530"

# genesis.json path
export GENESIS=./genesis.json

# algorand-indexer cli path
INDEXERBINPATH=./
export PATH="$INDEXERBINPATH:$PATH"

export INDEXER_ADDR="0.0.0.0:8980"
