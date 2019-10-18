#!/bin/bash
echo "Removing old F1 API containers"
docker container rm -f workshop-f1-api workshop-db
echo "Starting F1 API containers"
docker-compose -f ergast-f1-api/docker-compose.yaml up -d

echo "Removing old workshop-api1 and api2 containers"
docker container rm -f workshop-api1 workshop-api2
echo "Starting API1 and API2"
docker run --restart unless-stopped --name workshop-api1 -d -p 81:80 -v $PWD/api1/:/app webdevops/php-nginx
docker run --restart unless-stopped --name workshop-api2 -d -p 82:80 -v $PWD/api2/:/app webdevops/php-nginx

echo " test out: curl localhost:81"
echo " and curl localhost:82"