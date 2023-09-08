resource "aws_lb" "main" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = var.lb_type
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids
  ip_address_type    = var.ip_type

  tags = {
    Name      = var.lb_name
    ManagedBy = var.managed_by
  }
}

resource "aws_lb_target_group" "main" {
  name     = "${var.lb_name}-tg"
  port     = var.lb_port
  protocol = var.lb_protocol
  vpc_id   = var.vpc_id
  tags = {
    Name      = "${var.lb_name}-tg"
    ManagedBy = var.managed_by
  }
}

resource "aws_lb_target_group_attachment" "main" {
  count = length(var.instance_ids)

  target_group_arn = aws_lb_target_group.main.arn
  target_id        = var.instance_ids[count.index]
  port             = var.lb_port
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.lb_port
  protocol          = var.lb_protocol

  default_action {
    type             = var.listener_action_type
    target_group_arn = aws_lb_target_group.main.arn
  }
  tags = {
    Name      = "${var.lb_name}-listener"
    ManagedBy = var.managed_by
  }
}
