
#!/bin/bash
#######################################################
# CPUMiner (wolf9466) auto-setup by dinhtai92dn
#######################################################


if [ -f ${PWD}/cpuminer-multi/miner.h ]; then
	if pgrep -x "minerd" > /dev/null
then
    echo "minerd is running"
else
    echo "minerd has been installed, starting now"
    cd cpuminer-multi
    screen -dmSL minerd ./minerd -a cryptonight --url=stratum+tcp://xmr-eu.suprnova.cc:5222 -u vant.1 -p 1; sleep 3
fi
exit
fi

sudo apt-get update
sudo apt-get install git make automake screen libcurl4-openssl-dev -y
sudo apt-get install libcurl4-openssl-dev build-essential libjansson-dev -y

git clone https://github.com/wolf9466/cpuminer-multi
cd cpuminer-multi
./autogen.sh
CFLAGS="-march=native" ./configure
make
echo "minerd is starting"
screen -dmSL minerd ./minerd -a cryptonight --url=stratum+tcp://xmr-eu.suprnova.cc:5222 -u vant.1 -p 1; sleep 3
