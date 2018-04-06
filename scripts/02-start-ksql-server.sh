#!/bin/bash

docker exec russianhackersstreams_ksql-cli_1 ksql-server-start /tmp/ksql.properties >/tmp/ksql.log 2>&1 &
sleep 10
docker-compose exec ksql-cli ksql-cli remote http://localhost:9098 --exec "run script '/tmp/ksqlcommands';"

