#!/bin/bash -x

git clone https://github.com/tektoncd/catalog.git
cd catalog
git checkout e680707
kubectl apply -f slackmessage/send-to-channel-slack.yaml
kubectl apply -f curl/curl.yaml
kubectl apply -f git/git-clone.yaml
kubectl apply -f kaniko/kaniko.yaml

cd ../
rm -rf ./catalog

# This is the only custom bit
kubectl apply -f kubetask.yaml