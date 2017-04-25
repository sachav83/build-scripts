# ----------------------------------------------------------------------------
#
# Package       : pdfkit
# Version       : v0.8.0
# Source repo   : https://github.com/devongovett/pdfkit
# Tested on     : rhel_7.3
# Script License: Apache License, Version 2 or later
# Maintainer    : Priya Seth <sethp@us.ibm.com>
#
# Disclaimer: This script has been tested in non-root mode on given
# ==========  platform using the mentioned version of the package.
#             It may not work as expected with newer versions of the
#             package and/or distribution. In such case, please
#             contact "Maintainer" of this script.
#
# ----------------------------------------------------------------------------

#!/bin/bash

#Install Dependencies
if [ ! -d ~/.nvm ]; then
     sudo yum update -y
     sudo yum groupinstall 'Development Tools' -y
     sudo yum install -y openssl-devel.ppc64le curl git
     sudo curl https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh| bash
fi

source ~/.nvm/nvm.sh
if [ `nvm list | grep -c "v7.4.0"` -eq 0 ]
then

        nvm install v7.4.0
fi

nvm use v7.4.0


#Build and test pdfkit package
git clone https://github.com/devongovett/pdfkit
cd pdfkit
npm install
#npm test //There are no test cases
