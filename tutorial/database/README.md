### Creating Volume
````bash
docker volume create pgdata
````

### Running Database
You can run with a specific created network or use default docker bridge
1. option-1: using predefine network
````bash
docker run -p 5432:5432 --net pod-net -v pgdata:/var/lib/postgresql/data --ip 10.1.0.2 -d -e POSTGRES_PASSWORD=somepassword --name db postgres:9.6.6-alpine
````

2. option-2: using default bridge
````bash
docker run -p 5432:5432 -v pgdata:/var/lib/postgresql/data -d -e POSTGRES_PASSWORD=somepassword --name db postgres:9.6.6-alpine
````

### Creating a database partition
````bash
docker exec --user postgres -i db /usr/local/bin/createdb cloudia_gateway
````
or
````bash
docker exec --user postgres -it 76d928f8a441 /usr/local/bin/createdb cloudia_gateway
````
