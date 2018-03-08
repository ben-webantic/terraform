/**
 * ECS Cluster Resource
 */

resource "aws_ecs_cluster" "cluster-resource" {
	name = "${var.ecs_cluster_name}"
}
