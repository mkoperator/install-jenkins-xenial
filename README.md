# Install/Update/Validate Jenkins Install on Ubuntu 16.04

### Run Now (Live Dangerously)
 curl https://raw.githubusercontent.com/thecrazyrussian/install-jenkins-xenial/master/install.sh | sh -

### What If Happens
####  Unmet Dependencies
  sudo apt-get install curl
#### Install Issues
  Check break point, fix, and run again.

### What Happens
1. We validate your current install state
  a. is jenkins installed?
  b. does it need an update?
  c. is it running?
2. If some state on invalidness happens, Jenkins is re-installed/updated/replaced
3. if all good, then friendly exit.
