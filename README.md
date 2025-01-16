# Monorepo template

A simple monorepo template for Javascript projects with:

* Typescript configuration
* Jest support
* [Utility scripts](#utility-scripts)



## How to use the template effectively

* Use `pnpm` for workspace and dependency management.
* Create new packages with `./scripts/new-package.sh`.
* Create new React apps in `apps` with `pnpm create vite`.
* Inherit the base TS, Babel, and Jest configs (located in monorepo root) inside apps and packages (see `packages/shared` as example).
* Add monorepo `packages` to other apps/packages' `package.json`s with `"@monorepo:<packagename>": "workspace:*"`.
* Add apps/packages' tests to `./scripts/test-all.sh`.



## Utility scripts

These are located in `<monorepo-root>/scripts`.


### `new-package.sh`

Creates a new package in the monorepo from the `packages/__template` package.
Usage:

```sh
$ ./scripts/new-package.sh <package-name>
```

A new package with name `<package-name>` will be created inside `packages`.


### `test-all.sh`

Runs the `test` command in each app and package, sequentially.  Add new apps and packages to this file to cover them with your monorepo root's `pnpm test` command.


## Planned features

None at the moment.