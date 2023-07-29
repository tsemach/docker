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
# Option 2 - Add certigicate to docker registry
Create a directory name **certs**
````
mkdir certs
```` 

Fill the file __openssl.conf__ as follow:

```
[ req ]
distinguished_name = req_distinguished_name
x509_extensions     = req_ext
default_md         = sha256
prompt             = no
encrypt_key        = no

[ req_distinguished_name ]
countryName            = "GB"
localityName           = "London"
organizationName       = "Just Me and Opensource"
organizationalUnitName = "YouTube"
commonName             = "<Docker Server IP>"
emailAddress           = "test@example.com"

[ req_ext ]
subjectAltName = @alt_names

[alt_names]
DNS = "<Docker Server IP>"
```

Run the command to create the certificates
````bash
openssl req  -x509 -newkey rsa:4096 -days 365 -config openssl.conf  -keyout certs/domain.key -out certs/domain.crt
````

Run docker compose with file 02-With-TLS.yaml 
````
docker compose -f 02-With-TLS.yaml up -d
````

Need to fix containerd with look at this docker registry
1. from: https://stackoverflow.com/questions/73415766/how-to-skip-tls-cert-check-for-crictl-containerd-cr-while-pulling-the-images-f
2. create folders: 
````
mkdir -p /etc/containerd/certs.d/center-1:5000
````
3. add these config in /etc/containerd/config.toml:
````
[plugins."io.containerd.grpc.v1.cri".registry]
  config_path = "/etc/containerd/certs.d"

create and edit hosts.toml under the just created folder
server = "https://center-1:50000"


[host."https://center-1:5000"]
  capabilities = ["pull", "resolve"]
  skip_verify = true
````

restart containerd by
````
sudo systemctl restart containerd
````

Run a image in the cluster
````
kubectl run mytest --image center-1:5000/mydebian:v1 --image-pull-policy Always
````

Enter the pod as follow
````
k exec -it mytest -- bash
````

### docker registry username password
username: dockerusername 
password: dockerpassword

k create secret docker-registry mydockercredentials --docker-server center-1:5000 --docker-username dockerusername --docker-password dockerpassword