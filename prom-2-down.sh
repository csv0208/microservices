#!/bin/bash

export GOOGLE_PROJECT=docker-313417

# Настроить докер клиент на удаленный докер демон
eval $(docker-machine env docker-host)
export USER_NAME=mrcsv

# запускаем приложения
docker-compose -f docker/docker-compose.yml down

# запускаем мониторинг
docker-compose -f docker/docker-compose-monitoring.yml down
