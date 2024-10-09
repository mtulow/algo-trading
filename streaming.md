# Streaming

## Apache Kafka

### 1. Download the code
  Download the latest Kafka release and extract it:
  ```sh
  wget https://dlcdn.apache.org/kafka/3.8.0/kafka_2.13-3.8.0.tgz
  tar -xzf kafka_2.13-3.8.0.tgz
  cd kafka_2.13-3.8.0
  ```
### 2. Start the server
  #### Kafka with ZooKeeper
  Run the following commands in order to start all services in the correct order:
  ```sh
  # Start the ZooKeeper service
  $ bin/zookeeper-server-start.sh config/zookeeper.properties
  ```
  Open another terminal session and run:
  ```sh
  # Start the Kafka broker service
  $ bin/kafka-server-start.sh config/server.properties
  ```
  Once all services have successfully launched, you will have a basic Kafka environment running and ready to use.

#### Using JVM Based Apache Kafka Docker Image
Get the Docker image:
```sh
$ docker pull apache/kafka:3.8.0
```

Start the Kafka Docker container:
```sh
$ docker run -p 9092:9092 apache/kafka:3.8.0
```

#### Using GraalVM Based Native Apache Kafka Docker Image
Get the Docker image:
```sh
$ docker pull apache/kafka-native:3.8.0
```

Start the Kafka Docker container:
```sh
$ docker run -p 9092:9092 apache/kafka-native:3.8.0
```
Once the Kafka server has successfully launched, you will have a basic Kafka environment running and ready to use.

### 3. Create a topic

### 4. Send some messages

### 5. Start a consumer

### 6. Setting up a multi-broker cluster

---
---
---
