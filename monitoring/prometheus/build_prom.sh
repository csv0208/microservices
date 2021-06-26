#!/bin/bash

export USER_NAME=mrcsv # где username - ваш логин на Docker Hub
eval $(docker-machine env docker-host)
docker build -t $USER_NAME/prometheus .
