#!/bin/bash

result=$(curl -s --upload-file /wlan0.pcap https://transfer.sh/wlan0.pcap)

echo $result
