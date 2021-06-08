#!/bin/bash

eval $(docker-machine env docker-host)
export USER_NAME=mrcsv

echo "# собираем image prometheus"

cd monitoring/prometheus
docker build -t $USER_NAME/prometheus .
cd -

echo "# собираем образы приложения"

for i in ui post-py comment
do
    cd src/$i
    bash docker_build.sh
    cd -
done

echo "# запускаем контейнеры"

cd docker
docker-compose up -d
cd -


