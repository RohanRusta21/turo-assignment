#!/bin/bash

# Define variables
DOCKER_USERNAME="tota6969"
DOCKER_TOKEN_VAR="DOCKERHUB_TOKEN"  # Environment variable for Docker Hub token
IMAGE_NAME="webapp"
VERSION="v1.0.0"

# Check if the token is set
if [ -z "$DOCKERHUB_TOKEN" ]; then
    echo "Error: Docker Hub token is not set. Please set the $DOCKER_TOKEN_VAR environment variable."
    exit 1
fi

# Log in to Docker Hub
echo "$DOCKERHUB_TOKEN" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Step 1: Build Docker image
docker build -t $IMAGE_NAME:$VERSION .

# Step 2: Tag the image for the registry
docker tag $IMAGE_NAME:$VERSION $DOCKER_USERNAME/$IMAGE_NAME:$VERSION

# Step 3: Push the image to the registry
docker push $DOCKER_USERNAME/$IMAGE_NAME:$VERSION

# Output the version for later use
echo "Docker image $DOCKER_USERNAME/$IMAGE_NAME:$VERSION has been built and published."
