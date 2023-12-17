#!/bin/bash

# Input version
VERSION=$1

# Check if version is provided
if [ -z "$VERSION" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

# Update Terraform configuration with the new version
sed -i "s/^ *image *=.*/  image = \"your-docker-registry/your-image-name:$VERSION\"/" terraform/k8s/main.tf

# Commit changes to Git
git add terraform/k8s/main.tf
git commit -m "Update version to $VERSION"
git push origin main

# Create a new branch for the PR
BRANCH_NAME="update-version-$VERSION"
git checkout -b $BRANCH_NAME

# Push the branch to create a PR
git push origin $BRANCH_NAME

echo "Pull request created for version $VERSION. Please review and merge."
