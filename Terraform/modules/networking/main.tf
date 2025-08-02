resource "aws_vpc" "rest_api_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }

}
resource "aws_subnet" "rest_api_public_subnet" {
  count                   = length(var.public_subnet_id)
  vpc_id                  = aws_vpc.rest_api_vpc.id
  cidr_block              = element(var.public_subnet_id, count.index)
  availability_zone       = element(var.availabilty_zone, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "rest_api_vpc-${count.index + 1}"
  }

}
resource "aws_subnet" "rest_api_private_subnet" {
  count             = length(var.private_subnet_id)
  vpc_id            = aws_vpc.rest_api_vpc.id
  cidr_block        = element(var.private_subnet_id, count.index)
  availability_zone = element(var.availabilty_zone, count.index)
  tags = {
    Name = "rest_api_vpc-${count.index + 1}"
  }

}
resource "aws_internet_gateway" "rest_api_internet_gate_way" {
  vpc_id = aws_vpc.rest_api_vpc.id
  tags = {
    Name = "rest_api_internet_gate_way"
  }
}
resource "aws_route_table" "rest_api_public_subnet_route_table" {
  vpc_id = aws_vpc.rest_api_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rest_api_internet_gate_way.id
  }
  tags = {
    Name = "rest_api_route_table_public"
  }

}

resource "aws_route_table" "rest_api_private_subnet_route_table" {
  vpc_id = aws_vpc.rest_api_vpc.id

  tags = {
    Name = "rest_api_route_table_private"
  }

}
resource "aws_route_table_association" "rest_api_public_subnet_route_table_assocation" {
  count = length(aws_subnet.rest_api_public_subnet)
  subnet_id = aws_subnet.rest_api_public_subnet[count.index].id
  route_table_id = aws_route_table.rest_api_public_subnet_route_table.id
  
}
resource "aws_route_table_association" "rest_api_private_subnet_route_table_assocation" {
  count = length(aws_subnet.rest_api_private_subnet)
  subnet_id = aws_subnet.rest_api_private_subnet[count.index].id
  route_table_id = aws_route_table.rest_api_private_subnet_route_table.id
  
}
