module "vpc" {
  source = "./modules/vpc"

  vpc_name            = var.vpc_name
  vpc_cidr_block      = var.vpc_cidr
  subnet_azs          = var.subnet_availability_zones
  public_subnet_cidr  = var.public_cidr
  private_subnet_cidr = var.private_cidr

  managed_by = var.managed_by
}

data "http" "local_ip" {
  url = "https://checkip.amazonaws.com"
}

module "security_group" {
  source = "./modules/security-group"

  sg_name     = var.sg_name
  description = var.sg_description
  vpc_id      = module.vpc.vpc_id

  allow_outbound = var.allow_outbound_traffic
  allow_http     = var.create_http_rule
  allow_ssh      = var.create_ssh_rule
  ssh_cidr       = "${chomp(data.http.local_ip.response_body)}/32"
  outbound_cidr  = var.outbound_cidr
  http_cidr      = var.http_cidr
  managed_by     = var.managed_by
}

module "EC2" {
  source = "./modules/EC2"

  instance_name       = var.instance_name
  ami                 = var.ami_id
  instance_type       = var.instance_type
  associate_public_ip = var.associate_public_ip
  subnet_ids          = module.vpc.public_subnet_ids
  security_group_ids  = [module.security_group.sg_id]
  key_name            = var.key_name
  managed_by          = var.managed_by
}

module "load_balancer" {
  source = "./modules/load-balancer"

  lb_name              = var.lb_name
  internal             = var.lb_internal
  lb_type              = var.lb_type
  security_group_ids   = [module.security_group.sg_id]
  subnet_ids           = module.vpc.public_subnet_ids
  ip_type              = var.lb_ip_type
  lb_port              = var.lb_port
  lb_protocol          = var.lb_protocol
  vpc_id               = module.vpc.vpc_id
  listener_action_type = var.listener_action_type
  instance_ids         = module.EC2.instance_ids
  managed_by           = var.managed_by
}

module "auto_scaling_group" {
  source = "./modules/auto-scaling-group"

  asg_name          = var.asg_name
  max_size          = var.asg_max_size
  min_size          = var.asg_min_size
  desired_size      = var.asg_desired_size
  subnet_ids        = module.vpc.public_subnet_ids
  target_group_arns = [module.load_balancer.target_group_arn]
  health_check_type = var.asg_health_check_type

  launch_template_name        = var.lt_name
  launch_template_description = var.lt_description
  launch_template_ami         = var.ami_id
  launch_template_version     = var.lt_version
  key_name                    = var.key_name
  security_group_ids          = [module.security_group.sg_id]
  managed_by                  = var.managed_by
}
