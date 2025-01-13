# Kafka DEV setup for unix systems

A small installation script to create a single-broker Kafka cluster with Web-UI. This is for development purposes only.

## Setup

1. Copy repository and run `install.sh` script!

```bash
git clone https://github.com/noncommunicado/kafka-dev.git kafka-dev
cd ./kafka-dev
sudo chmod +x ./install.sh
./install.sh
```

Docker compose will run **automatically**.

2. If you have **several network interfaces**, please check `docker-compose.yaml` for correct IP setup in kafka broker environment.

Script will replace `{{MY_IP}}` with **first** net-interface IP **automatically**.

```yaml
# replace with another IP or Host if need
- KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://{{MY_IP}}:9092
```

3. By default here, broker has persistent data in volume `./kafka`, comment it in `docker-compose.yaml` file if you need.
4. Access kafka UI with `http://{machine-ip-or-host:8080`

## Docker Compose file review

**Note! Change network address if host machine locates in the same subnet.**

<details>

<summary>Here presented default docker compose file</summary>

```yaml
name: kafka
services:

  broker:
    image: bitnami/kafka:latest
    hostname: broker
    ports:
      - 9092:9092
    restart: unless-stopped
    environment:
      KAFKA_ENABLE_KRAFT: yes
      KAFKA_AUTO_CREATE_TOPICS_ENABLE: true
      KAFKA_CFG_NODE_ID: 0
      KAFKA_CFG_PROCESS_ROLES: controller,broker
      KAFKA_CFG_CONTROLLER_LISTENER_NAMES: CONTROLLER
      KAFKA_CFG_INTER_BROKER_LISTENER_NAME: PLAINTEXT
      KAFKA_CFG_LISTENERS: PLAINTEXT://:9092,CONTROLLER://:9093
      KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP: CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT
      KAFKA_CFG_CONTROLLER_QUORUM_VOTERS: 0@broker:9093
      # replace with another IP or Host if need
      KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://{{MY_IP}}:9092
    volumes:
      - ./kafka:/bitnami/kafka # persistent data

  ui:
    image: provectuslabs/kafka-ui:latest
    ports:
      - 8080:8080
    restart: unless-stopped
    environment:
      DYNAMIC_CONFIG_ENABLED: 'true'
    volumes:
      - ./kui/config.yaml:/etc/kafkaui/dynamic_config.yaml

networks:
  default:
    driver: bridge
    ipam:
      config:
        - subnet: 10.14.88.0/29
```

</details>

## Credits

By Kutumov Nikita

Donate with TON

`UQD0zFgp0p-eFnbL4cPA6DYqoeWzGbCA81KuU6BKwdFmf8jv`

[Connect in Telegram](https://t.me/noncommunicado)


2025
