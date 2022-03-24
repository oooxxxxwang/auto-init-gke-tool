variable "projectId" {
  type = string
  description = "Google Project ID"
  default = ""
}

variable "accountId" {
  type = string
  description = "Google service account ID"
  default = "k8s-service-account"
}

variable "accountName" {
  type = string
  description = "Google service account display name"
  default = "k8s-service-account"
}

variable "clusterName" {
  type = string
  description = "Google Kubernetes cluster name"
  default = "cluster-1"
}

variable "location" {
  type = string
  description = "The region-location of the project"
  default = "us-central1-c"
}

variable "nodeCount" {
  type = number
  description = "node count in node pool"
  default = 3
}

variable "nodePoolName" {
  type = string
  description = "Google Kubernetes node pool name"
  default = "node-pool-1"
}

variable "machineType" {
  type = string
  description = "Google Kubernetes instance type"
  default = "e2-medium"
}
