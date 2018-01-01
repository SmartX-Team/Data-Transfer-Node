# On both servers, add the appropriate BeeGFS repositories:
wget -o /etc/yum.repos.d/beegfs-rhel7.repo http://www.beegfs.com/release/beegfs_2015.03/dists/beegfs-rhel7.repo

#  Install the three services as root:
apt-get install beegfs-mgmtd   # Management service
apt-get install beegfs-meta    # Metadata service
apt-get install beegfs-storage # Storage service

# beegfs-client kernel module has to be built against the OFED ibverbs library.
# For MLNX_OFED, the buildArgs configuration variable in
# /etc/beegfs/beegfs-client-autobuild.conf has to be modified as follows:
buildArgs=-j8 BEEGFS_OPENTK_IBVERBS=1 OFED_INCLUDE_PATH=/usr/src/ofa_kernel/default/include/

# and rebuild the kernel module
/etc/init.d/beegfs-client rebuild

# Configure services on the server.
/opt/beegfs/sbin/beegfs-setup-mgmtd -p /home/netcs/Desktop/BeeGFS
/opt/beegfs/sbin/beegfs-setup-meta -p /home/netcs/Desktop/BeeGFS -s 1 -m 11.11.11.5
/opt/beegfs/sbin/beegfs-setup-storage -p /home/netcs/Desktop/BeeGFS -s 1 -i 2 -m 11.11.11.5

# Start services on the server node:
/etc/init.d/beegfs-mgmtd start
/etc/init.d/beegfs-meta start
/etc/init.d/beegfs-storage start
