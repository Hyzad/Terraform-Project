resource "aws_autoscaling_group" "main" {
  name                      = var.asg_name
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_size
  vpc_zone_identifier       = var.subnet_ids
  target_group_arns         = var.target_group_arns
  health_check_type         = var.health_check_type
  health_check_grace_period = var.health_check_grace_period

  launch_template {
    id      = var.launch_template_id == null ? aws_launch_template.main[0].id : var.launch_template_id
    version = var.launch_template_version
  }
  tag {
    key                 = "Name"
    value               = var.asg_name
    propagate_at_launch = true
  }
  tag {
    key                 = "ManagedBy"
    value               = var.managed_by
    propagate_at_launch = true
  }
}

resource "aws_launch_template" "main" {
  count                  = var.launch_template_id == null ? 1 : 0
  name                   = var.launch_template_name
  description            = var.launch_template_description
  image_id               = var.launch_template_ami
  key_name               = var.key_name
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  user_data              = var.launch_template_user_data == null ? null : (var.launch_template_user_data)

  tags = {
    ManagedBy = var.managed_by
  }
}
