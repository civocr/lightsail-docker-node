#!/bin/bash

# Path to the imagedefinitions.json file
JSON_FILE="imagedefinitions.json"

# Extract the Docker image URI using jq
IMAGE_URI=$(jq -r '.[0].imageUri' $JSON_FILE)

if [[ -z "$IMAGE_URI" ]]; then
  echo "Error: Unable to find image URI in $JSON_FILE"
  exit 1
fi

echo "Pulling Docker image: $IMAGE_URI"

# Pull the latest Docker image
docker pull $IMAGE_URI

if [[ $? -ne 0 ]]; then
  echo "Error: Failed to pull Docker image"
  exit 1
fi

echo "Starting new Docker container with image: $IMAGE_URI"

# Start a new Docker container
docker run -d --name my-container \
  -p 80:3000 \
  $IMAGE_URI

if [[ $? -eq 0 ]]; then
  echo "Successfully started new Docker container."
else
  echo "Error: Failed to start new Docker container"
  exit 1
fi
