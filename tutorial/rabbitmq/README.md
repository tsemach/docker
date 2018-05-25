### Getting the Image
````bash
docker pull rabbitmq:3-management
````
### Simple Run (Without expose managemet port)
docker run -d --name rabbitmq -p 5672:5672 rabbitmq

### Run with Management Port
docker run -d --hostname rabbitmq --name rabbitmq -p 8080:15672 -p 5671:5671 -p 5672:5672 rabbitmq:3-management
