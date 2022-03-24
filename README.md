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

- A service account named k8s-service-account, please create new key with json file.
  
  <img src="./images/service-account.png" width="50%">

- Kubernetes Cluster
  
  <img src="./images/gke.png" width="50%">

## Step 2 - Initialize Source Repository and Cloud Build Trigger for NestJS example project
