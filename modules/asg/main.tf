resource "aws_autoscaling_group" "web" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.subnet_ids

  launch_configuration = aws_launch_configuration.web.id

  tag {
    key                 = "Name"
    value               = "WebInstance"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "web" {
  name          = "web-launch-config"
  image_id      = var.ami
  instance_type = var.instance_type
  security_groups = [var.security_group_id]  
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "cpu-high-${var.asg_name}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = "60"
  statistic          = "Average"
  threshold          = 75  
  alarm_description  = "This metric monitors CPU utilization and triggers scaling actions."

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_up.arn]
  ok_actions    = [aws_autoscaling_policy.scale_down.arn]
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "cpu-low-${var.asg_name}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = "60"
  statistic          = "Average"
  threshold          = 20  
  alarm_description  = "This metric monitors CPU utilization and triggers scaling actions."

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_down.arn]
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up-${var.asg_name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment      = 1
  cooldown               = 300  
  autoscaling_group_name = aws_autoscaling_group.web.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down-${var.asg_name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment      = -1
  cooldown               = 300 
  autoscaling_group_name = aws_autoscaling_group.web.name
}
