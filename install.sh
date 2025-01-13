# set IP
MY_IP=$(hostname -I | cut -d' ' -f1)
sed -i "s/{{MY_IP}}/$MY_IP/g" ./docker-compose.yaml

# broker data volume
mkdir ./kafka
chown 1001:1001 ./kafka -R

# run docker compose 
docker compose up -d

echo "Done! UI here > http://$MY_IP:8080"