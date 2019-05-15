#!/bin/sh

echo "packetid,attackid" > traffic.csv

echo "DynamicDNS..."
tshark -r q1_final.pcap -Y "dns and not dns.flags.opcode == 0 and dns.flags.response == 0" -T fields -e frame.number -e ip.src | awk '{print $1",5"; ip[$2] += 1} END {for(i in ip) print i, ip[i] > "/dev/stderr"}' >> traffic.csv

echo "AXFR..."
tshark -r q1_final.pcap -Y "dns.qry.type in {251 252} and not ip.addr in {221.223.19.169 129.191.74.107} and not dns.flags.response == 1" -T fields -e frame.number -e ip.src | awk '{print $1",4"; ip[$2] += 1} END {for(i in ip) print i, ip[i] > "/dev/stderr"}' >> traffic.csv

echo "Reflect..."
tshark -r q1_final.pcap -Y 'dns.qry.type in {255} and dns.flags.recdesired == 1 and dns.qry.name in {"734a5.gov" "d1a4.cc"} and not dns.flags.response == 1 and ip.src in {127.130.104.152 175.222.102.169 105.191.150.205}' -T fields -e frame.number -e ip.src -e dns.qry.name | awk '{print $1",3"; ip[$2] += 1; site[$3] += 1;} END {for(i in ip) print i, ip[i]  > "/dev/stderr"; for(s in site) print s, site[s] > "/dev/stderr";}' >> traffic.csv

echo "DOS..."
tshark -r q1_final.pcap -Y 'dns and dns.flags.response == 0 and ip.src == 144.202.64.226' -T fields -e frame.number -e ip.dst -e dns.qry.name | awk '{print $1",2"; dns[$2] += 1; domain[$3] += 1} END {for(ip in dns) print ip, dns[ip] > "/dev/stderr"; for(i in domain) if(domain[i] != 2) print i, domain[i] > "/dev/stderr"}' >> traffic.csv

echo "DNSSec..."
tshark -r q1_final.pcap -Y 'dns and dns.qry.type in {43 6} and dns.flags.response == 0 and ip.src == 6.116.183.244' -T fields -e frame.number -e ip.dst | awk '{print $1",1"; dns[$2] += 1} END {for(ip in dns) print ip, dns[ip] > "/dev/stderr"}' >> traffic.csv

name='submit__'$(date "+%Y_%m_%d_%H_%M_%S")'.zip'

echo $name
zip -r $name attack.csv traffic.csv writeup.pdf code.zip
