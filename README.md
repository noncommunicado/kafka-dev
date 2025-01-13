# Kafka DEV setup for unix systems

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
- KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://{{MY_IP}}:9092 # replace with another IP or Host if need
```

3. By default here, broker has persistent data in volume `./kafka`, comment it in `docker-compose.yaml` file if you need.
4. Access kafka UI with `http://{machine-ip-or-host}:8080`
