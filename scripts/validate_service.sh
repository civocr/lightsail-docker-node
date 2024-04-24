#!/bin/bash
# Example of a simple HTTP check
if curl -s http://localhost:3000/ | grep "Hello World! I am here" > /dev/null
then
  echo "Service is running."
  exit 0
else
  echo "Service is not running."
  exit 1
fi

