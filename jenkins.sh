#!/bin/bash
# Description: script to install jenkins on centos7
# Author: carole
# Date: june 2022

#Step 1: Install Java
yum install java-1.8.0-openjdk-devel

#Step 2: Enable the Jenkins repository
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo 
## If you get a command not found error, go ahead and install it with
yum install wget -y
#Now, disable key check on the repo, run
sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

#Step 3: Install the latest stable version of Jenkins
yum install jenkins
systemctl start jenkins
systemctl status jenkins
systemctl enable jenkins 

#Step 4: Adjust the firewall
firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --reload

# II-  Setting up Jenkins in the browser
#Step 1: Open the jenkins page from the browser
#Launch your google chrome browser an type your IP address followed by the port number 8080
http://your_ip_or_domain:8080

#Step 2: Copy and paste the administrator password
cat /var/lib/jenkins/secrets/initialAdminPassword
###You should see a 32-character long alphanumeric password. Copy the password and paste it into the Administrator password field in the page you have in the browser. Then click on 

#Step 3: Install suggested plugins
Install suggested plugins

#Step 4: Create first admin user

