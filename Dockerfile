FROM balenalib/raspberrypi3-debian

RUN apt-get update

# Headless wireshark, mailutils, vim
RUN apt-get install tshark mailutils sendmail vim -y

# Free up cache storage
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /sexxi-goose

ADD transfer.sh /transfer.sh
ADD onStartup.sh /onStartup.sh
ADD hostname.sh /hostname.sh

RUN cat /transfer.sh >> ~/.bashrc && \
    cat /onStartup.sh >> ~/.bashrc && \
    cat /hostname.sh >> ~/.bashrc && \
    rm /transfer.sh /onStartup.sh /hostname.sh

CMD tshark -i wlan0 -w /wlan0.pcapng
