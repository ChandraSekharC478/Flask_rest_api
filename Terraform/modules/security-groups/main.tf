resource "aws_security_group" "ec2_sg" {
    name=var.ec2_sg_name
    vpc_id = var.vpc_id
    description = "enable the port 88 and ssh 22"
    ingress {
        description="Allow remote ssh to the Ec2"
        cidr_blocks= ["0.0.0.0/0"]
        from_port=22
        to_port=22
        protocol="tcp"
    }
    ingress {
        description="Allow Http from anywhere"
        cidr_blocks= ["0.0.0.0/0"]
        from_port=80
        to_port=80
        protocol="tcp"
    }
    ingress {
        description="Allow Https from anywhere"
        cidr_blocks= ["0.0.0.0/0"]
        from_port=443
        to_port=443
        protocol="tcp"
    }
    egress {
        description = "sending traffic outside the world"
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
    }
    
  
}
resource "aws_security_group" "ec2_jenkins_ports_8080" {
    vpc_id = var.vpc_id
    name = var.vpc_jenkins_ec2_sg_name
    ingress {
        description = "Allowing jenkins to the public "
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
    }
  
}