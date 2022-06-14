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
echo"Launch your google chrome browser an type your IP address followed by the port number 8080"
#http://your_ip_or_domain:8080

#Step 2: Copy and paste the administrator password
cat /var/lib/jenkins/secrets/initialAdminPassword
echo "Copy the password and paste it into the Administrator password field in the page you have in the browser. Then click on continue"


#Step 3: Install suggested plugins
echo "click on install suggested plugins"

#Step 4: Create first admin user and password
#When the installation will be completed, you will get a form to create the First Admin User. Fill out the form an validate on Save and Continue
#E-mail address: use your own email address
#Step 5: Instance Configuration
#On the next page you will need to set the URL for the Jenkins instance. The Jenkins URL field will come with a default  value (automatically generated). Just click on Save and Finish 

echo "Jenkins is now ready for use! Click on Start using Jenkins button and you will be automatically be redirected to the Jenkins dashboard"
