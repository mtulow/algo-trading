# Streaming
[source](https://kafka.apache.org/quickstart)

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
Kafka is a distributed event streaming platform that lets you read, write, store, and process events (also called records or messages in the documentation) across many machines.

Example events are payment transactions, geolocation updates from mobile phones, shipping orders, sensor measurements from IoT devices or medical equipment, and much more. These events are organized and stored in topics. Very simplified, a topic is similar to a folder in a filesystem, and the events are the files in that folder.

So before you can write your first events, you must create a topic. Open another terminal session and run:
```sh
$ bin/kafka-topics.sh --create --topic quickstart-events --bootstrap-server localhost:9092
```
All of Kafka's command line tools have additional options: run the kafka-topics.sh command without any arguments to display usage information. For example, it can also show you details such as the partition count of the new topic:
```sh
$ bin/kafka-topics.sh --describe --topic quickstart-events --bootstrap-server localhost:9092
Topic: quickstart-events        TopicId: NPmZHyhbR9y00wMglMH2sg PartitionCount: 1       ReplicationFactor: 1	Configs:
Topic: quickstart-events Partition: 0    Leader: 0   Replicas: 0 Isr: 0
```

### 4. Send some messages
A Kafka client communicates with the Kafka brokers via the network for writing (or reading) events. Once received, the brokers will store the events in a durable and fault-tolerant manner for as long as you need—even forever.

Run the console producer client to write a few events into your topic. By default, each line you enter will result in a separate event being written to the topic.
```sh
$ bin/kafka-console-producer.sh --topic quickstart-events --bootstrap-server localhost:9092
>This is my first event
>This is my second event
```
You can stop the producer client with Ctrl-C at any time.

### 5. Start a consumer
Open another terminal session and run the console consumer client to read the events you just created:
```sh
$ bin/kafka-console-consumer.sh --topic quickstart-events --from-beginning --bootstrap-server localhost:9092
This is my first event
This is my second event
```
You can stop the consumer client with Ctrl-C at any time.

Feel free to experiment: for example, switch back to your producer terminal (previous step) to write additional events, and see how the events immediately show up in your consumer terminal.

Because events are durably stored in Kafka, they can be read as many times and by as many consumers as you want. You can easily verify this by opening yet another terminal session and re-running the previous command again.
### 6. Setting up a multi-broker cluster

---
---
---
