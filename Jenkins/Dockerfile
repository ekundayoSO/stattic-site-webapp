# Use the official Jenkins image as the base image
FROM jenkins/jenkins:lts-jdk17

USER root

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 9090
