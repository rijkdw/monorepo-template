"use strict";

module.exports = {
  "!(apps/**/typings-nexus.ts)**/*.{js,ts,tsx}": [
    "prettier --write",
    "eslint --max-warnings=0 --no-ignore",
    "bash -c 'pnpm tsc'",
  ],
};
