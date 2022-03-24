variable "repo_branch" {
  type = string
  default = "^master$"
}

variable "repo_name" {
  type = list(string)
  default = [
    "nestjs-example"
  ]
}
