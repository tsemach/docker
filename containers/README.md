### Build
docker build -t hello-world .

### Run local test
docker run --env SERVICE=docker -p 8081:8081 -it hello-world

### Test with local docker-compose
docker-compose up 

### Push to docker hub
docker tag hello-world:latest tsemach/hello-world:latest
docker push tsemach/hello-world:latest
