FROM ubuntu:16.04

RUN adduser --disabled-password --gecos "" syncuser

RUN apt-get update && \
    apt-get install -y curl vim sudo golang apt-transport-https supervisor git

RUN curl -s https://syncthing.net/release-key.txt | sudo apt-key add - && \
    echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list && \
    sudo apt-get update && \
    sudo apt-get install syncthing

COPY supervisor-syncthing.conf /etc/supervisor/conf.d/syncthing.conf
COPY stcli-actions.sh /usr/local/bin/stcli-actions.sh
RUN  chmod +x /usr/local/bin/stcli-actions.sh

USER syncuser
RUN export GOPATH=$HOME/go && \
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin && \
    go get github.com/syncthing/syncthing/cmd/stcli

CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/syncthing.conf
