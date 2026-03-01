# Step 01: Use the template in feature/setUpT3Micro.tf (pattern only).
# Step 02: Dev env config (ami, name, instance_type from policy).
# Step 03: Call EC2 module directly.

module "ec2" {
  source = "../../modules/ec2"

  config = {
    ami           = var.ec2_ami           # set in tfvars or env
    instance_type = "t3.micro"             # from policy/ec2.tf (allowed)
    name          = "dev-ec2-demo"
    volume_size   = 20
  }
}
