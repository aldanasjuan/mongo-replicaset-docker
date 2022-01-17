docker compose down;
docker compose up -d;
sleep 10;
docker exec mongo scripts/rs-init.sh;