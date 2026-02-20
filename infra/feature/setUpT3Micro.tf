# Template to create the terraform file.
# Missing configs are added in env-specific files (e.g. devSetUpT3Micro.tf).
# - Consume EC2 module
# - Validate policy from policy

# Load global EC2 policy (allowed instance types).
module "ec2_policy" {
  source = "../../policy/global/ec2"
}

# Create EC2 instance; instance_type must be allowed by policy.
module "ec2" {
  source = "../../modules/ec2"

  config = var.config

  precondition {
    condition     = contains(module.ec2_policy.allowed_instance_types, var.config.instance_type)
    error_message = "Instance type \"${var.config.instance_type}\" is not allowed by policy. Allowed: ${join(", ", module.ec2_policy.allowed_instance_types)}."
  }
}
