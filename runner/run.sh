#!/bin/bash

# Build maven project
mvn clean package -f ../SampleWebApp/pom.xml

# Build the Docker image
docker build -t samplewebapp ..

# Start the Docker container
docker run -d -p 8080:8080 --name samplewebapp-container samplewebapp

# Wait for the container to start
sleep 5
