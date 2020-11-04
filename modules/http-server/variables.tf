variable "app_name" {
  type = string
}

variable "stage" {
  type = string
}

variable "ssh_key_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "instance_type" {
  type = string
}

variable "elastic_ip_allocation_id" {
  type = string
}
