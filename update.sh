#!/usr/bin/env bash
set -a

source ./env/.env

docker compose down
git pull
./start.sh
