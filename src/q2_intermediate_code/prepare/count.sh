#!/bin/sh
tshark -r q2_final.pcap -Y '' -T fields -e dns.qry.name | awk '{count[$0]+=1} END {for(i in count) print count[i]"\t"i}' | sort -k1rn

