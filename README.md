# Auto Init GKE Tool

Automatically initialize Google Kubernetes Engine, Source Repository, and Cloud Build Trigger with
<a href="https://www.terraform.io">Terraform</a>, and create a
<a href="https://nestjs.com">NestJS</a>
example project.

## Step 1 - Initialize GKE

> Open Cloud Shell

```bash
$ cd gke
$ vim variables.tf
```

> Input your GCP project ID

<img src="./images/gke-terraform.png" width="50%">

> Run terraform

```bash
$ terraform init
$ terraform apply
```

> Step 1 will create

- A service account named k8s-service-account, please create a new key with json file.
  
  <img src="./images/service-account.png" width="50%">

- A Kubernetes cluster
  
  <img src="./images/gke.png">

## Step 2 - Initialize Source Repository and Cloud Build Trigger

```bash
$ cd trigger
$ terraform init
$ terraform apply
```

> Step 2 will create

- A repository for NestJS example project

  <img src="./images/repo.png" width="30%">

- A trigger for the repository

  <img src="./images/trigger.png">

## Step 3 - Push NestJS example project to the Repository

```bash
$ cd nestjs-example
$ vim cloudbuild/cloudbuild.yaml
```

> Input your GCP project ID

<img src="./images/cloudbuild1.png" width="50%">

> Push to the repository

```bash
$ git init
$ git add .
$ git commit -m "init"
$ git remote add origin <url>
$ git push -u origin master
```

> Wait for the cloud build process to complete

<img src="./images/build.png">

> Find endpoints in GKE and access

<img src="./images/service.png">

<img src="./images/nestjs.png" width="50%">

## Update NestJS example project

After the first deployment, you need to modify the cloud build configuration when you push new code.

```bash
$ vim cloudbuild/cloudbuild.yaml
```

> Comment out line 19-36 and uncomment line 41-51

<img src="./images/cloudbuild2.png" width="50%">

> Push code and see the cloud build process





