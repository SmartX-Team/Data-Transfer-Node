# On both servers, add the appropriate BeeGFS repositories:
wget -o /etc/yum.repos.d/beegfs-rhel7.repo http://www.beegfs.com/release/beegfs_2015.03/dists/beegfs-rhel7.repo

# Install the following tools on the client node:
apt-get install beegfs-client
apt-get install beegfs-helperd
apt-get install beegfs-utils

# beegfs-client kernel module has to be built against the OFED ibverbs library.
# For MLNX_OFED, the buildArgs configuration variable in
# /etc/beegfs/beegfs-client-autobuild.conf has to be modified as follows:
buildArgs=-j8 BEEGFS_OPENTK_IBVERBS=1 OFED_INCLUDE_PATH=/usr/src/ofa_kernel/default/include/

# and rebuild the kernel module
/etc/init.d/beegfs-client rebuild

# Set up the client and start service on the client:
/opt/beegfs/sbin/beegfs-setup-client -m 11.11.11.5
/etc/init.d/beegfs-helperd start
/etc/init.d/beegfs-client start
