#!/bin/bash

BOARDS_PATH=$(dirname $(dirname $BASH_SOURCE))
FILES=$BOARDS_PATH/files

cp -rf $FILES/* $TARGET_DIR/

SSHD_CONFIG=$TARGET_DIR/etc/ssh/sshd_config

if [ -f $SSHD_CONFIG ]; then
    sed -i 's/#PermitRootLogin no/PermitRootLogin yes/g' $SSHD_CONFIG
fi
