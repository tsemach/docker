1. create network
````bash
docker network create tsemach
````

2. create volumes
````bash
docker volume create opensearch
docker volume create redis-data
docker volume create minio-data
````