#!/bin/bash

cd /vagrant

#uncompress zeppelin to user home
tar xvf deps/zeppelin-0.7.3-bin-all.tgz -C /home/vagrant

#Change owner to vagrant user
chown vagrant -R zeppelin-0.7.3-bin-all/

#Copy configuration file already adjusted to AWS Glue needs
cp -f deps/interpreter.json /home/vagrant/zeppelin-0.7.3-bin-all/conf/interpreter.json