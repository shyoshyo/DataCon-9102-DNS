#!/bin/sh
tshark -r not_common.pcap -Y 'dns.qry.name ~ "[abcdefklmno]{16}\.(com|co.uk|de|org|net|eu|info|online|co|cc|website)"' -T fields -e ip.src -e ip.dst | awk '{print $1"\n"$2}' | sort -u

