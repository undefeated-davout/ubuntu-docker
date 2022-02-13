FROM ubuntu:20.04

RUN apt update && \
  DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y \
    bash \
    bind9-dnsutils \
    ca-certificates \
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
    sudo \
    tcpdump \
    tmux \
    traceroute \
    unzip \
    vim \
    wget \
    xsel \
  && apt autoremove && apt autoclean

# confgを取得
RUN git clone https://github.com/undefeated-davout/linux-config.git
ARG CONFIG_DIR=linux-config

# bash設定
RUN cat ./${CONFIG_DIR}/.bashrc >> ~/.bashrc
# tmux設定
RUN cp ./${CONFIG_DIR}/.tmux.conf /root/.tmux.conf
# Git設定
RUN cp ./${CONFIG_DIR}/.gitconfig /root/.gitconfig
RUN rm -rf ./${CONFIG_DIR}/

# 日本語設定
RUN locale-gen ja_JP.UTF-8

WORKDIR /share
