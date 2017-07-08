#!/bin/bash
set -e

"$(dirname "$0")/../goinstall.sh" --64

source ~/.bashrc

mkdir -p "$GOPATH/src/hello"
pushd "$GOPATH/src/hello"
cat >hello.go <<EOF
package main

import (
    "fmt"
    "runtime"
)

func main() {
    fmt.Printf("go version %s %s/%s\n", runtime.Version(), runtime.GOOS, runtime.GOARCH)
}
EOF
go build
go install
hello
popd
