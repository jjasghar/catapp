# CatApp

Node.js demo app for running a cloud native Tekton Pipeline.

This app displays a random picture of a cat.

## Build and run the Node.js app

```bash
npm install
node app.js
```

Open [http://localhost:3000/](http://localhost:3000/) in your web browser to
view the running app.

## Build and run CatApp on Tekton

- Modify `config/service.yaml` to point to your own Docker registry
- Determine which ServiceAccount and namespace you want to use. Make a Docker push secret called `docker-secret` using the Tekton Dashboard. Choose `default` as both the namespace and ServiceAccount, *or* make your own ServiceAccount and use this to be the ServiceAccount/namespace you would like, and modify the `tkn-run.sh` script you will use later, to reference your serviceaccount and namespace for the `-s` and `-n` arguments
- `cd tekton`
- `./grab-deps.sh`
- Remove the `hostpath` references in `repopvc.yaml` if you are using a real Cloud environment that does not support this type. Hopefully you are using one which supports dynamic provisioning
- If you are deploying into a real Cloud environment, you may need your own Role and RoleBinding, in use by your chosen ServiceAccount to use with `tkn-run`, that has additional permissions, to get/create/list Kubernetes deployments/services. Hint, the API group for services is simply ""
- Apply the Tekton Pipeline definition: `kubectl apply -f pipeline.yaml`
- `./tkn-run.sh https://github.com/a-roberts/catapp.git docker.io/<your docker registry>/catapp http://catapp:30300`
- Hopefully everything built, deployed and was pushed! You can port-forward or proxy to get to the app now, or you could do a `docker run` referring to your newly built image
