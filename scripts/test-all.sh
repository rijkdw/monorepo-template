#!/bin/bash

function print-line (){
    echo "=============================================="
}

function test-one () {
    print-line
    echo "Testing $1:"
    print-line
    pnpm --filter $1 test
}

test-one ./packages/shared
test-one ./apps/example-app