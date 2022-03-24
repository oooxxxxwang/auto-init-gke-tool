resource "google_sourcerepo_repository" "repo" {
  for_each = toset(var.repo_name)
  name = each.key  
}

resource "google_cloudbuild_trigger" "build_trigger" {
  for_each = toset(var.repo_name)
  name = "trigger-${each.key}"
  trigger_template {
    branch_name = var.repo_branch
    repo_name   = each.key
  }

  filename = "cloudbuild/cloudbuild.yaml"
}
