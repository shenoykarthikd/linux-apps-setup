envsubst '${USER}' < template-docker-compose > template-output-docker-compose.yml
docker compose -f template-output-docker-compose.yml up -d