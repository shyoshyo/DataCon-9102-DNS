#!/bin/sh
tshark -r q2_final.pcap -Y 'dns and udp and dns.flags.opcode == 0 and dns.qry.class == 0x1 and not dns.qry.name in {msn.com access-board.gov weilaigou.com hrsa.gov unionpaysecure.com tsinghua.edu.cn english.gov.cn weibo.com "<Root>" "" " " sina.com tsinghua.org.cn kprule.com join-tsinghua.edu.cn xn--r-5gn qq.com baidu.com taobao.com localhost 163.com sohu.com apple.com xunlei.com hao123.com aminer.org alertmanager-bot github.com smth.edu.cn local weibo.cn goldenfrog.com google.com cngi-6ix-inetboss cngi-tein4-inetboss cernet-inetboss twitter.com instagram.com cernet100g-inetboss mail sina.cn t.cn sina.com.cn tsinghua.edu fedoraproject.org yahoo.com sandrotracker.biz asnet.pw dns2.edu.cn}' -w not_common.pcap


