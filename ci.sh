#!/bin/bash

set -e

NAME=$1

export VERSIONS_GIT_REF=$PULL_PULL_SHA

git clone https://github.com/cloudbees/arcalos
pushd arcalos
  sed -i "s|VERSIONS_GIT_REF=.*$|VERSIONS_GIT_REF=$PULL_PULL_SHA|g" ./templates/.secrets.defaults
  cat ./templates/.secrets.defaults
  ./get_arcalos_config.sh ${NAME}
  ./create_aps_consumer_project.sh $NAME
  ./deploy_aps.sh $NAME
  ./run_all_checks.sh $NAME
popd
