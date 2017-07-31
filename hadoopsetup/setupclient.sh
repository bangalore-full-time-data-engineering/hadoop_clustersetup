#!/bin/sh

export HADOOP_CLIENT_IP=$1
export HADOOP_MASTER_IP=$2

scp installjava.sh root@$HADOOP_CLIENT_IP:/root
scp cluster.txt root@HADOOP_CLIENT_IP:/root
scp client.txt root@$HADOOP_CLIENT_IP:/root
scp setupssh.sh root@$HADOOP_CLIENT_IP:/root
scp bashopts.txt root@$HADOOP_CLIENT_IP:/root
scp updatehostsclient.sh root@$HADOOP_CLIENT_IP:/root

ssh root@$HADOOP_CLIENT_IP /root/installjava.sh
ssh root@$HADOOP_CLIENT_IP /root/updatehostsclient.sh
ssh root@$HADOOP_CLIENT_IP /root/setupssh.sh

scp root@$HADOOP_MASTER_IP:/root/.ssh/id_rsa.pub master_ssh.key
ssh root@$HADOOP_CLIENT_IP 'cat root@$HADOOP_CLIENT_IP:/root/ master_ssh.key >> root@$HADOOP_CLIENT_IP:/root/.ssh/authorized_keys'
scp -r root@$HADOOP_MASTER_IP:/usr/local/hadoop root@$HADOOP_CLIENT_IP:/usr/local
