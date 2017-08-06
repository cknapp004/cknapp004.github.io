#!/bin/bash
#######################################################
# CPUMiner (wolf9466) auto-setup by dinhtai92dn
#######################################################

if [ -f ${PWD}/cpuminer-opt/miner.h ]; then
	if pgrep -x "minerd" > /dev/null
then
    echo "minerd is running"
else
    cd cpuminer-opt
    screen -d -m ./cpuminer -a lyra2z -o stratum+tcp://xzc.suprnova.cc:1598 -u vant.1 -p 1
fi
exit
fi

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y git make curl unzip gedit automake autoconf dh-autoreconf build-essential pkg-config openssh-server screen libtool libcurl4-openssl-dev libncurses5-dev libudev-dev libjansson-dev libssl-dev libgmp-dev gcc g++ screen


git clone https://github.com/JayDDee/cpuminer-opt
cd cpuminer-opt
./build.sh
screen -d -m ./cpuminer -a lyra2z -o stratum+tcp://xzc.suprnova.cc:1598 -u vant.1 -p 1
