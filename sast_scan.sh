#!/bin/sh

sudo rm -r reports
git_repo=${1:-https://github.com/bridgecrewio/terragoat.git}
echo $git_repo
git clone $git_repo code_repo
sudo docker run --rm -e "WORKSPACE=${PWD}" -e "ENABLE_OSS_RISK=true" -e "FETCH_LICENSE=true" -e "CREDSCAN_DEPTH=5" -v $PWD:/app shiftleft/sast-scan scan --build
sudo rm -rf code_repo
