#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "You must enter exactly three command line arguments. First the repository URL to clone, then the Docker registry URL to push to, and finally the application URL that will be curled for testing"
  echo "Hint, you probably want ./tkn-run.sh https://github.com/a-roberts/catapp.git docker.io/<our registry> http://catapp:30300"
  exit -1
fi

repourl=$1
dockerurl=$2
appurl=$3

echo "Make sure you've got a Docker secret for Tekton configured for $docker-url!"
tkn pipeline start from-catalog-shelf --workspace name=shared-data,secret=docker-secret -p repo-url=${repourl} -p docker-url=${dockerurl} -p app-url=${appurl}
