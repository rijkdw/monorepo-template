"use strict";

module.exports = {
  "**/*.{js,ts,tsx}": [
    "prettier --write",
    "eslint --max-warnings=0 --no-warn-ignored",
    "bash -c 'pnpm typecheck'",
  ],
};
