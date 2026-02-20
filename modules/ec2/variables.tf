variable "config" {
  type = object({
    instance_type = string
    ami           = string
    name          = string
    volume_size   = number
  })
}