resource "aws_instance" "main" {
  count                       = length(var.subnet_ids)
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip
  subnet_id                   = var.subnet_ids[count.index]
  vpc_security_group_ids      = var.security_group_ids
  key_name                    = var.key_name

  tags = {
    Name      = "${var.instance_name}-${count.index + 1}"
    ManagedBy = var.managed_by
  }
}
