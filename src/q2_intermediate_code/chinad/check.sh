#!/bin/sh

tshark -r not_common.pcap -Y "ip.addr in {168.73.33.96 61.71.169.229}" -T fields -e dns.qry.name | awk -F, '{if(!($1 ~ /^[a-z0-9]{16}\.(com|org|net|biz|info|ru|cn)$/)) print "ERROR", $0}' 