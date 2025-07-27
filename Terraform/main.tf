module "networking" {
    source="./modules/networking"
    vpc_cidr = var.vpc_cidr
    vpc_name=var.vpc_name
    public_subnet_id=var.public_subnet_id
    availabilty_zone=var.availabilty_zone
    private_subnet_id=var.private_subnet_id
  
}