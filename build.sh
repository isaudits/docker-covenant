#!/bin/bash

docker build -t isaudits/covenant .
docker image prune -f