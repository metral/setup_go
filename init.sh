#!/bin/bash

DIR="$HOME/go"
GOVERSION=1.4

mkdir $DIR > /dev/null 2>&1
#echo "export GOPATH=\$(pwd):\$(pwd)/vendor" > ~/gbimports
#echo "ln -f -s linux-amd64/ pkg/linux-amd64" >> ~/gbimports
export CGO_ENABLED=0
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

source $HOME/.gvm/scripts/gvm

gvm install go$GOVERSION -B
gvm use go$GOVERSION

echo "export PATH=\$PATH:$HOME/go/bin" >> ~/.bashrc
echo "source $HOME/.gvm/scripts/gvm" >> ~/.bashrc

echo "==================================="
echo "source ~/.bashrc"
echo "==================================="

#[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
source ~/.bashrc

#go get github.com/constabulary/gb/...
vim +GoInstallBinaries +qall now > /dev/null 2>&1
