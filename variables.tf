variable "app_name" {
  description = "The name of the App that will be launch."
}

variable "stage" {
  description = "Environment to launch"
}

variable "instance_type" {
  description = "Instance type"
}

variable "http_server_elastic_ip_allocation_id" {
  description = "Server elastic ip"
}

variable "ssh_key_name" {
  description = "ssh key name"
}

variable "rds_instance_type" {
  description = "rds instance type"
}

variable "database_user" {
  description = "Database user"
}

variable "database_password" {
  description = "Database password"
}

variable "database_port" {
  type = number
  description = "Port that the database uses"
}