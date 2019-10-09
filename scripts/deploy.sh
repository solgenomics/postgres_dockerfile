#!/bin/bash

docker build -t breedbase/pg:$TRAVIS_BUILD_NUMBER .
docker tag breedbase/pg:$TRAVIS_BUILD_NUMBER breedbase/pg:latest
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USER" --password-stdin
docker push breedbase/pg:$TRAVIS_BUILD_NUMBER
docker push breedbase/pg:latest