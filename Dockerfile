FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y \
                sudo \
                vim \
                git \
                wget \
                curl \
                unzip

# Japanese setting
RUN apt-get install -y \
        language-pack-ja-base \
        language-pack-ja
RUN locale-gen ja_JP.UTF-8
RUN echo export LANG=ja_JP.UTF-8 >> ~/.bashrc

# work directory
RUN mkdir /share
WORKDIR /share

