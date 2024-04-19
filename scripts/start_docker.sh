#!/bin/bash
SCRIPT_PATH="$(realpath $0)"

# Print the script path
echo "This script is located at: $SCRIPT_PATH"
# Log in to Amazon ECR
echo "Logging in to Amazon ECR..."
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 533267141943.dkr.ecr.us-east-1.amazonaws.com

# Optionally, to just get the directory and not the script filename:
SCRIPT_DIR="$(dirname $SCRIPT_PATH)"

# Path to the imagedefinitions.json file
JSON_FILE="$SCRIPT_DIR/../imagedefinitions.json"

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

echo "Removing existing Docker container"
docker rm my-container || true

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
