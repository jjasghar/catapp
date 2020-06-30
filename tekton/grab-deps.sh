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

git clone https://github.com/a-roberts/catalog.git
cd catalog
git checkout kubectl-from-path
kubectl apply -f kubectl-from-path/kubectl.yaml
cd ../

rm -rf ./catalog