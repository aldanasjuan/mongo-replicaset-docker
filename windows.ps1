docker compose down;
docker compose up -d;
Start-Sleep -s 10;
docker exec mongo mongosh load("/data/db/scripts/rs.js");
docker exec mongo mongosh load("/data/db/scripts/initial.js");

# docker exec mongo mongo