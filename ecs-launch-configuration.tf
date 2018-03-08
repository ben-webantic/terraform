/**
 * ECS Launch Configuration Resource
 */

resource "aws_launch_configuration" "ecs-launch-configuration" {
  name                  = "${var.ecs_launch_configuration_name}"
  image_id              = "${var.ecs_launch_configuration_image_id}"
  instance_type         = "${var.ecs_launch_configuration_instance_type}"
  iam_instance_profile  = "${aws_iam_instance_profile.ecs-instance-profile.id}"

  root_block_device {
    volume_type = "standard"
    volume_size = 100
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  security_groups             = ["${aws_security_group.security-group.id}"]
  associate_public_ip_address = "true"
  key_name                    = "${var.ecs_key_pair_name}"
  user_data                   = <<EOF
#!/bin/bash
echo ECS_CLUSTER=${var.ecs_cluster_name} >> /etc/ecs/ecs.config
EOF

}
