#!/bin/sh

cd /usr/local/
wget https://www.apache.org/dist/hive/stable-2/apache-hive-2.1.1-bin.tar.gz
tar -xzvf apache-hive-2.1.1-bin.tar.gz >> /dev/null
mv apache-hive-2.1.1-bin /usr/local/hive
rm apache-hive-2.1.1-bin.tar.gz

cp /usr/local/hive/conf/hive-env.sh.template /usr/local/hive/conf/hive-env.sh

