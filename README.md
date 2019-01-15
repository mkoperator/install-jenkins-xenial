# Install/Update/Validate Jenkins Install on Ubuntu 16.04

### Run Now (Live Dangerously)
 curl https://raw.githubusercontent.com/thecrazyrussian/install-jenkins-xenial/master/install.sh | sh -
 
### Run Manually (Download and Run)
 git clone git@github.com:thecrazyrussian/install-jenkins-xenial.git
 sudo ./install-jenkins-xenial/install.sh

### Run Automatically (Automated - Keep things in compliance)
 git clone git@github.com:thecrazyrussian/install-jenkins-xenial.git
 sudo mv install-jenkins-xenial/install.sh /etc/cron.hourly/install.sh
 

### Requirements
(a) The solution must run on a clean installation of the chosen operating system without errors.
(b) Jenkins and its prerequisites must be installed without manual intervention.
(c) Jenkins must be configured to serve requests over port 8000.
(d) Subsequent applications of the solution should not cause failures or repeat redundant configuration tasks
 
### Assumptions
 1. host system is an Ubuntu 16.04
 2. You have sudo or root access 
 3. You are ok with using the latest copy of Jenkins
 
### Hurtles and Challanges
The hardest part was making sure nothing is done if everything is in compliant state, this is where using a tool like Puppet of Chef would have saved me lots of time. 

### Requirement (d)
This requiremnet ensures that we can run this as a compliance script that can run on an operating system and keep it as well as bring it into compliance.

### Assessement Steps
The script goes through checking if Jenkins is installed and running on port 8000, otherwise trigger the step by step validation. First, validate dependencies. Then validate Jenkins install and port. Finally run Jenkins. Trigger an error if something deos not run properly.

### Automation
Automation is something that I have worked on since getting into professional software development. From both from an operating and development stand points mean more time. More time for solving problems, more time for testing, and more time for anything but redoing the same thing over and over. It has many benefits but the biggest being: cost savings over time, better code, and better availability.
The cost savings come from not having to repeat your steps more than once. This is true of both deploying code and automating server setup on scalable or highly available systems. Better code qualitfy of your configuration and application scripts results from coding them for automation that requires that it can be run repeatedly. Better availability happens from repeatability. 
Through my career and experience I can honestly say that for anything that needs to be scaled beyond one implmentation, whether that be a server or number of developers, automation is crucial. Not implementing it from the beginning just ends up costing more later.



