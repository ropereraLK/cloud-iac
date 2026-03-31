provider "aws" {
  region = "ap-south-1"
}

module "ecr" {
  source    = "../../modules/ecr"
  repo_name = "demo-app"
  env       = "dev"
}