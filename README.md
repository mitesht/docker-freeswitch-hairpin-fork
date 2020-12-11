# docker-freeswitch-hairpin

A Freeswitch 1.6 image designed for use with [drachtio-freeswitch-siprec-recording-server](http://davehorton.github.io/drachtio-siprec-recording-server/).

To run with default options:
```bash
docker run -d --rm --name FS1 --net=host davehorton/freeswitch-hairpin freeswitch 
```
To jump in to a running container with a freeswitch console:
```bash
docker exec -ti FS1 fs_cli
```
> Note: you can also jump into the container with `/bin/bash` instead of `fs_cli` to get a shell prompt.

This container supports the ability to configure the various ports Freeswitch claims, in order to easily run multiple Freeswitch containers on the same host
* --sip-port the sip port to listen on (default: 5080)
* --tls-port the tls port to listen on (default: 5081)
* --event-socket-port the port that Freeswitch event socket listens on (default: 8021)
* --password the event socket password (default: ClueCon)
* --rtp-range-start the starting UDP port for RTP traffic
* --rtp-range-end the ending UDP port for RTP traffic
* --ext-rtp-ip the external RTP IP
* --ext-sip-ip the external SIP IP
* --codecs the list of codecs separated by coma

Additionally, it exposes the Freeswitch log, sounds, and recordings directory to the host.

An example of starting a container with advanced options:
```bash
docker run -d --rm --name FS1 --net=host \
-v /home/deploy/log:/usr/local/freeswitch/log  \
-v /home/deploy/sounds:/usr/local/freeswitch/sounds \
-v /home/deploy/recordings:/usr/local/freeswitch/recordings \
davehorton/freeswitch-hairpin \
 --sip-port 5038 --tls-port 5039 --rtp-range-start 20000 --rtp-range-end 21000
```

If configuration wants to copy in volume:
```bash
docker run -d --name FS1 --net=host \
-v /home/ubuntu/deploy/log:/usr/local/freeswitch/log  \
-v fs_conf:/usr/local/freeswitch/conf \
davehorton/freeswitch-hairpin
```
