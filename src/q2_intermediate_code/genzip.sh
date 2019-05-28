#!/bin/sh

name='submit__'$(date "+%Y_%m_%d_%H_%M_%S")'___'$(wc -l dga.csv | awk '{print "line_"$1}')'.zip'

echo $name
zip -r $name dga.csv writeup.pdf code.zip 
