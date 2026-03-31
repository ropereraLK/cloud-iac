variable "name" {
  description = "Queue name"
  type        = string
}
variable "visibility_timeout" {
  default = 60
}
variable "message_retention" {
  default = 86400
}
variable "max_receive_count" {
  default = 5
}
variable "enable_dlq" {
  default = false 
}
variable "fifo" {
  default = false
}