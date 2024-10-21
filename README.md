# Monorepo template

## Setup

1. Install dependencies:

```sh
$ pnpm i
```

## How to use effectively

* Use `pnpm` for workspace and dependency management.
* Create new packages with `./scripts/new-package.sh`.
* Use `npx create vite@latest` to create new React apps in `apps`.
* Add dependencies from `packages` to `package.json`s with `"@monorepo:packagename": "workspace:*"`.