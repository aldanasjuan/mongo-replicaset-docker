docker compose down;
docker compose up -d;
sleep 10;
docker exec mongo mongosh load('/data/db/scripts/rs.js');  
docker exec mongo mongosh load('/data/db/scripts/initial.js');