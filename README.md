# Packet Capture

## Installation
- Follow documentation at https://www.balena.io/docs/learn/welcome/introduction/ to create a simple image and deploy this repository.

## Setup a AP
- Do initial setup as decriber here https://www.balena.io/docs/reference/OS/network/2.x/#creating-a-hotspot
- Set `autoconnect` to `true`
- Remove any other configuration that runs on wlan0.
- Restart the pi or use `nmcli` to start the hotspot.


## Getting the packets from the RPi
- Run `transfer wlan0.pcapng`
- One the file is uploaded, it would generate a link to download the packet capture.
