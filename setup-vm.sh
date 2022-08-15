#!/usr/bin/env bash
#
# Installing backstage.io
#
set -eo pipefail

# Define versions
NODE_VER=16
NVM_VER=0.39.1
YARN_VER=1.22.10

cd /home/ubuntu
touch ~/.bashrc
rm -rf ~/.nvm
export NVM_DIR=
export NODE_OPTIONS="--max-old-space-size=8192"

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VER/install.sh | bash
source ~/.nvm/nvm.sh

echo "######Installing node js version $NODE_VER########"
nvm install $NODE_VER
nvm alias default $NODE_VER
nvm use default

echo "########Installing Yarn package manager"
rm -rf ~/.yarn
curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version $YARN_VER

echo "######## Adding Yarn to environment path ########"
export PATH="$HOME/.yarn/bin:$PATH"
yarn config set prefix ~/.yarn -g

source ~/.bashrc

sudo apt-get update

https://github.com/b9-io/test-demo.git

yarn add --cwd packages/app @backstage/plugin-techdocs

yarn dev
