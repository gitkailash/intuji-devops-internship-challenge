#Intuji DevOps Project Documentaion

# AWS EC2 Instance Setup and GitHub Repository Creation

# Step 1: AWS EC2 Instance
# An AWS Linux instance is created.

# Step 2: GitHub Repository Setup
# Created a GitHub repository named "intuji-devops-internship-challenge."
# Visit: https://github.com/silarhi/php-hello-world.git

# Step 3: Git Installation
sudo yum install git -y
sudo yum update -y

# Step 4: Clone GitHub Repository
git clone https://github.com/silarhi/php-hello-world.git

# Step 5: Solved the Readme Problem
# Install required packages and edit necessary files.
# Test the file using the command: php Hello.php
# Provide output screenshots.

# Docker Installation and Configuration

# Step 6: Install Docker on AWS EC2 Instance

# Update package list
sudo yum update -y

# Install Docker and git dependencies
sudo yum install -y \
    docker \
    git

# Start Docker service
sudo service docker start

# Add ec2-user to the docker group
sudo usermod -a -G docker ec2-user

# Automatically start Docker on boot
sudo chkconfig docker on"

#Execution > ./install-docker.sh

# Step 7: Create Dockerfile
cd php-hello-world
echo "FROM httpd:latest" > Dockerfile
echo "COPY . /usr/local/apache2/htdocs/" >> Dockerfile

# Step 8: Build Docker Image Locally
docker build -t intuji-app:latest .

# Step 9: Docker Hub Image Push
docker login -u kailash05
docker tag intuji-app:latest kailash05/intuji-app:latest
docker push kailash05/intuji-app:latest

# Step 10: Create Docker Compose File ("docker-compose.yml")
version: '3'
services:
  web:
    image: kailash05/intuji-app:latest
    ports:
      - '80:80'

# Step 11: Start Docker Compose
docker-compose up -d

# Step 12: Jenkins Installation and Configuration
sudo yum update -y
sudo yum install java-1.8.0-openjdk -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins -y
sudo systemctl start jenkins

# Step 13: Access Jenkins(By enabling port 8080 Security Inbound rules)
# http://ec2-public-ip:8080/

# Step 14: Jenkins Configuration
# 1. Install required plugins.
# 2. Create a Freestyle Project.
# 3. Add the GitHub URL.

# Step 15: Jenkins Build Configuration
# Add the following commands to the Execute Shell build step
-----------------------------------------------------------
# Define Docker Hub credentials
DOCKER_USERNAME=kailash05
DOCKER_TOKEN=dckr_p*t_k***faO-X0m70LC*****NPdy5U

# Define Docker image name and tag
IMAGE_NAME=intuji-web-app
IMAGE_TAG=latest

# Log in to Docker Hub using the PAT
echo \"\$DOCKER_TOKEN\" | docker login --username \"\$DOCKER_USERNAME\" --password-stdin

# Build the Docker image
docker build -t \"\$IMAGE_NAME:\$IMAGE_TAG\" .

# Tag the Docker image with the repository URL
docker tag \"\$IMAGE_NAME:\$IMAGE_TAG\" \"docker.io/\$DOCKER_USERNAME/\$IMAGE_NAME:\$IMAGE_TAG\"

# Push the Docker image to Docker Hub
docker push \"docker.io/\$DOCKER_USERNAME/\$IMAGE_NAME:\$IMAGE_TAG\"

# Optionally, clean up: Remove local Docker image
docker rmi \"\$IMAGE_NAME:\$IMAGE_TAG\"
-----------------------------------------------------------------

# Step 16: GitHub Webhook Configuration
# Configure a GitHub Webhook for "GitHub hook trigger for GITScm polling" with the payload URL: jenkins-url/github-webhook/ and content type: application/json.

# Step 17: Testing
# Tested the entire setup multiple times to ensure successful execution.

--------------------------------------------------------------------------------------------------

# php-hello-world
A simple hello-world for composer

 [![Latest Stable Version](https://github.com/silarhi/php-hello-world/workflows/Tests/badge.svg)](https://github.com/silarhi/php-hello-world/workflows/Tests/badge.svg)
 [![Latest Stable Version](https://poser.pugx.org/silarhi/hello-world/v/stable)](https://packagist.org/packages/silarhi/hello-world)
[![Total Downloads](https://poser.pugx.org/silarhi/hello-world/downloads)](https://packagist.org/packages/silarhi/hello-world)
[![License](https://poser.pugx.org/silarhi/hello-world/license)](https://packagist.org/packages/silarhi/hello-world)


[![SymfonyInsight](https://insight.symfony.com/projects/5d582202-1186-4ce7-82c7-c4d3a2c11807/big.svg)](https://insight.symfony.com/projects/5d582202-1186-4ce7-82c7-c4d3a2c11807)

Installation
------------

Install with composer
``` bash
composer require silarhi/hello-world
```

Run composer update
``` bash
composer update silarhi/hello-world
```

Usage
-----

``` php
require_once __DIR__ . '/vendor/autoload.php';

use Silarhi\Hello;

$hello = new Hello();
echo $hello->display() . "\n";
```
