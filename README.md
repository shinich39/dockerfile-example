# dockerfile-example

## Basic usage

```console
docker build -t test-image:0.1 .
docker run -it --name test-container test-image:0.1 /bin/bash
```

## Docker usage

- Build docker image from dockerfile

```console
docker build -t dockerfile:0.1 .
```

- Print all images

```console
docker images
docker image ls
```

- Create container from docker image

-a (--attach)  
-i (--interactive)  
-t (--tty): pseudo-terminal  

```console
docker create -it --name test dockerfile:0.1
docker start test
docker attach test
```

```console
docker create -it --name test dockerfile:0.1
docker start test
docker exec -it test /bin/bash
```

```console
docker run -i -t --name test dockerfile:0.1 /bin/bash
docker run -it --name test dockerfile:0.1 /bin/bash
```

- Print all containers

```console
docker ps --all
docker ps -a
docker container ls --all
docker container ls -a
```

- Remove a container

```console
docker container rm test
docker rm test
```

- Remove an image

```console
docker image rm dockerfile:0.1
docker rmi dockerfile:0.1
```