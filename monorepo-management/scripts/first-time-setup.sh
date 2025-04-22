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

cancel-setup() {
    echo "Project setup cancelled"
    exit 1
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
echo -n "Pick a monorepo name: "
read MONOREPO_NAME

if [[ -z "$MONOREPO_NAME" ]]; then
    echo "Error: Monorepo name must be provided."
    cancel-setup
fi

if echo "$MONOREPO_NAME" | grep -q " "; then
    echo "Error: Monorepo name contains spaces."
    cancel-setup
fi

echo
echo "Names of apps and packages will be prefixed with \"@$MONOREPO_NAME/\" e.g."
echo "  @$MONOREPO_NAME/utils"
echo "  @$MONOREPO_NAME/web"
echo "  @$MONOREPO_NAME/api"
echo

if confirm; then
    echo "Thanks for confirming."
else
    cancel-setup
fi

# ---------------------------------------------------------------------------------
# Set up monorepo configuration
# ---------------------------------------------------------------------------------

echo
echo "Configuring monorepo"

echo -n $MONOREPO_NAME >monorepo-management/constants/MONOREPO_NAME

# delete "setup" from pnpm commands and accompanying script
# IMPORTANT: keep line 5 below in sync with monorepo root package.json
sed -i '' \
    -e '5d' \
    -e "s/__MONOREPO_NAME__/$MONOREPO_NAME/" \
    package.json
rm -f monorepo-management/scripts/first-time-setup.sh

# ---------------------------------------------------------------------------------
# Re-initialize and configure git repository
# ---------------------------------------------------------------------------------

echo
echo "Initializing and configuring git repository"

rm -rf .git
git init

cp monorepo-management/git-hooks/pre-commit .git/hooks/
chmod +x .git/hooks/pre-commit

git add -A
git commit -m "First commit"

# ---------------------------------------------------------------------------------
# Done
# ---------------------------------------------------------------------------------

echo
echo "Monorepo setup done! Happy coding :)"
