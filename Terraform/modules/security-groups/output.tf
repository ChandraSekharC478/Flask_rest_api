output "ec2_sg" {
  value = aws_security_group.ec2_sg.id
}

output "ec2_jenkins_ports_8080" {
  value = aws_security_group.ec2_jenkins_ports_8080.id
}
