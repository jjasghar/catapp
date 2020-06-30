# CatApp

Nodejs demo app for running a cloud native Tekton Pipeline.

This app displays a random picture of a cat.

## Build and run Nodejs app

```bash
npm install
node app.js
```

Open [http://localhost:3000/](http://localhost:3000/) in your web browser to
view the running app.

## Build and run CatApp on Tekton

- Modify `config/service.yaml` to point to your own Docker registry
- Make a Docker push secret called `docker-secret` using the Tekton Dashboard. Choose `default` as both the namespace and ServiceAccount
- `cd tekton`
- `./tkn-run.sh https://github.com/a-roberts/catapp.git docker.io/<your docker registry>/catapp http://catapp:30300`
