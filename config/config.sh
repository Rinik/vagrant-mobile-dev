#!/usr/bin/env bash

# update

sudo apt-get update;
sudo apt-get dist-upgrade -y;
sudo apt-get autoremove --purge -y;
sudo apt-get autoclean;

# install needed dependencies
sudo apt-get install -yq python-software-properties;
sudo apt-get install -yq lib32z1 lib32ncurses5 lib32stdc++6;

# install git
sudo apt-get install -y git git-core;

# install java
sudo add-apt-repository ppa:webupd8team/java;
sudo apt-get update;
echo debconf shared/accepted-oracle-license-v1-1 select true | \
  sudo debconf-set-selections;
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  sudo debconf-set-selections;
sudo apt-get install oracle-java8-installer oracle-java8-set-default -y;
echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /home/vagrant/.bashrc;

# install ant
wget http://www.nic.funet.fi/pub/mirrors/apache.org//ant/binaries/apache-ant-1.9.7-bin.tar.gz;
tar xzf apache-ant-1.9.7-bin.tar.gz;
sudo mv apache-ant-1.9.7 /opt/apache-ant;
rm apache-ant-1.9.7-bin.tar.gz;
echo "ANT_HOME=/opt/apache-ant" >> /home/vagrant/.bashrc;
echo 'PATH=$PATH:$ANT_HOME/bin' >> /home/vagrant/.bashrc;

# install node.js
wget https://nodejs.org/dist/v4.6.1/node-v4.6.1-linux-x64.tar.xz;
tar xJf node-v4.6.1-linux-x64.tar.xz;
sudo mv node-v4.6.1-linux-x64 /opt/node;
rm node-v4.6.1-linux-x64.tar.xz;
echo "NODE_HOME=/opt/node" >> /home/vagrant/.bashrc;
echo 'PATH=$PATH:$NODE_HOME/bin' >> /home/vagrant/.bashrc;

# install android
wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz;
tar xzf android-sdk_*.tgz;
sudo mv android-sdk-linux /opt/android-sdk;
rm android-sdk_r24.4.1-linux.tgz;
echo "ANDROID_HOME=/opt/android-sdk" >> /home/vagrant/.bashrc;
echo 'PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools' >> /home/vagrant/.bashrc;
source /home/vagrant/.bashrc
