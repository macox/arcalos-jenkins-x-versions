#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

jx step create pr regex --regex "\s*VERSIONS_GIT_REF=\"(.*)\"" --version ${VERSION} --files "templates/.secrets.defaults" --repo https://github.com/cloudbees/arcalos
sed 's:^.*\[jenkins-x/jenkins-x-builders\].*\[\([0-9.\-]*\)\].*$:\1:;t;d' dependency-matrix/matrix.md
