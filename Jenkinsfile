#This is jenkins file.

pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = credentials('docker-hub-username')
        DOCKER_HUB_TOKEN = credentials('docker-hub-token')
        IMAGE_NAME = 'intuji-web-app'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    sh "echo \"$DOCKER_HUB_TOKEN\" | docker login --username \"$DOCKER_HUB_USERNAME\" --password-stdin"

                    // Tag and push Docker image
                    sh "docker tag $IMAGE_NAME:$IMAGE_TAG docker.io/$DOCKER_HUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
                    sh "docker push docker.io/$DOCKER_HUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // Optionally, clean up: Remove local Docker image
                    sh "docker rmi $IMAGE_NAME:$IMAGE_TAG"
                }
            }
        }
    }
}

