#!/bin/bash

# Start the SonarQube server
docker run -d -p 9000:9000 --name sonarqube-container sonarqube:community

# Wait for SonarQube to start
sleep 30

# Run SonarQube analysis
mvn sonar:sonar -f ../SampleWebApp/pom.xml -Dsonar.host.url=http://localhost:9000 -Dsonar.login=admin -Dsonar.password=admin   
