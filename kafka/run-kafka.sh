#!/bin/bash

KAFKA_INTERFACE=ens160

INTERFACE=${KAFKA_INTERFACE:-ens160}
echo $INTERFACE

export MY_IP=$(ifconfig | grep -C 2 $INTERFACE  | grep 10.200 | awk '{print $2}')
echo "found MY_IP=$MY_IP"

docker compose -f docker-compose-kafka-remote.yaml up -d 
