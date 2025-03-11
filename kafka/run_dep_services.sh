#!/bin/bash


current_context=$(kubectl config current-context)

if [ "$current_context" != "DEV-IR" ]; then
    echo "Current context is not set to 'DEV-IR'. Exiting."
    exit 1
fi

echo "Current context is 'DEV-IR'. Proceeding with the script."

./scripts/portForwardService.sh dbp 1119
./scripts/portForwardService.sh metrics 1112
./scripts/portForwardService.sh rule-service 5599
./scripts/portForwardService.sh auth-fms 1113
./scripts/portForwardService.sh fms-ac 1114
./scripts/portForwardService.sh ims-notification 11000


