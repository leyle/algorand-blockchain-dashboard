#!/bin/bash

# algorand-indexer need some args
# also needs genesis.json file

. ./env.sh

# 1. stop algorand-indexer process
pm2 stop algorand-indexer
pm2 delete algorand-indexer

# 2. start db
echo "stop postgres..."
docker-compose -f postgres.yaml down

# 3. rm env.sh
if [ ! -z "$1" ]; then
    rm ./env.sh
fi

echo "stop done"
