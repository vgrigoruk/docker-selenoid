FROM selenoid/base

MAINTAINER Artem Eroshenko <eroshenkoam@qameta.io>

#================================================
# Install fonts, xvfb
#================================================
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && \
    apt-get update && \
    apt-get install -yqq ttf-dejavu-core ttf-mscorefonts-installer && \
    apt-get install -yqq fonts-dejavu-core fonts-liberation fonts-ubuntu-font-family-console && \
    apt-get install -yqq libfontconfig1 libfontenc1 libfreetype6 libxfont1 libxft2 && \
    apt-get install -yqq xfonts-base xfonts-encodings xfonts-utils && \
    apt-get install -yqq fontconfig fontconfig-config && \
    apt-get install -yqq flashplugin-installer && \
    apt-get install -yqq xvfb && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#================================================
# Setup cursor
#================================================
RUN echo "gtk-cursor-blink=0" > /home/selenoid/.gtkrc-2.0

#============================
# Configuration options
#============================
ENV SCREEN "1280x1600x24"
ENV DISPLAY :99.0