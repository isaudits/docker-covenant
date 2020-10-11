#!/bin/bash

docker build -t covenant .
docker image prune -f