#!/bin/bash

DIR="$HOME/go"
GOVERSION=1.4

mkdir $DIR
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

source $HOME/.gvm/scripts/gvm

gvm install go$GOVERSION
gvm use go$GOVERSION --default

sed -i "s#export GVM_ROOT.*#export GVM_ROOT; GVM_ROOT=\"$HOME\"/.gvm#g" ~/.gvm/environments/default
sed -i "s#export GOPATH.*#export GOPATH; GOPATH=\"$DIR\"#g" ~/.gvm/environments/default

echo "export PATH=\$PATH:$HOME/go/bin" >> ~/.bashrc

echo "==================================="
echo "source ~/.bashrc"
echo "==================================="

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
go get github.com/constabulary/gb/...
vim +GoInstallBinaries +qall now > /dev/null 2>&1
