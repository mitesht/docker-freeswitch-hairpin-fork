#!/bin/bash
set -e

if [ "$1" = 'freeswitch' ]; then
  shift

while :; do
  case $1 in 
  -s|--sip-port)
    if [ -n "$2" ]; then
      sed -i -e "s/sip_port=[[:digit:]]\+/sip_port=$2/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  -t|--tls-port)
    if [ -n "$2" ]; then
      sed -i -e "s/tls_port=[[:digit:]]\+/tls_port=$2/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  -e|--event-socket-port)
    if [ -n "$2" ]; then
      sed -i -e "s/event_socket_port=[[:digit:]]\+/event_socket_port=$2/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  -a|--rtp-range-start)
    if [ -n "$2" ]; then
      sed -i -e "s/rtp_range_start=[[:digit:]]\+/rtp_range_start=$2/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  -z|--rtp-range-end)
    if [ -n "$2" ]; then
      sed -i -e "s/rtp_range_end=[[:digit:]]\+/rtp_range_end=$2/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  --ext-rtp-ip)
    if [ -n "$2" ]; then
      sed -i -e "s/external_rtp_ip=.*\"/external_rtp_ip=$2\"/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  --ext-sip-ip)
    if [ -n "$2" ]; then
      sed -i -e "s/external_sip_ip=.*\"/external_sip_ip=$2\"/g" /usr/local/freeswitch/conf/vars_diff.xml
      sed -i -e "s/bind_server_ip=.*\"/bind_server_ip=$2\"/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  --codecs)
    if [ -n "$2" ]; then
      sed -i -e "s/global_codec_prefs=.*\"/global_codec_prefs=$2\"/g" /usr/local/freeswitch/conf/vars_diff.xml
      sed -i -e "s/outbound_codec_prefs=.*\"/outbound_codec_prefs=$2\"/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  -p|--password)
    if [ -n "$2" ]; then
      sed -i -e "s/password=.*\"/password=$2\"/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  --)
    shift
    break
    ;;

  *)
    break
  esac

  shift
  shift

done
    exec freeswitch "$@"
fi

exec "$@"
