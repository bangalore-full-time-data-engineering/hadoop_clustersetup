#!/bin/sh

export HADOOP_CLIENT_IP=$1


cd /usr/local
wget http://www-us.apache.org/dist/pig/pig-0.16.0/pig-0.16.0.tar.gz
tar -xzvf pig-0.16.0.tar.gz >> /dev/null
mv pig-0.16.0 /usr/local/pig
rm pig-0.16.0.tar.gz

scp pigsettings.txt root@$HADOOP_CLIENT_IP:/root
ssh root@$HADOOP_CLIENT_IP 'cat pigsettings.txt >> /root/.bashrc'
ssh root@$HADOOP_CLIENT_IP source .bashrc
