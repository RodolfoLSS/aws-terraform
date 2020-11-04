resource "aws_vpc" "main" {
    cidr_block  = var.vpc_cidr
    
    tags = {
        Service  = var.app_name
        Environment = var.stage
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Service  = var.app_name
        Environment = var.stage
    }
}

resource "aws_subnet" "subnet1" {
    vpc_id  = aws_vpc.main.id
    cidr_block = var.subnet1_cidr
    availability_zone = "us-east-2a"

    tags = {
        Service  = var.app_name
        Environment = var.stage
    }
}

resource "aws_subnet" "subnet2" {
    vpc_id  = aws_vpc.main.id
    cidr_block = var.subnet2_cidr
    availability_zone = "us-east-2c"

    tags = {
        Service  = var.app_name
        Environment = var.stage
    }
}

resource "aws_security_group" "sgweb" {
  vpc_id = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Service  = var.app_name
    Environment = var.stage
  }
}

resource "aws_security_group" "sgdb" {
  name = "${var.app_name}-${var.stage}-database"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.subnet1_cidr]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.subnet1_cidr]
  }

  tags = {
    Service  = var.app_name
    Environment = var.stage
  }
}

resource "aws_route_table" "web-public-rt" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Service  = var.app_name
        Environment = var.stage
    }
}

resource "aws_route_table_association" "web-public-rt" {
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.web-public-rt.id
}