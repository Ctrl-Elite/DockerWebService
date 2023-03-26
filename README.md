# DockerWebService
This is proof of concept project using docker. This project contains a very basic dotnet web api project which is published using docker and nginx.

## Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## Build & Deploy
After installing and running docker desktop on your local machine you can build this project and deploy it as a container.

After building this project will produce 2 container images. One for our project and another one for our web server (reverse proxy) which is nginx. Core porject will only be accessible to the reverse proxy container. All the requests will be routed from proxy container to our core project. You can find both the dockerfiles as `Nginx.Dockerfile` & `Api.Dockerfile`. `nginx.conf` contains all reverse proxy settings.

We will be using `docker-compose` to build and deploy this project. Following are the steps needed,

```
docker-compose build
docker-compose up -d
```

These commands will build and run the container in a detached mode(-d). If you want to stop and remove the containers just run the following command,
```
docker-compose down
```
We can use the `DOCKER_HOST` and docker context to deploy this container to any remote machine(Using ssh).

## References
- [Docker Official Docs](https://docs.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Nginx](https://www.nginx.com/resources/glossary/nginx/)
- Additional References
  - [Docker Context](https://docs.docker.com/engine/context/working-with-contexts/)
  - [SSH](https://www.ssh.com/academy/ssh)
