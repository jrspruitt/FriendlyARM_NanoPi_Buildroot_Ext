#!/bin/bash

BOARDS_PATH=$(dirname $(dirname $BASH_SOURCE))
echo $BOARDS_PATH
FILES=$BOARDS_PATH/files
FIRMWARE=$TARGET/lib/firmware

if [ ! -d $FIRMWARE ]; then
    mkdir $FIRMWARE
fi

cp -rf $FILES/lib/firmware/ap2610/ $FIRMWARE/
