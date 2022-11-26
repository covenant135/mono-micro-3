#!/bin/bash

docker-compose -f docker-compose-build.yaml build

docker tag udagram-reverseproxy "${DOCKER_USERNAME}/udagram-reverseproxy:"
docker tag udagram-api-user "${DOCKER_USERNAME}/udagram-api-user"
docker tag udagram-api-feed "${DOCKER_USERNAME}/udagram-api-feed:"
docker tag udagram-frontend:local "${DOCKER_USERNAME}/udagram-frontend:local"

echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

docker push "${DOCKER_USERNAME}/udagram-reverseproxy" 
docker push "${DOCKER_USERNAME}/udagram-api-user" 
docker push "${DOCKER_USERNAME}/udagram-api-feed" 
docker push "${DOCKER_USERNAME}/udagram-frontend:local"
wait