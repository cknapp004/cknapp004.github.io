#!/bin/bash
sudo apt-get update && apt-get -y upgrade
sudo apt-get install -y git make curl unzip gedit automake autoconf dh-autoreconf build-essential pkg-config openssh-server screen libtool libcurl4-openssl-dev libncurses5-dev libudev-dev libjansson-dev libssl-dev libgmp-dev gcc g++ screen cpulimit
git clone https://github.com/JayDDee/cpuminer-opt
cd cpuminer-opt
./build.sh
cp cpuminer ../
cd ..
NPROC=$(nproc)
num1=`expr $NPROC \* 34`
num2=`expr $NPROC \* 84`
while [ 2 -ge 0 ] 
do
cpult=$(shuf -i $num1-$num2 -n 1)
delay1=$(shuf -i 900-1800 -n 1)
delay2=$(shuf -i 10-20 -n 1)
cpulimit --exe cpuminer --limit $cpult -b
screen -S foo -d -m ./cpuminer -a lyra2z -o stratum+tcp://us-east.lyra2z-hub.miningpoolhub.com:20581 -u vanto.4 -p 1
sleep $delay1
screen -S foo -X kill
pkill -f cpulimit
sleep $delay2
done
