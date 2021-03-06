# ----------------------------------------------------------------------------
#
# Package			: xz
# Version			: 1.8
# Source repo		: https://git.tukaani.org/xz-java.git
# Tested on			: RHEL 7.6
# Script License	: Apache License Version 2.0
# Maintainer		: Sarvesh Tamba <sarvesh.tamba@ibm.com>
#
# Disclaimer: This script has been tested in root mode on given
# ==========  platform using the mentioned version of the package.
#             It may not work as expected with newer versions of the
#             package and/or distribution. In such case, please
#             contact "Maintainer" of this script.
#			  
# ----------------------------------------------------------------------------

#!/bin/bash

# install tools and dependent packages
#yum -y update
yum install -y git wget curl unzip nano vim make build-essential dos2unix
yum install -y ant

# setup java environment
yum install -y java java-devel
which java
ls /usr/lib/jvm/
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-ibm-1.8.0.6.5-1jpp.1.el7.ppc64le
# update the path env. variable 
export PATH=$PATH:$JAVA_HOME/bin

# create folder for saving logs 
mkdir -p /logs

# variables
PKG_NAME="xz"
PKG_VERSION=1.8
LOGS_DIRECTORY=/logs
LOCAL_DIRECTORY=/root
REPOSITORY="https://git.tukaani.org/xz-java.git"

# clone, build and test specified version
cd $LOCAL_DIRECTORY
git clone $REPOSITORY $PKG_NAME-$PKG_VERSION
cd $PKG_NAME-$PKG_VERSION/
git checkout -b $PKG_VERSION tags/v$PKG_VERSION
ant | tee $LOGS_DIRECTORY/$PKG_NAME-$PKG_VERSION.txt

# clone, build and test master
#cd $LOCAL_DIRECTORY
#git clone $REPOSITORY $PKG_NAME-master
#cd $PKG_NAME-master/
#ant | tee $LOGS_DIRECTORY/$PKG_NAME.txt
			