
data "aws_caller_identity" "current" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "default" {
    public_key = file("${var.ssh_key_name}")
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  security_groups = var.vpc_security_group_ids
  key_name = aws_key_pair.default.id

  tags = {
    Name = "${var.app_name}-${var.stage}-http-server"
    Service  = var.app_name
    Environment = var.stage
  }
}


resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = var.elastic_ip_allocation_id
}
