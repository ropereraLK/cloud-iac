locals {
  global_ec2_policy = {
    allowed_instance_types = [
      "t3.micro",
      "t3.small"
    ]
  }
}