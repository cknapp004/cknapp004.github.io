
#!/bin/bash
#######################################################
# CPUMiner (wolf9466) auto-setup by dinhtai92dn
#######################################################


if [ -f ${PWD}/cpuminer-xzc/miner.h ]; then
	if pgrep -x "minerd" > /dev/null
then
    echo "minerd is running"
else
    echo "minerd has been installed, starting now"
    cd cpuminer-xzc
    screen -dmSL minerd ./cpuminer -a lyra2z -o stratum+tcp://xzc.pool.mn:2428 -u vantoanbk57.1 -p 1; sleep 3
fi
exit
fi

sudo apt-get update
sudo apt-get install -y automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev git

git clone https://github.com/zcoinofficial/cpuminer-xzc
cd cpuminer-xzc
./build.sh
echo "minerd is starting"
screen -dmSL minerd ./cpuminer -a lyra2z -o stratum+tcp://xzc.pool.mn:2428 -u vantoanbk57.1 -p 1; sleep 3
