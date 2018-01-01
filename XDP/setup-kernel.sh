git clone https://github.com/iovisor/xdp-vagrant
cd xdp-vagrant
vagrant up
# note that some apt errors above are expected
vagrant ssh
uname -r
# confirm that the running kernel is something like 4.7.0-07282016-torvalds+

vagrant@vagrant-ubuntu-trusty-64:~$ ip -4 a
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    inet 192.168.121.153/24 brd 192.168.121.255 scope global eth0
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    inet 192.168.50.4/24 brd 192.168.50.255 scope global eth1


./setup-pktgen.sh
MAC=ETH1_MAC_INSIDE_THE_VM
IP=ETH1_IP_INSIDE_THE_VM
VNET=TAP_DEVICE_OF_ETH1_OUTSIDE_THE_VM
sudo ./pktgen_sample03_burst_single_flow.sh -i $VNET -d $IP -m $MAC -t 1 -b 1 -c 0
