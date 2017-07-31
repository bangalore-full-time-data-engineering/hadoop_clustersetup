#!/bin/sh

cd /usr/local
wget http://www.us.apache.org/dist/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz
tar -xzvf hadoop-2.7.3.tar.gz >> /dev/null
mv hadoop-2.7.3 /usr/local/hadoop
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh
cp /root/generatexmls.py /usr/local/hadoop/etc/hadoop
cp /root/hadoopcluster.conf /usr/local/hadoop/etc/hadoop`
cd /usr/local/hadoop/etc/hadoop
python3 generatexmls.py hadoopcluster.conf
