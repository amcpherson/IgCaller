FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND noninteractive

RUN set -e \
      && apt-get -y update \
      && apt-get -y install --no-install-recommends --no-install-suggests \
      ca-certificates curl python3 samtools python3-pip git \
      && apt-get -y autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

COPY . /IgCaller
RUN pip3 install --break-system-packages /IgCaller

ENTRYPOINT ["igcaller"]
