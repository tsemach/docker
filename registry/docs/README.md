## From
https://www.youtube.com/watch?v=r15S2tBevoE

## Starting the registry as a docker file
To create the registry run
````bash
docker compose -f 01-plain-http.yaml up -d
````
## Build a test image and push it to registry
Create an image with tag localhost:5000/mydebian:v1
````bash
docker build -f debian.dockerfile -t localhost:5000/mydebian:v1 .
````

Pushing the image to registry
````bash
docker push localhost:5000/mydebian:v1
````

Listing the images in the registry
````bash
docker images localhost:5000/mydebian
````

Running the image
````bash
docker run --name mydebian --rm -it localhost:5000/mydebian:v1 bash
````

To list the running container
````bash
curl -X GET localhost:5000/v2/mydebian/tags/list
````

## Running the image in Kubernetes cluster
````bash
kubectl run mytest --image 192.168.122.1:5000/mydebian:v1
````
