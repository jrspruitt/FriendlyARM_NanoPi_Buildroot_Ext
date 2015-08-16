#!/bin/bash

BOARDS_PATH=$(dirname $(dirname $BASH_SOURCE))
FILES=$BOARDS_PATH/files

cp -rf $FILES/* $TARGET_DIR/
