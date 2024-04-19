#!/bin/bash

# Fetch all running container IDs
CONTAINER_IDS=$(docker ps -aq)

# Check if any containers are running
if [ -z "$CONTAINER_IDS" ]; then
  echo "No containers are currently running."
else
  echo "Stopping the following containers: $CONTAINER_IDS"
  docker stop $CONTAINER_IDS
  if [ $? -eq 0 ]; then
    echo "Containers stopped successfully."
  else
    echo "Failed to stop some or all containers."
  fi
fi
