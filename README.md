# NGINX Plus Core and Controller Workshop

Creates a couple docker containers with web servers listening on 4 ports to aid in API Gateway testing.

## Getting Started

After cloning this repo, run:
>sh start.sh

to create everything.

## Known Issues

This script assumes you don't have any conflicting ports or container names.

>Used ports: 81, 82, 8001, 8002

>docker container names: api1, api2,ergastf1api_web_1,ergastdb

Modify the docker-compose.yaml and agent-stack.yml to fit your needs.
