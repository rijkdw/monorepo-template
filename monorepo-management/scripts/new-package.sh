#!/bin/bash

PACKAGE_NAME="$1"
MONOREPO_NAME="$(< monorepo-management/constants/MONOREPO_NAME)"

PACKAGE_TEMPLATE_PATH="monorepo-management/templates/package"

echo $MONOREPO_NAME

rsync -a \
    --exclude **/node_modules \
    $PACKAGE_TEMPLATE_PATH/* packages/$PACKAGE_NAME

sed \
    -e "s/__PACKAGE_NAME__/$PACKAGE_NAME/" \
    -e "s/__MONOREPO_NAME__/$MONOREPO_NAME/" \
    $PACKAGE_TEMPLATE_PATH/package.json > packages/$PACKAGE_NAME/package.json
