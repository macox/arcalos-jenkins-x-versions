#!/bin/bash

NAME=$1

export VERSIONS_GIT_REF=$PULL_PULL_SHA

git clone https://github.com/cloudbees/arcalos
pushd arcalos
  ./create_aps_consumer_project.sh $NAME
  ./deploy_aps.sh $NAME
  ./verify.sh
popd
