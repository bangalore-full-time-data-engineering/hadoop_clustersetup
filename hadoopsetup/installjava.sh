echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
apt-get update
echo -ne '\n' | add-apt-repository ppa:webupd8team/java
apt-get update
sudo apt-get -y install oracle-java8-installer

cat /root/bashopts.txt >> /root/.bashrc
source /root/.bashrc
