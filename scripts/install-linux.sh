#! /bin/bash

. ./scripts/install.sh

install_unity
ln -s /opt/Unity/Editor/Unity /usr/bin/unity
unity -quit -batchmode -nographics -logfile -createManualActivationFile || true
