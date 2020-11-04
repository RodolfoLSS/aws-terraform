variable "app_name" {
  description = "The name of the App that will be launch"
}

variable "stage" {
  description = "Environment to launch"
}

variable "database_port" {
  type = number
  description = "database port to use"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "subnet1_cidr" {
    default = "10.0.0.0/24"
}

variable "subnet2_cidr" {
    default = "10.0.1.0/24"
}
