#!/bin/bash
# Start Docker containers
docker start $(docker ps -aq)
# Or using Docker Compose
# docker-compose -f /path/to/your/docker-compose.yml up -d

