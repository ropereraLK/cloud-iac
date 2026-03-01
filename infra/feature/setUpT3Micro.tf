# Template to create the Terraform file.
# Missing configs are added in env-specific files (e.g. DevSetUpT3Micro.tf).
#
# Pattern (from env root, e.g. infra/env/dev/):
#   module "ec2" {
#     source = "../../modules/ec2"
#     config = {
#       ami           = "<AMI for your region>"
#       instance_type = "t3.micro"   # must be in policy/ec2.tf allowed list
#       name          = "<instance name>"
#       volume_size   = 20
#     }
#   }
#
# - Consume EC2 module (directly from env).
# - Keep instance_type in policy allowed list (validate in CI or by convention).
