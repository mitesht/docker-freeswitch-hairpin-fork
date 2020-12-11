FROM drachtio/drachtio-freeswitch-base:latest

RUN apt-get update && apt-get install -y vim dnsutils

COPY ./entrypoint.sh /
COPY 00_test.xml /usr/local/freeswitch/conf/dialplan/public/

RUN mkdir -p /usr/local/freeswitch/conf
VOLUME ["/usr/local/freeswitch/log","/usr/local/freeswitch/sounds","/usr/local/freeswitch/recordings","/usr/local/freeswitch/conf"]

ENV PATH="/usr/local/freeswitch/bin:${PATH}"

ENTRYPOINT ["/entrypoint.sh"]

CMD ["freeswitch"]
