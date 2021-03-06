docker network create dev_node_sample_net

docker build -t dev_node_sample_db -f Dockerfile.db .

docker rm -f  $(docker ps -a | grep "dev_node_sample_db_container" | awk "{print \$1}")

docker run -itd --name dev_node_sample_db_container -p 5432:5432 --restart unless-stopped --network dev_node_sample_net dev_node_sample_db

docker rmi -f $(docker images | grep "<none" | awk "{print \$3}")