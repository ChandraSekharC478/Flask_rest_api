variable "vpc_cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "public_subnet_id" {
  type = list(string)
}

variable "private_subnet_id" {
  type = list(string)
}

variable "availabilty_zone" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "public_key" {
  type = string
}