#!/bin/sh
awk 'BEGIN { N = 4; a[1] = "net"; a[2] = "biz"; a[3] = "org"; a[4] = "com";; for(i = 0; i < 1000000; i++) for(j = N; j >= 1; j--) if(i % j == 0){count[a[j]] = count[a[j]] + 1; M += 1; break} for(i in count) print(i, count[i], count[i] / M)}'
echo ' '
awk 'BEGIN { N = 6; a[1] = "com"; a[2] = "net"; a[3] = "org"; a[4] = "info"; a[5] = "biz"; a[6] = "ru"; for(i = 0; i < 1000000; i++) for(j = N; j >= 1; j--) if(i % j == 0){count[a[j]] = count[a[j]] + 1; M += 1; break} for(i in count) print(i, count[i], count[i] / M)}'
