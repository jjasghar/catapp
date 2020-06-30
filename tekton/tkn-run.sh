#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "You must enter exactly three command line arguments. First the repository URL to clone, then the Docker registry URL to push to, and finally the application URL that will be curled for testing"
  exit -1
fi

repo-url=$1
docker-url=$2
app-url=$3

tkn pipeline start from-catalog-shelf -workspace name=shared-data -p repo-url=${repo-url} -p docker-url=${docker-url} -p app-url=${app-url} -n default -s default
