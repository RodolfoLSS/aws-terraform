output "vpc_arn" {
  value = aws_vpc.main.arn
}

output "vpc_security_group_ids" {
  value = [aws_security_group.sgweb.id]
}

output "database_security_group_id" {
  value = aws_security_group.sgdb.id
}

output "subnet1_server" {
  value = aws_subnet.subnet1.id
}

output "subnet2_server" {
  value = aws_subnet.subnet2.id
}

output "gateway" {
  value = aws_internet_gateway.gw
}
