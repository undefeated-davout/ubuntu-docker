FROM ubuntu:20.04

RUN apt update && \
  DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y \
    bash \
    bind9-dnsutils \
    coreutils \
    curl \
    dnsmasq-base \
    git \
    grep \
    iproute2 \
    iptables \
    iputils-ping \
    isc-dhcp-client \
    language-pack-ja \
    language-pack-ja-base \
    less \
    netcat-openbsd \
    procps \
    python3 \
    tcpdump \
    tmux \
    traceroute \
    unzip \
    vim \
    wget \
  && apt-get clean \
  && apt autoremove && apt autoclean

# bash設定
COPY ./config/.bashrc .
RUN cat .bashrc >> ~/.bashrc
RUN rm .bashrc

# 日本語設定
RUN locale-gen ja_JP.UTF-8

# tmux設定
COPY ./config/.tmux.conf /root/.tmux.conf

WORKDIR /share
