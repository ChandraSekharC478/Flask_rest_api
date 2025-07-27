resource "aws_vpc" "rest_api_vpc" {
    cidr_block = var.vpc_cidr
    tags = {
      Name=var.vpc_name
    }
  
}
resource "aws_subnet" "rest_api_public_subnet" {
    count = length(var.public_subnet_id)
    vpc_id = aws_vpc.rest_api_vpc.id
    cidr_block = element(var.public_subnet_id,count.index)
    availability_zone = element(var.availabilty_zone,count.index)
    tags = {
      Name="rest_api_vpc-${count.index+1}"
    }
  
}
resource "aws_subnet" "rest_api_private_subnet" {
    count = length(var.private_subnet_id)
    vpc_id = aws_vpc.rest_api_vpc.id
    cidr_block = element(var.private_subnet_id,count.index)
    availability_zone = element(var.availabilty_zone,count.index)
    tags = {
      Name="rest_api_vpc-${count.index+1}"
    }
  
}