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

Here presented default docker compose file.

**Note! Change network address if host machine locates in the same subnet.**

```yaml

```


## Credits

By Kutumov Nikita

Donate with TON

`UQD0zFgp0p-eFnbL4cPA6DYqoeWzGbCA81KuU6BKwdFmf8jv`

[Connect in Telegram](https://t.me/noncommunicado)


2025
