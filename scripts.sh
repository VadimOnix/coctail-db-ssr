#!/bin/bash

echo "build apollo server"
docker build \
  --tag apollo \
  --target apollo-server \
  --file ./.docker/prod.Dockerfile \
  .

echo "build web application"
docker build \
  --tag coctail-web-app \
  --target coctail-web-app \
  --file ./.docker/prod.Dockerfile \
  .

