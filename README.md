# Monorepo template

A simple monorepo template for Javascript projects with:

* Typescript configuration
* Jest support
* [Utility scripts](#utility-scripts)



## Quick setup

Run the quick setup script to clone this repository without the template's commit history.

```sh
$ ./scripts/quick-setup.sh <path-to-your-new-monorepo>
```

Read more about the quick setup script [here](#quick-setupsh).



## How to use the template effectively

* Use `pnpm` for workspace and dependency management.
* Create new packages with `./scripts/new-package.sh`.
* Create new React apps in `apps` with `npx create vite@latest`.
* Inherit the base TS, Babel, and Jest configs (located in monorepo root) inside apps and packages (see `packages/shared` as example).
* Add monorepo `packages` to other apps/packages' `package.json`s with `"@monorepo:<packagename>": "workspace:*"`.
* Add apps/packages' tests to `./scripts/test-all.sh`.



## Utility scripts

These are located in `<monorepo-root>/scripts`.


### `quick-setup.sh`

Creates a clone of this monorepo template without the template's commit history.
Usage:

```sh
$ ./scripts/quick-setup.sh <path-to-your-new-monorepo>
```

A copy of the monorepo will be created at `./path-to-your-new-monorepo`.


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

* Prettier and eslint support
* Pre-commit hooks
* Github actions