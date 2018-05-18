#!/bin/bash

docker exec russian-hackers-streams_ksql-cli_1 ksql-server-start /tmp/ksql.properties >/tmp/ksql.log 2>&1 &
sleep 10
docker exec russian-hackers-streams_ksql-cli_1 bash -c "ksql http://localhost:9098 <<EOF
run script '/tmp/ksqlcommands';
exit ;
EOF
"
