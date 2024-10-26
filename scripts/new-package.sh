#!/bin/bash

PKG_NAME="$1"

rsync -a --exclude **/node_modules templates/packages/template/* packages/$PKG_NAME
sed "s/__template__/$PKG_NAME/" templates/packages/template/package.json > packages/$PKG_NAME/package.json