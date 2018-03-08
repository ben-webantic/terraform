/**
 * ECS Cluster Resource
 */

resource "aws_ecs_cluster" "cluster-resource" {
	name = "${var.cluster_name}"
}