FROM debian:latest

RUN apt-get update && apt-get install -y apt-utils python-dev python3-dev python3-docutils mercurial build-essential python3.9-distutils gcc pip 

RUN pip install mercurial 

RUN hg clone -U https://www.mercurial-scm.org/repo/hg-stable /tmp/hg && cd /tmp/hg && hg up "max(tagged())" 

RUN cd /tmp/hg && make install

RUN hg --version

EXPOSE 8000

CMD cd /repo && hg serve --config web.push_ssl=No --config "web.allow_push=*"
