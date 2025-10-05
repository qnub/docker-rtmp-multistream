#!/usr/bin/env bash
docker compose rm -v --stop --force

set -e
set -a

source ./env/.env

docker compose build
docker compose up -d
