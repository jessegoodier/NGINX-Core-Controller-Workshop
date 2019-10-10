#!/bin/bash
docker-compose -f ergast-f1-api/docker-compose.yaml up -d
sh docker_start_time_servers.sh

