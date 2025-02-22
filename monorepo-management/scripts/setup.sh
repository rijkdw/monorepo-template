#!/bin/bash

# ---------------------------------------------------------------------------------
# Helper functions
# ---------------------------------------------------------------------------------

confirm() {
    echo -n "Continue? (y/n): "
    read RESPONSE
    RESPONSE="$(echo $RESPONSE | tr '[:upper:]' '[:lower:]')"
    if [[ -z "$RESPONSE" || "$RESPONSE" == "y" || "$RESPONSE" == "yes" ]]; then
        return 0
    else
        return 1
    fi
}

# ---------------------------------------------------------------------------------
# Pre-requisites
# ---------------------------------------------------------------------------------

echo "Installing dependencies with pnpm..."
pnpm install

# ---------------------------------------------------------------------------------
# Get monorepo name
# ---------------------------------------------------------------------------------

echo
echo -n "Monorepo name: "
read MONOREPO_NAME

if [[ -z "$MONOREPO_NAME" ]]; then
    echo "Error: Package name must be provided."
    exit 1
fi

if echo "$MONOREPO_NAME" | grep -q " "; then
    echo "Error: Package name contains spaces."
    exit 1
fi

echo
echo "Apps' and packages' names will be prefixed with \"@$MONOREPO_NAME/\" e.g."
echo "  @$MONOREPO_NAME/utils"
echo "  @$MONOREPO_NAME/web"
echo "  @$MONOREPO_NAME/api"
echo

if confirm; then
    echo "Thanks for confirming! Let's configure your monorepo."
else
    echo "Cancelling project setup..."
    exit 1
fi

# ---------------------------------------------------------------------------------
# Set up monorepo configuration
# ---------------------------------------------------------------------------------

echo
echo "Configuring monorepo..."

echo -n $MONOREPO_NAME >monorepo-management/constants/MONOREPO_NAME

# delete "setup" from pnpm commands and accompanying script
sed \
    -e '5d' \
    -e "s/__MONOREPO_NAME__/$MONOREPO_NAME/" \
    package.json | tee package.json
rm -f monorepo-management/scripts/setup.sh

# ---------------------------------------------------------------------------------
# Set up git
# ---------------------------------------------------------------------------------

echo
echo "Setting up git..."

rm -rf .git
git init

cp monorepo-management/git-hooks/pre-commit .git/hooks/
chmod +x .git/hooks/pre-commit

git add -A
git commit -m "first commit"
