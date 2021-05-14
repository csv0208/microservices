#!/bin/bash

export GOOGLE_PROJECT=docker-313417

docker-machine create --driver google \
        --google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts \
        --google-machine-type n1-standard-1 \
        --google-zone europe-west1-b \
        docker-host

# правило firewall для приложения
# gcloud compute firewall-rules create reddit-app \
# --allow tcp:9292 \
# --target-tags=docker-machine \
# --description="Allow PUMA connections" \
# --direction=INGRESS


#eval $(docker-machine env docker-host)

## работа с docker'ом:

# docker ps
# docker-machine ls

# docker run --rm -ti tehbilly/htop
# docker run --rm --pid host -ti tehbilly/htop

## после создания Dockerfile:
# docker build -t reddit:latest .
# docker images -a
# docker run --name reddit -d --network=host reddit:latest

## docker.hub
# mrcsv
# Gt..20

# docker login
# docker tag reddit:latest <your-login>/o-reddit:1.0
# docker push <your-login>/o-reddit:1.0
# docker run --name reddit -d -p 9292:9292 <your-login>/o-reddit:1.0
# docker logs reddit -f
# docker exec -it reddit bash
#   ps aux
#   killall5 1
# docker start reddit
# docker stop reddit && docker rm reddit
# docker run --name reddit --rm -it <your-login>/otus-reddit:1.0 bash
#   ps aux
#   exit


## с помощью следующих команд можно посмотреть подробную информацию об образе
# docker inspect <your-login>/otus-reddit:1.0
# docker inspect <your-login>/otus-reddit:1.0 -f '{{.ContainerConfig.Cmd}}'
# docker run --name reddit -d -p 9292:9292 <your-login>/otus-reddit:1.0
# docker exec -it reddit bash
#   mkdir /test1234
#   touch /test1234/testfile
#   rmdir /opt
#   exit
# docker diff reddit
# docker stop reddit && docker rm reddit
# docker run --name reddit --rm -it <your-login>/otus-reddit:1.0 bash
#   ls /
