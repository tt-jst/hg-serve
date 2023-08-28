FROM debian:latest

RUN apt-get update && apt-get install -y python3-dev python3-docutils build-essential python3.9-distutils wget

RUN cd /tmp && wget -O - https://www.mercurial-scm.org/release/mercurial-6.5.1.tar.gz | gunzip | tar xf -

RUN cd $(ls -d /tmp/mercurial*) && make install && cd /tmp && rm -rf "$(ls -d /tmp/mercurial*)"

RUN hg --version

EXPOSE 8000

CMD cd /repo && hg serve --config web.push_ssl=No --config "web.allow_push=*"
