#!/bin/bash

PACKAGE_TEMPLATE_PATH="monorepo-management/templates/package"

MONOREPO_NAME="$(<monorepo-management/constants/MONOREPO_NAME)"

# Ask for package name (if not provided)

if [[ -z "$1" ]]; then
    read -p "Package name: " PACKAGE_NAME
else
    PACKAGE_NAME="$1"
fi

# Validate package name

if [[ -z "$PACKAGE_NAME" ]]; then
    echo "Error: Package name must be provided."
    exit 1
fi

if echo "$PACKAGE_NAME" | grep -q " "; then
    echo "Error: Package name contains spaces."
    exit 1
fi

# Copy and replace templates

rsync -a \
    --exclude **/node_modules \
    $PACKAGE_TEMPLATE_PATH/* packages/$PACKAGE_NAME

sed \
    -e "s/__PACKAGE_NAME__/$PACKAGE_NAME/" \
    -e "s/__MONOREPO_NAME__/$MONOREPO_NAME/" \
    $PACKAGE_TEMPLATE_PATH/package.json >packages/$PACKAGE_NAME/package.json
