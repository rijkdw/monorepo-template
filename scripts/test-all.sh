#!/bin/bash

function print-line() {
    echo "=============================================="
}

function run-tests-in() {
    print-line
    echo "Testing $1:"
    print-line
    pnpm --filter $1 test
}

for package in ./packages/*; do
    run-tests-in $package
done

for package in ./apps/*; do
    run-tests-in $package
done
