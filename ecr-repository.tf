/**
 * ECR Repository Resource
 */

resource "aws_ecr_repository" "ecr-repository-resource" {
  name = "${var.repository_name}"
}