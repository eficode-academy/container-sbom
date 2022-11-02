#!/usr/bin/env bash

REGISTRY="praqmasofus"
FRONTEND_REPOSITORY="flask-quotes-frontend"
BACKEND_REPOSITORY="flask-quotes-backend"

GIT_TAG=$(git rev-parse HEAD)
TAG="release"

FRONTEND_IMAGE="$REGISTRY/$FRONTEND_REPOSITORY:$GIT_TAG"
BACKEND_IMAGE="$REGISTRY/$BACKEND_REPOSITORY:$GIT_TAG"

echo "Scanning images ..."

docker run -v /var/run/docker.sock:/var/run/docker.sock -v aquacache:/root/.cache aquasec/trivy image $FRONTEND_IMAGE
docker run -v /var/run/docker.sock:/var/run/docker.sock -v aquacache:/root/.cache aquasec/trivy image $BACKEND_IMAGE
