# Very simple hg server

The Dockerfile fetches and builds the latest mercurial version. 

When starting the container, it will run a server in the /repo directory,
which should be mapped with readwrite access to an existing repository.

Multiple container can be run when using different outside ports.

# Create the image

```
docker build -t hg-serve:6.5.1 .
```

# Run docker

```
sudo docker run -p 8000:8000 -v /path/to/repository:/repo:rw hg-serve:6.5.1
```

# docker-compose

```
version: "3"

services:
  my-great-hg-repo:
    image: hg-serve:6.5.1
    restart: always
    volumes:
      - /path/to/repo:/repo:rw
    ports:
      - "8000:8000"
```
