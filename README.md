# Monorepo template

## Setup

1. Install dependencies:

```sh
$ pnpm i
```

## Recommendations for use

* Use `pnpm` for workspace and dependency management
* Use `npx create vite@latest` to create new React apps in `apps`
* Add dependencies from `packages` to `package.json`s with `"@monorepo:packagename": "workspace:*"`