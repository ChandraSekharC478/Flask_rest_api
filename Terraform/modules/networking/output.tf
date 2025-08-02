output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.rest_api_vpc.id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = aws_subnet.rest_api_public_subnet[*].id
}

output "private_subnet_ids" {
  description = "Private Subnet IDs"
  value       = aws_subnet.rest_api_private_subnet[*].id
}

output "rest_api_vpc" {
  value = aws_vpc.rest_api_vpc.id
}
