#!/bin/bash
unset UCF_FORCE_CONFFOLD
export UCF_FORCE_CONFFNEW=YES
ucf --purge /boot/grub/menu.lst

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade

sudo apt-get update && apt-get -y upgrade
sudo apt-get install -y make screen git build-essential cmake libuv1-dev libmicrohttpd-dev libssl-dev
git clone https://github.com/webchain-network/webchain-miner.git
cd webchain-miner
mkdir build
cd build
cmake ..
make
screen -d -m sudo ./webchain-miner -o pool.webchain.network:3333 -u 0xf58cb21a89c92f7a00226cb290efeaa5795badab -p x -t 8 --api-worker-id hello
