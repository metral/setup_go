#!/bin/bash

GOVERSION=$1
export GOROOT_BOOTSTRAP=$GVM_ROOT/gos/go1.4
gvm install go$GOVERSION
sleep 2
gvm use go$GOVERSION --default
