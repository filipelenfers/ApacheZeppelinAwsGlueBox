#!/bin/bash

cd /vagrant

#uncompress zeppelin to user home
tar xf deps/zeppelin-0.7.3-bin-all.tgz -C /home/vagrant

#Copy configuration file already adjusted to AWS Glue needs
cp -f deps/interpreter.json /home/vagrant/zeppelin-0.7.3-bin-all/conf/interpreter.json

#Change owner to vagrant user
chown vagrant -R /home/vagrant/zeppelin-0.7.3-bin-all/

#Add start&stop scripts to path
ln -s /vagrant/scripts/startZeppelin.sh /usr/local/bin/startZeppelin
ln -s /vagrant/scripts/stopZeppelin.sh /usr/local/bin/stopZeppelin
