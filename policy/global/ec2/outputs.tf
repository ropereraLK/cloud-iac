output "allowed_instance_types" {
  description = "Instance types allowed by global EC2 policy."
  value       = local.global_ec2_policy.allowed_instance_types
}
