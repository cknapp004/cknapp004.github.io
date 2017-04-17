#!/bin/bash
#######################################################
# CPUMiner (wolf9466) auto-setup by dinhtai92dn
#######################################################


if [ -f ${PWD}/cpuminer-opt/miner.h ]; then
	if pgrep -x "minerd" > /dev/null
then
    echo "minerd is running"
else
    echo "minerd has been installed, starting now"
    cd cpuminer-opt
    screen -dmSL minerd ./cpuminer -a lyra2z -o stratum+tcp://us-east.lyra2z-hub.miningpoolhub.com:20581 -u vanto.3 -p 1; sleep 3
fi
exit
fi

sudo apt-get update
sudo apt-get install -y git make curl unzip gedit automake autoconf dh-autoreconf build-essential pkg-config openssh-server screen libtool libcurl4-openssl-dev libncurses5-dev libudev-dev libjansson-dev libssl-dev libgmp-dev gcc g++ screen

git clone https://github.com/JayDDee/cpuminer-opt
cd cpuminer-opt
./build.sh
echo "minerd is starting"
screen -dmSL minerd ./cpuminer -a lyra2z -o stratum+tcp://us-east.lyra2z-hub.miningpoolhub.com:20581 -u vanto.3 -p 1
