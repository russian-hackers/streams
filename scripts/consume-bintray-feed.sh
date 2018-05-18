#!/bin/bash

docker exec russian-hackers-streams_connect_1 kafka-console-consumer --bootstrap-server kafka1:9091 --consumer.config=/usr/share/consumer.properties --from-beginning --topic bintray | jq '.payload'
