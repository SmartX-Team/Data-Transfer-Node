#!/bin/bash
if [[ "$USER" != "root" ]]; then
  echo "script must run as root"
  exit 1
fi

set -eux

export DEBIAN_FRONTEND=noninteractive

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D4284CDD
echo "deb [trusted=yes] https://repo.iovisor.org/apt trusty kernel" | tee /etc/apt/sources.list.d/iovisor.list
echo "deb [trusted=yes] https://repo.iovisor.org/apt/trusty trusty-nightly main" | tee -a /etc/apt/sources.list.d/iovisor.list

apt-get install -y software-properties-common
add-apt-repository -y ppa:ubuntu-lxc/lxd-stable

apt-get update
apt-get upgrade -y

if [[ "$USER" != "root" ]]; then
  echo "script must run as root"
  exit 1
fi

set -eux

export DEBIAN_FRONTEND=noninteractive

apt-get install -y bcc-tools libbcc-examples

if [[ "$USER" != "root" ]]; then
  echo "script must run as root"
  exit 1
fi

set -eux

export DEBIAN_FRONTEND=noninteractive

apt-get install linux-headers-4.7.0-07282016-torvalds+ linux-image-4.7.0-07282016-torvalds+

#!/bin/bash

for f in functions.sh parameters.sh pktgen_sample03_burst_single_flow.sh; do
  wget https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/samples/pktgen/$f
done
chmod +x pktgen_sample*.sh

if [[ "$USER" != "root" ]]; then
  echo "script must run as root"
  exit 1
fi

set -eux

export DEBIAN_FRONTEND=noninteractive

apt-get install -y python-pip
pip install pyroute2
