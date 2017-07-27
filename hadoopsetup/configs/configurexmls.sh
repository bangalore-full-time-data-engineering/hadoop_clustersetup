#!/bin/sh

export HADOOP_MASTER_IP=$1
scp core-site.xml root@$HADOOP_MASTER_IP:/usr/local/hadoop/etc/hadoop
scp hdfs-site.xml root@$HADOOP_MASTER_IP:/usr/local/hadoop/etc/hadoop
scp mapred-site.xml root@$HADOOP_MASTER_IP:/usr/local/hadoop/etc/hadoop
scp yarn-site.xml root@$HADOOP_MASTER_IP:/usr/local/hadoop/etc/hadoop
scp masters root@$HADOOP_MASTER_IP:/usr/local/hadoop/etc/hadoop
scp slaves root@$HADOOP_MASTER_IP:/usr/local/hadoop/etc/hadoop

ssh root@$HADOOP_MASTER_IP /usr/local/hadoop/bin/hadoop namenode -format
