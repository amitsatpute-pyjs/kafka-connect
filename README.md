## **Kafka-connect**
Start kafka cluster  using 

    docker-compose up kafka-cluster
Access UI on following link:


    http://127.0.0.1:3030
### Examples:

**demo1**

1. Run docker
 ```bash
docker run --rm -it -v "$(pwd)":/tutorial --net=host landoop/fast-data-dev bash
```
2. Create topic
```bash
kafka-topics --create --topic demo-1-standalone --bootstrap-server 127.0.0.1:9092 --partitions 3 --replication-factor 1
```
3.  Run kafka-connect with standalone
```bash
connect-standalone worker.properties file-stream-demo-standalone.properties
```
4. Check output on UI -> Topics


**demo2**
1. Run docker
```bash
docker run --rm -it --net=host landoop/fast-data-dev bash
```
2. Create topic
```bash
kafka-topics --create --topic demo-2-distributed --bootstrap-server 127.0.0.1:9092 --partitions 3 --replication-factor 1
```
3. Create connector:
	**a.** Open UI and enter in  **connectors** tab.
	**b.** Click on new and select **File**.
	**c.** Add properties which is mentioned in source/demo2/file-stream-demo-distributed.properties
	**d.** Click on create.
	***Note:** remove commented lines in .properties file before adding in connectors*

4. Follow following steps
```bash
docker ps
docker exec -it <containerId> bash
touch demo-file.txt
echo "hi" >> demo-file.txt
```
5. Check output on UI -> Topics


## **Postgres**

**Method-1:**
 1. Create connector:
	**a.** Open UI and enter in  **connectors** tab.
	**b.** Click on new and select **Jdbc**.
	**c.** Add properties which is mentioned in source/psql/source.properties
	**d.** Click on create
	***Note:** remove commented lines in .properties file before adding in connectors*

2. Insert value in table and check it on UI > Topics tab.

**Method-2:**
  1. Run docker
 ```bash
 docker run --rm -it -v "$(pwd)":/tutorial --net=host landoop/fast-data-dev bash
```
  2. Go to file location
```bash
cd tutorial/source/psql
```
  3. Run following command:
 ```bash
 connect-distributed source.properties
```
  4. Insert values in tables and check it on UI > Topics
