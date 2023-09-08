resource "aws_security_group" "main" {
  name        = var.sg_name
  description = var.description
  vpc_id      = var.vpc_id

  tags = {
    Name      = var.sg_name
    ManagedBy = var.managed_by
  }
}

resource "aws_vpc_security_group_egress_rule" "outbound_traffic" {
  count             = var.allow_outbound ? 1 : 0
  security_group_id = aws_security_group.main.id
  description       = "Allow all outbound traffic"

  cidr_ipv4   = var.outbound_cidr
  ip_protocol = -1
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  count             = var.allow_http ? 1 : 0
  security_group_id = aws_security_group.main.id

  cidr_ipv4   = var.http_cidr
  from_port   = var.http_port
  to_port     = var.http_port
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  count             = var.allow_http ? 1 : 0
  security_group_id = aws_security_group.main.id

  cidr_ipv4   = var.http_cidr
  from_port   = var.https_port
  to_port     = var.https_port
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  count             = var.allow_http ? 1 : 0
  security_group_id = aws_security_group.main.id

  cidr_ipv4   = var.ssh_cidr
  from_port   = var.ssh_port
  to_port     = var.ssh_port
  ip_protocol = "tcp"
}
