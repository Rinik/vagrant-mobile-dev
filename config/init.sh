#!/usr/bin/env bash

# update node, install cordova, ionic and needed tools
sudo npm install -g npm;
sudo npm install -g minimatch;
sudo npm install -g cordova ionic phonegap;
sudo npm install -g bower gulp;

# update android
sudo android list sdk --no-ui --all --extended
sudo android update sdk -u -a --filter "tools,platform-tools,build-tools-25.2.2,build-tools-24.0.2";
sudo android update sdk -u -a --filter "android-24,android-23,android-22,android-21";

# install android device
sudo android update sdk -u -a --filter "sys-img-armeabi-v7a-android-24";
sudo android list targets;
sudo android create avd \
--name cordovadroid --target android-24 --abi default/armeabi-v7a;

# fix some folder user rights
sudo chown vagrant:vagrant /home/vagrant/.android/ -R;
