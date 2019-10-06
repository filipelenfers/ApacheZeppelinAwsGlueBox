#!/bin/bash

cd /vagrant

#create jdk directory 
mkdir /opt/jdk
#uncompress, change to your file name 
echo "Uncompressing Java..."
tar -zxf deps/jdk-7u80-linux-x64.tar.gz -C /opt/jdk
echo "Done."

#update alternatives so the command java point to the new jdk 
echo "Setting up java and java to use JDK7..."
update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.7.0_80/bin/java 9999
#update alternatives so the command javac point to the new jdk 
update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.7.0_80/bin/javac 9999
echo "Done."

#check if java command is pointing to our new jdk
update-alternatives --display java
#check if java command is pointing to our new jdk
update-alternatives --display javac
#check if java is in the correct version
java -version