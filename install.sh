#!/bin/bash

#set some defaults 
jport=true
jrunning=true
jinstalled=true
javainstalled=true
jrestart=false

#jenkins install check
jenkinsins=`apt list --installed jenkins`
if [[ $jenkinsins == *'jenkins'* ]]; then
  echo "Jenkins is installed!"
else
  jinstalled=false
fi

#java install check
javains=`apt list --installed default-jre`
if [[ $javains == *'default-jre'* ]]; then
  echo "java is installed!"
else
  javainstalled=false
fi

#check to see if jenkins is running
jenkins=`systemctl status jenkins`
if [[ $jenkins == *'Active: active'* ]]; then
  echo "Jenkins is running!"
else
  jrunning=false
fi

#port check
jport=`cat /etc/default/jenkins | grep "HTTP_PORT=8000"`
if [[ $jport == *'HTTP_PORT=8000'* ]]; then
  echo "Jenkins is on port 8000."
else
  jport=false
fi

#ok if everything validates, we are done here.
if [ $jport = true ] && [ $javainstalled = true ] && [ $jrunning = true ] && [ $jinstalled = true ]; then
  echo "All good!"
  exit
fi

#install java
if [ $javainstalled = false ]; then
  sudo apt-get -y install default-jre
fi

#install jenkins
if [ $jinstalled = false ]; then
  echo "Lets get Jenkins!"
  #if we do not have jenkins, download it.
  wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
  sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
  sudo apt-get update
  sudo apt-get -y install jenkins

  #change the port
  sudo sed -i 's/^HTTP_PORT=[[:digit:]]*/HTTP_PORT=8000/ig' /etc/default/jenkins
fi

#setup port
if [ $jport = false ]; then
  #change the port
  sed -i 's/^HTTP_PORT=[[:digit:]]*/HTTP_PORT=8000/ig' /etc/default/jenkins
  #restart jenkins if it is running
  if [ $jrunning == true ]; then
    `systemctl restart jenkins`
  fi
fi

#start jenkins 
if [ $jrunning = false ]; then
  sudo systemctl start jenkins
fi
