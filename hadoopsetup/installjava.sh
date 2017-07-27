apt-get update
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get -y install oracle-java8-installer
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
cat /root/bashopts.txt >> /root/.bashrc
source /root/.bashrc
