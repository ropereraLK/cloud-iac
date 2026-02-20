/**
*  Create EC2 Instance
*  resource: Create and manage
*  resource type: aws_instance
*  this: local name inside Terraform
*/
resource "aws_instance" "this" {
    #ami: OS, Preinstalled software, Kernel configuration
    ami = var.config.ami
    #instance_type: t3.micro
    instance_type = var.config.instance_type

    #Metadata: Name: dev-ec2-demo
    tags = {
      Name = var.config.name
    }
  
}