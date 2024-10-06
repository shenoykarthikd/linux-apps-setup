# Pull docker image from Docker Hub registry
docker pull apache/kafka:3.8.0-rc3

# Create kakfa.env (empty) file
touch kafka.env

# Edit kafka.ev file in vim editor
vi kafka.env

# Create folder for storing Kafka data
mkdir ~/kafka

# Create docker-compose.yml file and edit it in vim editor
touch docker-compose.yml
vi docker-compose.yml

# Start the kafka container
docker compose -f ~/docker-compose.yml up -d

# Query Kafka from VM Host to create a new topic
docker exec -it kafka /opt/kafka/bin/kafka-topics.sh --create --topic SAMPLE_QUEUE --bootstrap-server localhost:9092

# Query Kafka from VM Host to alter the number of topic partitions
docker exec -it kafka /opt/kafka/bin/kafka-topics.sh --alter --topic SAMPLE_QUEUE --partitions 24 --bootstrap-server localhost:9092

# Query Kafka from VM Host to list topics
docker exec -it kafka /opt/kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092