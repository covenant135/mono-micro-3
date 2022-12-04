#!/bin/bash

echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

docker-compose -f docker-compose-build.yaml build

docker tag udagram-reverseproxy "covenantson/udareverseproxy:v2.1"
docker tag udagram-api-user "covenantson/udaapi-user:v2.5"
docker tag udagram-api-feed "covenantson/udaapi-feed:v2.5"
docker tag udagram-frontend "covenantson/udafrontend:local"


docker push "covenantson/udareverseproxy:v2.1" &
docker push "covenantson/udaapi-user:v2.5" &
docker push "covenantson/udaapi-feed:v2.5" &
docker push "covenantson/udafrontend:local" &
wait