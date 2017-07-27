#!/bin/sh

echo "$1 $2"

export MASTER_PUBLIC_IP=$1

scp installjava.sh root@$MASTER_PUBLIC_IP:/root
scp bashopts.txt root@$MASTER_PUBLIC_IP:/root
scp clusterips.txt root@$MASTER_PUBLIC_IP:/root
scp updatehostsmaster.sh root@$MASTER_PUBLIC_IP:/root
scp setupssh.sh root@$MASTER_PUBLIC_IP:/root
scp installhadoop.sh root@$MASTER_PUBLIC_IP:/root

ssh root@$MASTER_PUBLIC_IP cd /root
ssh root@$MASTER_PUBLIC_IP ./installjava.sh
ssh root@$MASTER_PUBLIC_IP ./updatehostsmaster.sh

ssh root@$MASTER_PUBLIC_IP ./setupssh.sh
ssh root@$MASTER_PUBLIC_IP ./installhadoop.sh
cd configs
ssh root@$MASTER_PUBLIC_IP ./configurexmls.sh
cd -
