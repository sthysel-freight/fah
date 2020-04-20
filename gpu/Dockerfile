FROM nvidia/cuda:10.2-base-ubuntu18.04

ARG FAH_VERSION="v7.5"

RUN useradd --system folding
RUN mkdir -p /opt/fahclient

RUN apt-get update && apt-get install -y \
  software-properties-common \
  tzdata \
  wget \
  bzip2


RUN wget https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/${FAH_VERSION}/latest.tar.bz2 -O /tmp/fahclient.tar.bz2

RUN tar -xjf /tmp/fahclient.tar.bz2 -C /opt/fahclient --strip-components=1 && \
  chown -R folding:folding /opt/fahclient && \
  rm -rf /tmp/fahclient.tar.bz2

RUN add-apt-repository -y ppa:graphics-drivers && \
  apt-get update && apt-get install -y --install-recommends \
  nvidia-opencl-dev && \
  apt-get remove -y software-properties-common && \
  apt-get autoremove -y && \
  apt-get clean autoclean && \
  rm -rf /var/lib/apt/lists/*

COPY --chown=folding:folding entrypoint.sh /opt/fahclient

RUN chmod +x /opt/fahclient/entrypoint.sh

ENV USER "Anonymous"
ENV TEAM "0"
ENV ENABLE_GPU "true"
ENV ENABLE_SMP "false"
ENV POWER "full"

USER folding
WORKDIR /opt/fahclient

EXPOSE 7396
EXPOSE 36330

ENTRYPOINT ["/opt/fahclient/entrypoint.sh"]
