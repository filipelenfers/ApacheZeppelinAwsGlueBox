#!/bin/bash

cd /vagrant

#uncompress zeppelin to user home
echo "Uncopressing Apache Zeppelin..."
tar xf deps/zeppelin-0.7.3-bin-all.tgz -C /home/vagrant
echo "Done."

#Copy configuration file already adjusted to AWS Glue needs
echo "Applying configs for AWS Glue..."
cp -f deps/interpreter.json /home/vagrant/zeppelin-0.7.3-bin-all/conf/interpreter.json
echo "Done."

#Change owner to vagrant user
echo "Changing permissions to vagrant user..."
chown vagrant -R /home/vagrant/zeppelin-0.7.3-bin-all/
echo "Done."

#Add start&stop scripts to path
echo "Creating startZeppelon && stopZeppelin..."
ln -s /vagrant/scripts/startZeppelin.sh /usr/local/bin/startZeppelin
ln -s /vagrant/scripts/stopZeppelin.sh /usr/local/bin/stopZeppelin
echo "Done."