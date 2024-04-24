#!/bin/bash

# Print environment variables
env

# Locate docker executable
which docker

# Print Docker version
docker --version

# Log in to Amazon ECR
echo "Logging in to Amazon ECR..."
echo "ECR: ${$ECR_REPOSITORY_URI}"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 533267141943.dkr.ecr.us-east-1.amazonaws.com
