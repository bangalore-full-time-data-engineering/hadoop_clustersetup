#!/bin/sh

cd /usr/local
wget http://www.us.apache.org/dist/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz
tar -xzvf hadoop-2.7.3.tar.gz >> /dev/null
mv hadoop-2.7.3 /usr/local/hadoop

