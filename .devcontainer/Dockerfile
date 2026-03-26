FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    iverilog \
    gtkwave \
    make \
    gcc \
    g++ \
    python3 \
    python3-pip \
    git \
    vim \
    nano \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["/bin/bash"]