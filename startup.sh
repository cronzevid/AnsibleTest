#!/bin/bash

cat ~/.ssh/id_rsa.pub > id_rsa.pub || ssh-keygen -f `pwd`/id_rsa

docker build . -t ansilpine:latest

docker-compose up -d --scale my_alpine=10
