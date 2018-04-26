
## Running a docker example:
```bash
1. systemctl start docker
2. docker build -t friendlyhello .
3. docker run -p 4000:80 friendlyhello
4. browse to http://localhost:4000
```

## Running in the background (dettach mode):
```bash
1. docker run -d -p 4000:80 friendlyhello
2. docker container ls
```

## Tagging and Publishing an image
```bash
1. docker tag image tsemach/cloudia:proxy
2. docker push tsemach/cloudia:proxy
```

# Services - deploy container in production
starting docer load-balancer
```sh
docker swarm init
docker stack deploy -c docker-compose.yml getstartedlab
docker service ls
```

#### _task_ a single container running in a service is called a task.

# List the tasks for a service:
```sh
docker service ps getstartedlab_web
```
# Take the app down
```sh
docker stack rm getstartedlab	# stop all container instances (tasks)
docker swarm leave --force		# stop the swarm
```

# Swarm
#### **swarm** is a group of machines that are running Docker and joined into a cluster
#### **node** a machine joining to the swarm

