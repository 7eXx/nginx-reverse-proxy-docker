#!/bin/sh

[ -f .env ] && . .env

docker build . \
    --build-arg SERVER_NAME_1=${SERVER_NAME_1} \
    --build-arg DESTINATION_1=${DESTINATION_1} \
    --build-arg SERVER_NAME_2=${SERVER_NAME_2} \
    --build-arg DESTINATION_2=${DESTINATION_2} \
    --tag ${IMAGE_TAG} \
    --file Dockerfile \