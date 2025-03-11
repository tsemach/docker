#!/bin/bash

service docker status > /dev/null 2>&1

if [ $? -ne 0 ]; then
  echo -e "[$0] ${red}ERROR${nc} docker service is running!"
  echo -e "[$0] try: ${yellow}sudo service docker start${nc} then try running $0 again"

  exit 3
fi

docker compose down; docker compose up -d --remove-orphans
./run-kafka.sh

docker ps -a
