vpc_cidr          = "11.0.0.0/16"
vpc_name          = "rest_api_vpc"
public_subnet_id  = ["11.0.1.0/24", "11.0.2.0/24"]
private_subnet_id = ["11.0.3.0/24", "11.0.4.0/24"]
availabilty_zone  = ["us-west-2a", "us-west-2b"]
public_key        = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGxLWIZc73rA4RchkDsMJsZ043XQONzxPAzTANtRA1UA chandrasekkhar@Mac.lan"
ami_id            = "ami-05f991c49d264708f"
