#!/bin/bash

PKG_NAME="$1"

cp -r packages/__template packages/$PKG_NAME
sed "s/__template/$PKG_NAME/" packages/__template/package.json > packages/$PKG_NAME/package.json