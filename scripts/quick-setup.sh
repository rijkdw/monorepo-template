#!/bin/bash

DESTINATION=$1

if [ -z $DESTINATION ]; then
    echo "No destination set, exiting."
    exit
fi

echo "Duplicating the monorepo template to $DESTINATION..."
rsync -a --exclude="**/node_modules" --exclude=".git" . "$DESTINATION" > /dev/null

cd "$DESTINATION"

echo "Installing dependencies..."
pnpm i > /dev/null
echo "Initializing git..."
git init > /dev/null

echo "Done."