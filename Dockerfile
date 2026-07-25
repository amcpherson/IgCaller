FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND noninteractive

RUN set -e \
      && apt-get -y update \
      && apt-get -y install --no-install-recommends --no-install-suggests \
      ca-certificates curl python3 samtools python3-pip git \
      && pip3 install --break-system-packages regex numpy scipy \
      && apt-get -y autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*


RUN set -e \
      && cd / \
      && git clone https://github.com/amcpherson/IgCaller \
      && chmod +x IgCaller/IgCaller 

ENV PATH=/IgCaller/:${PATH}

ENTRYPOINT ["IgCaller"]
