resource "aws_autoscaling_group" "ecs-autoscaling-group" {
  name                  = "${var.ecs_autoscaling_name}"
  max_size              = "${var.ecs_autoscaling_max_size}"
  min_size              = "${var.ecs_autoscaling_min_size}"
  desired_capacity      = "${var.ecs_autoscaling_desired_capacity}"
  vpc_zone_identifier   = ["${aws_subnet.subnet_1.id}", "${aws_subnet.subnet_2.id}"]
  launch_configuration  = "${aws_launch_configuration.ecs-launch-configuration.name}"
  health_check_type     = "ELB"
}
