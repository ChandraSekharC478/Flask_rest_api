output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.rest_api_vpc.id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = aws_subnet.rest_api_public_subnet[*].id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.rest_api_public_subnet[*].id
}
output "rest_api_vpc" {
  value = aws_vpc.rest_api_vpc.id
}
