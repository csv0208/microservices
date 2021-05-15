# Micorservices

#16:
docker-machine ls
eval $(docker-machine env docker-host)

cd src/
docker build -t mrcsv/post:1.0 ./post-py
docker build -t mrcsv/comment:1.0 ./comment
docker build -t mrcsv/ui:1.0 ./ui

docker network create reddit
docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db mongo:latest
docker run -d --network=reddit --network-alias=post mrcsv/post:1.0
docker run -d --network=reddit --network-alias=comment mrcsv/comment:1.0
docker run -d --network=reddit -p 9292:9292 mrcsv/ui:1.0

docker run -d --network=reddit --network-alias=post_db_1 --network-alias=comment_db_1 --env-file ENV mongo:latest
docker run -d --network=reddit --network-alias=post_1 --env-file ENV mrcsv/post:1.0
docker run -d --network=reddit --network-alias=comment_1 --env-file ENV mrcsv/comment:1.0
docker run -d --network=reddit -p 9292:9292 --env-file ENV mrcsv/ui:1.0

docker volume create reddit_db
docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest
docker run -d --network=reddit --network-alias=post_db_1 --network-alias=comment_db_1 --env-file ENV -v reddit_db:/data/db mongo:latest
