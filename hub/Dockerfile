FROM golang:1.7

RUN go get github.com/aandryashin/selenoid && \
    cd $GOPATH/src/github.com/aandryashin/selenoid && \
    go build && \
    cp $GOPATH/src/github.com/aandryashin/selenoid/selenoid /usr/bin/selenoid

ADD etc/selenoid /etc/selenoid

VOLUME /etc/selenoid

EXPOSE 4444

CMD ["/usr/bin/selenoid","-conf","/etc/selenoid/browsers.json"]