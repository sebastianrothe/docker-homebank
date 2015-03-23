FROM ubuntu
MAINTAINER neolao <contact@neolao.com>

RUN apt-get install -y software-properties-common && \
    add-apt-repository ppa:mdoyen/homebank && \
    apt-get update && \
    apt-get install -y homebank

CMD ["/usr/bin/homebank"]
