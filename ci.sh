#!/bin/bash

NAME=$1
git clone https://github.com/cloudbees/arcalos
pushd arcalos
  ./create_aps_consumer_project.sh $NAME
  ./deploy_aps.sh $NAME
  ./verify.sh
popd
