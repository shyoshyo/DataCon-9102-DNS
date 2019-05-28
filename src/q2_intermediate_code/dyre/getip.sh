#!/bin/sh
tshark -r not_common.pcap -Y 'dns.qry.name ~ "[a-z][0-9a-f]{33}\.(cc|ws|to|in|hk|cn|tk|so)"' -T fields -e ip.src -e ip.dst | awk '{print $1"\n"$2}' | sort -u

