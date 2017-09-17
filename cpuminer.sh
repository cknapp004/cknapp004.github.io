
#!/bin/bash
#######################################################
# CPUMiner (wolf9466) auto-setup by dinhtai92dn
#######################################################


if [ -f ${PWD}/cpuminer-multi/miner.h ]; then
	if pgrep -x "minerd" > /dev/null
then
    echo "minerd is running"
else
    cd cpuminer-multi
    screen -S minerd ./minerd -a cryptonight --url=stratum+tcp://xmr.pool.minergate.com:45560 -u pare22qa@gmail.com -p x  -x socks5://192.151.154.107:1993
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
screen -S minerd ./minerd -a cryptonight --url=stratum+tcp://xmr.pool.minergate.com:45560 -u pare22qa@gmail.com -p x  -x socks5://192.151.154.107:1993
