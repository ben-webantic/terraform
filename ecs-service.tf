/**
 * ECS Service Resource
 */

resource "aws_ecs_service" "ecs-service" {
  name            = "${var.service_name}"
  cluster         = "${aws_ecs_cluster.cluster-resource.id}"
  task_definition = "${aws_ecs_task_definition.task-definition.arn}"
  desired_count   = "${var.ecs_service_desired_count}"
  iam_role        = "${aws_iam_role.ecs-service-role.name}"
  //depends_on      = ["aws_iam_role_policy.iam-role"]

  load_balancer {
    elb_name        = "${aws_elb.elb.name}"
    container_name  = "${var.container_name}"
    container_port  = "${var.container_port}"
  }
}
