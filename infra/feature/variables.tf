# Config passed in by env (e.g. dev). Missing configs are added in env-specific files like DevSetUpT3Micro.tf.
variable "config" {
  description = "EC2 instance config (ami, instance_type, name, volume_size). Must use an instance_type allowed by policy."
  type = object({
    instance_type = string
    ami           = string
    name          = string
    volume_size   = number
  })
}
