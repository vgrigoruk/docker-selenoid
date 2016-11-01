FROM selenoid/browser-base:latest

RUN sudo useradd selenoid --shell /bin/bash --create-home \
  && sudo usermod -a -G sudo selenoid \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'selenoid:secret' | chpasswd

#============================================
# Google Chrome
#============================================

ARG CHROME_VERSION="54.0.2840.71-1"

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update -qqy && \
    apt-get -qqy install google-chrome-stable=${CHROME_VERSION} && \
    rm /etc/apt/sources.list.d/google-chrome.list && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#==================
# Chrome driver
#==================

ARG CHROME_DRIVER_VERSION=2.24

RUN wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip && \
    rm -rf /opt/selenium/chromedriver && \
    unzip /tmp/chromedriver.zip -d /opt/selenium && \
    rm /tmp/chromedriver.zip && \
    mv /opt/selenium/chromedriver /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION && \
    chmod 755 /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION && \
    ln -fs /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION /usr/bin/chromedriver

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

VOLUME /tmp

EXPOSE 4444

USER selenoid

ENTRYPOINT /entrypoint.sh