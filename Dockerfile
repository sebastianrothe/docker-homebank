FROM ubuntu:latest

RUN apt-get update && apt-get install -yq --no-install-recommends \
    software-properties-common \
&& add-apt-repository ppa:mdoyen/homebank && apt-get update && apt-get install -yq --no-install-recommends \
    homebank \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/homebank"]
