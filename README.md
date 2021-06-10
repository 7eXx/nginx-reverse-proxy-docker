# Nginx Reverse Proxy Docker
This repository create a reverse proxy with nginx that has two virtual servers.  

# Pre-check
The information of servers (like name and ip) are stored in **.env** file.  
Duplicate this file and rename it as **.env.local** with your custom info.
There is also a variable for the image tag.
These data will be used in docker build image.

# Building image
Use the **./build-docker-image.sh** file to build image.  
The image built expose 443 port for the nginx reverse proxy.  
Run the container with: 
```
$ docker run --rm -p 443:443 --name=nginx-reverse-proxy nginx-reverse-proxy:latest
```