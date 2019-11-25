FROM balenalib/raspberrypi3-debian

RUN apt-get update

# Headless wireshark
RUN apt-get install tshark -y

# Free up cache storage
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ADD uploadPcap.sh /uploadPcap.sh
RUN chmod +x /uploadPcap.sh

CMD tshark -i wlan0 -w /wlan0.pcap;
