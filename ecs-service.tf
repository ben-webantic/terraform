/**
 * ECS Service Resource
 */

resource "aws_ecs_service" "ecs-service" {
  name            = "${var.service_name}"
  cluster         = "${aws_ecs_cluster.cluster-resource.id}"
  task_definition = "${aws_ecs_task_definition.task-definition.arn}"
  desired_count   = 1
  iam_role        = "${aws_iam_role.iam-role.arn}"
  //depends_on      = ["aws_iam_role_policy.iam-role"]

  load_balancer {
    elb_name        = "${aws_elb.elb.name}"
    container_name  = "${var.container_name}"
    container_port  = "${var.container_port}"
  }
}