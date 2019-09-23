## Dockerfile
````bash
FROM centos:7
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
````

## Build
````bash
docker build -f ./centos.docker --rm -t local/my-centos .
````

## Creating image based on centos-7

1. Run centos-7 image by:
````
docker run it centos:7 bash

# install nvm and node
# keep the terminal open
````

2. On different terminal run docker commit to create a new image
````
docker commit <container-id> centos-node:10.16.3
````

3. Tag the image with the pulic repository
````
docker tag centos-node:10.16.3 tsemach/centos-node:10.16.3
````

4. Push the tagged image to the public repository
````
docker push tsemach/centos-node:10.16.3
````
