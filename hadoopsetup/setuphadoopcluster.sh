#!/bin/sh

echo "Welcome to Hadoop Cluster Setup"
export HADOOP_CONFFILENAME=$1

declare -a hadoopconfs
count=0

while read -r line; 
do
	for word in $line;
    	do
		read value <<< $(echo $word | awk '{print $1}')  
		hadoopconfs[$count]=$value
		count=$count+1
    	done
done < $HADOOP_CONFFILENAME

#Hadoop Master Details
export HADOOP_MASTER_HOSTNAME=${hadoopconfs[1]}
export HADOOP_MASTER_PUBLIC_IP=${hadoopconfs[2]}
export HADOOP_MASTER_PRIVATE_IP=${hadoopconfs[3]}
echo $HADOOP_MASTER_HOSTNAME $HADOOP_MASTER_PUBLIC_IP $HADOOP_MASTER_PRIVATE_IP

#Hadoop Client Details
export HADOOP_CLIENT_HOSTNAME=${hadoopconfs[5]}
export HADOOP_CLIENT_PUBLIC_IP=${hadoopconfs[6]}
export HADOOP_CLIENT_PRIVATE_IP=${hadoopconfs[7]}
echo $HADOOP_CLIENT_HOSTNAME $HADOOP_CLIENT_PUBLIC_IP $HADOOP_CLIENT_PRIVATE_IP

#Hadoop Slave1 Details
export HADOOP_SLAVE1_HOSTNAME=${hadoopconfs[9]}
export HADOOP_SLAVE1_PUBLIC_IP=${hadoopconfs[10]}
export HADOOP_SLAVE1_PRIVATE_IP=${hadoopconfs[11]}
echo $HADOOP_SLAVE1_HOSTNAME $HADOOP_SLAVE1_PUBLIC_IP $HADOOP_SLAVE1_PRIVATE_IP

#Hadoop Slave2 Details
export HADOOP_SLAVE2_HOSTNAME=${hadoopconfs[9]}
export HADOOP_SLAVE2_PUBLIC_IP=${hadoopconfs[10]}
export HADOOP_SLAVE2_PRIVATE_IP=${hadoopconfs[11]}
echo $HADOOP_SLAVE2_HOSTNAME $HADOOP_SLAVE2_PUBLIC_IP $HADOOP_SLAVE2_PRIVATE_IP

# Generate /etc/hosts file
echo $HADOOP_MASTER_PRIVATE_IP $HADOOP_MASTER_HOSTNAME >> cluster.txt
echo $HADOOP_SLAVE1_PRIVATE_IP $HADOOP_SLAVE1_HOSTNAME >> cluster.txt
echo $HADOOP_SLAVE2_PRIVATE_IP $HADOOP_SLAVE2_HOSTNAME >> cluster.txt

echo $HADOOP_CLIENT_PRIVATE_IP $HADOOP_CLIENT_HOSTNAME >> client.txt

#Setup Master

./setupmaster.sh $HADOOP_MASTER_PUBLIC_IP

./setupclient.sh $HADOOP_CLIENT_PUBLIC_IP $HADOOP_MASTER_PUBLIC_IP

./setupslave.sh $HADOOP_SLAVE1_PUBLIC_IP $HADOOP_SLAVE2_PUBLIC_IP $HADOOP_MASTER_PUBLIC_IP
