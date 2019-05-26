#!/bin/bash

cat ~/.ssh/id_rsa.pub > id_rsa.pub
docker build . -t my:alpine
docker-compose up -d --scale my_alpine=10
