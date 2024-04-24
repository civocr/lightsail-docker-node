#!/bin/bash
# Example of checking if a Docker container is running

container_name="my-container"

if docker ps --filter "status=running" --filter "name=$container_name" | grep "$container_name" > /dev/null
then
  echo "Service is running."
  exit 0
else
  echo "Service is not running."
  exit 1
fi
