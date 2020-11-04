app_name = "official"
stage = "dev"
# change the location of the ssh key below
ssh_key_name = "~/.ssh/id_rsa.pub"  

instance_type = "t2.micro"
# change your public IP
http_server_elastic_ip_allocation_id = "eipalloc-0a450d8d344a4dc40"

rds_instance_type = "db.t2.micro"
# postgres: 5432 mysql: 3306
database_port = 3306 
database_user = "mydb1"
database_password = "YourPwdShouldBeLongAndSecure!"