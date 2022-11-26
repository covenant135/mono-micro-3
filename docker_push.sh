#!/bin/bash

echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

docker-compose -f docker-compose-build.yaml build

docker tag udagram-reverseproxy:v1 "covenantson/udagram-reverseproxy"
docker tag udagram-api-user:v1 "covenantson/udagram-api-user"
docker tag udagram-api-feed:v1 "covenantson/udagram-api-feed"
docker tag udagram-frontend:local "covenantson/udagram-frontend:local"


docker push "${DOCKER_USERNAME}/udagram-reverseproxy" &
docker push "${DOCKER_USERNAME}/udagram-api-user" &
docker push "${DOCKER_USERNAME}/udagram-api-feed" &
docker push "${DOCKER_USERNAME}/udagram-frontend:local" &
wait