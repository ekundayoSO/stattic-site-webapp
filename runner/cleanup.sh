#!/bin/bash

# Stop the container
docker stop samplewebapp-container
docker stop sonarqube-container
docker stop jenkins-container

# Remove the container
docker rm samplewebapp-container
docker rm sonarqube-container
docker rm jenkins-container

# Remove the Docker image
docker rmi samplewebapp
docker rmi sonarqube:community
docker rmi jenkins:lts