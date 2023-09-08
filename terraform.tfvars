vpc_name                  = "<NAME-TO-USE-FOR-VPC>"
managed_by                = "Terraform"
vpc_cidr                  = "10.0.0.0/16"
private_cidr              = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
public_cidr               = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20"]
subnet_availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]

sg_name                = "<NAME-TO-USE-FOR-SECURITY-GROUP>"
sg_description         = "Security group to allow all outbound requests and http, https, and ssh inbound requests"
allow_outbound_traffic = true
create_http_rule       = true
create_ssh_rule        = true
http_cidr              = "0.0.0.0/0"
outbound_cidr          = "0.0.0.0/0"

instance_name       = "<NAME-TO-USE-FOR-INSTANCES>"
instance_type       = "t2.micro"
associate_public_ip = true
key_name            = "<NAME-OF-YOUR-KEY-PAIR>"
ami_id              = "<NAME-OF-YOUR-AMI>"

lb_name              = "<NAME-TO-USE-FOR-LOAD-BALANCER>"
lb_type              = "application"
lb_ip_type           = "ipv4"
lb_port              = 80
lb_protocol          = "HTTP"
listener_action_type = "forward"

asg_name              = "<NAME-TO-USE-FOR-AUTO-SCALING-GROUP>"
asg_max_size          = 3
asg_min_size          = 3
asg_desired_size      = 3
asg_health_check_type = "EC2"
lt_name               = "<NAME-TO-USE-FOR-LAUNCH-TEMPLATE>"
lt_description        = "Launch template for the terraform project"
lt_version            = "$Default"
