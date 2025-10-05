#!/usr/bin/env bash
set -a

source ./env/.env

docker compose stop && ./start.sh
