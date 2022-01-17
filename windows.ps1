docker compose down;
docker compose up -d;
Start-Sleep -s 10
docker exec mongo scripts/rs-init.sh;

# docker exec mongo mongo