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

Todo, but it'll involve applying the Pipeline under `tekton`, a bunch of tasks from the catalog (commands todo) and `tkn`, after you make a secret in the Dashboard for pushing to your Docker registry, and then one (not in the Tekton Dashboard) for your Slack secret.
