#!/bin/bash

#!/bin/bash

# Get the full path to the script
SCRIPT_PATH="$(realpath $0)"

# Print the script path
echo "This script is located at: $SCRIPT_PATH"

# Optionally, to just get the directory and not the script filename:
SCRIPT_DIR="$(dirname $SCRIPT_PATH)"
echo "This script's directory is: $SCRIPT_DIR"

# Name of the file you want to display, located in the same directory as the script
FILE_NAME="stop_docker.sh"

# Full path to the file
FULL_PATH="$SCRIPT_DIR/$FILE_NAME"

# Display the content of the file
#cat "$FULL_PATH"

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
