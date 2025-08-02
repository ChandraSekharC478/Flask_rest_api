provider "aws" {
  region = "us-west-2"
}
module "networking" {
  source            = "./modules/networking"
  vpc_cidr          = var.vpc_cidr
  vpc_name          = var.vpc_name
  public_subnet_id  = var.public_subnet_id
  availabilty_zone  = var.availabilty_zone
  private_subnet_id = var.private_subnet_id

}
module "security_groups" {
  source                  = "./modules/security-groups"
  ec2_sg_name             = "SG for EC2 to enable the ports ssh(22),HTTPS(443),HTTP(8080)"
  vpc_id                  = module.networking.rest_api_vpc
  vpc_jenkins_ec2_sg_name = "Allow port 8080 for jenkins"
}
module "jenkins" {
  source                    = "./modules/jenkins"
  ami_id                    = var.ami_id
  instance_type             = "t2.medium"
  tag_name                  = "jenkins:ubuntu linux Ec2"
  public_key                = var.public_key
  subnet_id                 = tolist(module.networking.public_subnet_ids)[0]
  sg_for_jenkins            = [module.security_groups.ec2_sg, module.security_groups.ec2_jenkins_ports_8080]
  enable_public_ip_address  = true
  user_data_install_jenkins = file("${path.module}/modules/jenkins-runner-script/jenkins-installer.sh")

}
