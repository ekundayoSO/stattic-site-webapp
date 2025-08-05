#!/bin/bash

# Stop the container
docker stop samplewebapp-container

# Remove the container
docker rm samplewebapp-container

# Remove the Docker image
docker rmi samplewebapp