#!/bin/bash

# Define Docker Hub credentials
 DOCKER_USERNAME=kailash05
 DOCKER_TOKEN=dckr_p*t_k***faO-X0m70LC*****NPdy5U

# Define Docker image name and tag
 IMAGE_NAME=intuji-web-app
 IMAGE_TAG=latest

 # Log in to Docker Hub using the PAT
 echo "$DOCKER_TOKEN" | docker login --username "$DOCKER_USERNAME" --password-stdin
 
 # Build the Docker image
 docker build -t "$IMAGE_NAME:$IMAGE_TAG" .
 
 # Tag the Docker image with the repository URL
 docker tag "$IMAGE_NAME:$IMAGE_TAG" "docker.io/$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
 
 # Push the Docker image to Docker Hub
 docker push "docker.io/$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
 
 # Optionally, clean up: Remove local Docker image
 docker rmi "$IMAGE_NAME:$IMAGE_TAG"
