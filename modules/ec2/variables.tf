variable "config" {
  type = object({
    instance_type = string
    ami           = string
    volume_size   = number
  })
}