resource "aws_ecr_repository" "this" {
  name                 = "${var.repo_name}-${var.env}"
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = {
    Environment = var.env
    Project     = var.repo_name
  }
}