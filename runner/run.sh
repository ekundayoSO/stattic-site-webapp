#!/bin/bash

#====================SonarQube============================
# Navigate to the SonarQube directory
cd ../SonarQube 

# Build the SonarQube Docker image
docker build -t sonarqube:community .

# Wait for the SonarQube image to build
sleep 5 

# Start the SonarQube server
docker run -d -p 9000:9000 --name sonarqube-container sonarqube:community

# Wait for SonarQube to start
sleep 30

#====================Jenkins==============================

# Navigate to the Jenkins directory
cd ../Jenkins

# Build the Jenkins Docker image
docker build -t jenkins:lts .

# Wait for the Jenkins image to build
sleep 5

# Start the Jenkins server
docker run -d -p 9090:8080 --name jenkins-container jenkins:lts

# Wait for Jenkins to start
sleep 30

#====================Sample Web Application=================

# Build the sample web application
cd ../SampleWebApp
mvn clean package

# Build the Docker image
docker build -t samplewebapp ..

# Start the Docker container
docker run -d -p 8080:8080 --name samplewebapp-container samplewebapp

# Wait for the container to start
sleep 5

