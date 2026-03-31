variable "repo_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "env" {
  description = "Environment (dev/prod)"
  type        = string
}

variable "image_tag_mutability" {
  description = "Tag mutability setting"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Enable image scanning"
  type        = bool
  default     = true
}