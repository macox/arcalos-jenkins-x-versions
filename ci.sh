#!/bin/bash

NAME=$1

export VERSIONS_GIT_REF=$PULL_PULL_SHA

git clone https://github.com/cloudbees/arcalos
pushd arcalos
  sed -i "s|VERSIONS_GIT_REF=.*$|VERSIONS_GIT_REF=$PULL_PULL_SHA|g" ./templates/.secrets.defaults
  ./create_aps_consumer_project.sh $NAME
  ./deploy_aps.sh $NAME
  ./verify.sh
popd
