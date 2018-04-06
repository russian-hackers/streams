#!/bin/bash

# doesn't work Confluent CLI isn't available in images
# https://github.com/confluentinc/cp-docker-images/issues/307
# docker-compose exec connect confluent load twitter_source -d /connect-plugins/connect_twitter.json

# init connector
curl -s -X POST -H 'Content-Type: application/json' --data @connect_bintray.json http://localhost:8083/connectors