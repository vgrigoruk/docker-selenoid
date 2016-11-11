FROM ubuntu:14.04

MAINTAINER Artem Eroshenko <eroshenkoam@qameta.io>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

#================================================
# Customize sources
#================================================
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe multiverse\n" > /etc/apt/sources.list && \
    echo "deb http://archive.ubuntu.com/ubuntu/ trusty-updates main universe multiverse\n" >> /etc/apt/sources.list && \
    echo "deb http://archive.ubuntu.com/ubuntu/ trusty-security main universe multiverse\n" >> /etc/apt/sources.list

#========================================
# Install wget, unzip
#========================================
RUN apt-get update && \
    apt-get install -yqq wget unzip && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#========================================
# Add selenoid user
#========================================
RUN sudo useradd selenoid --shell /bin/bash --create-home && \
    sudo usermod -a -G sudo selenoid && \
    echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    echo 'selenoid:secret' | chpasswd