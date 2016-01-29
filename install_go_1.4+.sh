#!/bin/bash

GOVERSION=$1
DIR="$HOME/go"

export GOROOT_BOOTSTRAP=$GVM_ROOT/gos/go1.4

source $GVM_ROOT/scripts/gvm

gvm install go$GOVERSION
gvm use go$GOVERSION --default

sed -i "s#export GVM_ROOT.*#export GVM_ROOT; GVM_ROOT=\"$HOME\"/.gvm#g" ~/.gvm/environments/default
sed -i "s#export GOPATH.*#export GOPATH; GOPATH=\"$DIR\"#g" ~/.gvm/environments/default
sed -i "s#export GOROOT.*#export GOROOT; GOROOT=\"$GOROOT_BOOTSTRAP\"#g" ~/.gvm/environments/default

echo "==================================="
echo "source ~/.bashrc"
echo "==================================="
