#!/bin/bash

docker-compose -f docker-compose-build.yaml build

docker tag udagram-reverseproxy "${DOCKER_USERNAME}/udagram-reverseproxy:v1"
docker tag udagram-api-user "${DOCKER_USERNAME}/udagram-api-user:v1"
docker tag udagram-api-feed "${DOCKER_USERNAME}/udagram-api-feed:v1"
docker tag udagram-frontend:local "${DOCKER_USERNAME}/udagram-frontend:local"

echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

docker push "${DOCKER_USERNAME}/udagram-reverseproxy:v1" 
docker push "${DOCKER_USERNAME}/udagram-api-user:v1" 
docker push "${DOCKER_USERNAME}/udagram-api-feed:v1" 
docker push "${DOCKER_USERNAME}/udagram-frontend:local"
wait