resource "aws_autoscaling_group" "app_asg" {
  name = "vprofile-asg"

  desired_capacity = 2
  min_size         = 1
  max_size         = 3

  vpc_zone_identifier = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.vprofile_tg.arn]

  health_check_type         = "ELB"
  health_check_grace_period = 420

  tag {
    key                 = "Name"
    value               = "vprofile-asg-instance"
    propagate_at_launch = true
  }
}