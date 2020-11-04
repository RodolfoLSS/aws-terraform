provider "aws" {
    version = "~> 2.70"
    region  = "us-east-2"
}

terraform {
  required_version = "~>0.12"
  backend "s3" {
    region = "us-east-2"
    bucket = "rodolfo-vpc-bucket"
    key    = "tfstates/"
  }
}

module "vpc" {
  source = "./modules/vpc"
  app_name = var.app_name
  stage = var.stage
  database_port = var.database_port
}

module "http-server" {
  source = "./modules/http-server"
  app_name = var.app_name
  stage = var.stage
  ssh_key_name = var.ssh_key_name
  subnet_id = module.vpc.subnet1_server
  vpc_security_group_ids = module.vpc.vpc_security_group_ids
  instance_type = var.instance_type
  elastic_ip_allocation_id = var.http_server_elastic_ip_allocation_id
}