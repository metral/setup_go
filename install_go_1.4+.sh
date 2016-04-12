#!/bin/bash

EXPECTEDARGS=1
if [ $# -lt $EXPECTEDARGS ]; then
    echo "Usage: $0 <GO_VERSION>"
    echo "i.e: $0 1.6"
    exit 0
fi

GOVERSION=$1
DIR="$HOME/go"

export GOROOT_BOOTSTRAP=$GVM_ROOT/gos/go1.4
export NEW_GOROOT=$GVM_ROOT/gos/go$GOVERSION

source $GVM_ROOT/scripts/gvm

gvm install go$GOVERSION
gvm use go$GOVERSION --default

sed -i "s#export GVM_ROOT.*#export GVM_ROOT; GVM_ROOT=\"$HOME\"/.gvm#g" ~/.gvm/environments/default
sed -i "s#export GOPATH.*#export GOPATH; GOPATH=\"$DIR\"#g" ~/.gvm/environments/default
sed -i "s#export GOROOT.*#export GOROOT; GOROOT=\"$NEW_GOROOT\"#g" ~/.gvm/environments/default

echo "==================================="
echo "source ~/.bashrc"
echo "==================================="
