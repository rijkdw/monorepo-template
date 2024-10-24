#!/bin/bash

# Setup git hooks
cp git-hooks/pre-commit .git/hooks/
chmod +x .git/hooks/pre-commit