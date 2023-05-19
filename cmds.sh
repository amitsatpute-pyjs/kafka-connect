# demo1
docker-compose up kafka-cluster
docker run --rm -it -v "$(pwd)":/tutorial --net=host landoop/fast-data-dev bash
kafka-topics --create --topic demo-1-standalone --bootstrap-server 127.0.0.1:9092 --partitions 3 --replication-factor 1
connect-standalone worker.properties file-stream-demo-standalone.properties

# demo2
docker run --rm -it --net=host landoop/fast-data-dev bash
kafka-topics --create --topic demo-2-distributed --bootstrap-server 127.0.0.1:9092 --partitions 3 --replication-factor 1
docker ps
docker exec -it <containerId> bash
touch demo-file.txt
echo "hi" >> demo-file.txt




