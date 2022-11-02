#!/usr/bin/env bash

REGISTRY="praqmasofus"
FRONTEND_REPOSITORY="flask-quotes-frontend"
BACKEND_REPOSITORY="flask-quotes-backend"

GIT_TAG=$(git rev-parse HEAD)
TAG="release"

FRONTEND_IMAGE="$REGISTRY/$FRONTEND_REPOSITORY:$GIT_TAG"
BACKEND_IMAGE="$REGISTRY/$BACKEND_REPOSITORY:$GIT_TAG"

echo "Building images ..."

docker build -t $FRONTEND_IMAGE app/frontend
docker build -t $BACKEND_IMAGE app/backend
