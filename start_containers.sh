#!/bin/bash
docker container rm -f workshop-f1-api workshop-db
docker-compose -f ergast-f1-api/docker-compose.yaml up -d
sh docker_start_time_servers.sh

docker container rm -f workshop-api1 workshop-api2
docker run --restart unless-stopped --name workshop-api1 -d -p 81:80 -v $PWD/api1/:/app webdevops/php-nginx
docker run --restart unless-stopped --name workshop-api2 -d -p 82:80 -v $PWD/api2/:/app webdevops/php-nginx