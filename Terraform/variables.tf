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
