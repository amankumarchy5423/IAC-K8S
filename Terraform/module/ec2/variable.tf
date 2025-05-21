variable "instance-ami" {
  description = "ami for instance"
  type = string
}

variable "security_groups" {
  description = "all security group for instances"
  type = list(string)
}

variable "subnet_id" {
  description = "public subnet id for instance"
  type = string
}