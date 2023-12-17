#!/bin/bash
#
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
sudo chkconfig docker on
