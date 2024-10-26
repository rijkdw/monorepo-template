"use strict";

module.exports = {
  "!(apps/**/typings-nexus.ts)**/*.{js,ts,tsx}": [
    "prettier --write",
    "eslint --max-warnings=0 --no-warn-ignored",
    "bash -c 'pnpm typecheck'",
  ],
};
