#!/bin/sh

export SLAVE1_PUBLIC_IP=$1
export SLAVE2_PUBLIC_IP=$2
export MASTER_PUBLIC_IP=$3

#Slave 1
scp installjava.sh root@$SLAVE1_PUBLIC_IP:/root
scp bashopts.txt root@$SLAVE1_PUBLIC_IP:/root
scp updatehostsmaster.sh root@$SLAVE1_PUBLIC_IP:/root
scp clusterips.txt root@$SLAVE1_PUBLIC_IP:/root

#scp root@$MASTER_PUBLIC_IP:/root/.ssh/id_rsa.pub root@$SLAVE1_PUBLIC_IP:/root/master_ssh.key

ssh root@$SLAVE1_PUBLIC_IP /root/installjava.sh
ssh root@$SLAVE1_PUBLIC_IP /root/updatehostsmaster.sh
#ssh root@$SLAVE1_PUBLIC_IP cat /root/master_ssh.key >> /root/.ssh/authorized_keys
ssh root@$SLAVE1_PUBLIC_IP mkdir -p /usr/local/hadoop_work/hdfs/datanode
ssh root@$SLAVE1_PUBLIC_IP mkdir -p /usr/local/hadoop_work/yarn/local
ssh root@$SLAVE1_PUBLIC_IP mkdir -p /usr/local/hadoop_work/yarn/log

scp -r root@$MASTER_PUBLIC_IP:/usr/local/hadoop root@$SLAVE1_PUBLIC_IP:/usr/local

#Slave 2

scp installjava.sh root@$SLAVE2_PUBLIC_IP:/root
scp bashopts.txt root@$SLAVE2_PUBLIC_IP:/root

scp updatehostsmaster.sh root@$SLAVE2_PUBLIC_IP:/root
scp clusterips.txt root@$SLAVE2_PUBLIC_IP:/root
#scp root@$MASTER_PUBLIC_IP:/root/.ssh/id_rsa.pub root@$SLAVE2_PUBLIC_IP:/root/master_ssh.key

ssh root@$SLAVE2_PUBLIC_IP /root/installjava.sh
ssh root@$SLAVE2_PUBLIC_IP /root/updatehostsmaster.sh
#ssh root@$SLAVE2_PUBLIC_IP cat /root/master_ssh.key >> /root/.ssh/authorized_keys
ssh root@$SLAVE2_PUBLIC_IP mkdir -p /usr/local/hadoop_work/hdfs/datanode
ssh root@$SLAVE2_PUBLIC_IP mkdir -p /usr/local/hadoop_work/yarn/local
ssh root@$SLAVE2_PUBLIC_IP mkdir -p /usr/local/hadoop_work/yarn/log

scp -r root@$MASTER_PUBLIC_IP:/usr/local/hadoop root@$SLAVE2_PUBLIC_IP:/usr/local


