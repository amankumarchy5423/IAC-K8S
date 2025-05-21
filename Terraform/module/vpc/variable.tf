variable "vpc-cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "vpc-name" {
  type        = string
  description = "The name of the VPC"
  default = "aman-vpc"
}

variable "subnet-cidr" {
  type        = list(string)
  description = "the cidr block for the subnets"
}
variable "subnets-name" {
  type        = list(string)
  description = "the name block for the subnets"
  default = [ "public-subnet" ,"private-subnet" ]
}

variable "ig-name" {
    type        = string
    description = "the name of the ig"
    default = "aman-ig"
  
}

variable "port-no" {
  type = list(number)
  description = "the port number for the ig"
  default = [ 443,22,80 ]
}

# variable "protocol" {
#   type = list(string)
#   description = "the protocol for the ig"
#   default = [ "tcp", "udp" ]
# }