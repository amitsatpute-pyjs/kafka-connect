#!/bin/bash

docker-compose up -d kafka-cluster

TOPIC='logs_broker'

TOPICLIST=''
count=1
# Timeout limit 3 mins
while [ $count -le 18 ]
do
  if [[ "$TOPICLIST" == *"$TOPIC"* ]]; then
    echo "Kafka-Connect is online. Creating source and sink connectors."
    cd source/msql/
    curl -d "@source.json" -H "Content-Type: application/json" -X POST http://localhost:8083/connectors
    cd ../../sink/msql/
    curl -d "@micro-products-gcp-sink.json" -H "Content-Type: application/json" -X POST http://localhost:8083/connectors
    curl -d "@micro-orders-gcp-sink.json" -H "Content-Type: application/json" -X POST http://localhost:8083/connectors
    exit 0
else
    sleep 10s
    TOPICLIST=$(curl -X GET http://127.0.0.1:3030/api/kafka-rest-proxy/topics)
fi
count=$(( $count + 1 ))
done
echo "Timeout.."
exit 124

