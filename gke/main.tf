resource "google_service_account" "kubernetes_create_account" {
  account_id = var.accountId
  display_name = var.accountName
}

resource "google_project_iam_member" "project" {
  project = var.projectId
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.kubernetes_create_account.email}"
}

resource "google_container_cluster" "primary" {
  name     = var.clusterName
  location = var.location

  remove_default_node_pool = true
  initial_node_count       = var.nodeCount
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name     = var.nodePoolName
  location = var.location
  cluster  = google_container_cluster.primary.name
  node_count = var.nodeCount
  node_config {
    preemptible  = true
    machine_type = var.machineType
    service_account = google_service_account.kubernetes_create_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
