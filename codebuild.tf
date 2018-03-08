/**
 * Amazon Codebuild
 */

resource "aws_iam_role" "codebuild_role" {
  name = "codebuild-role-terraform"

  assume_role_policy = <<ROLE
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
ROLE
}

resource "aws_iam_policy" "codebuild_policy" {
  name        = "codebuild-policy-terraform"
  path        = "/service-role/"
  description = "Policy used in trust relationship with CodeBuild"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "codebuild_policy_attachment" {
  name       = "codebuild-policy-attachment"
  policy_arn = "${aws_iam_policy.codebuild_policy.arn}"
  roles      = ["${aws_iam_role.codebuild_role.id}"]
}

resource "aws_codebuild_project" "codebuild-project" {
  name         = "${var.codebuild_project_name}"
  description  = "${var.codebuild_project_description}"
  service_role = "${aws_iam_role.codebuild_role.arn}"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/docker:17.09.0"
    type         = "LINUX_CONTAINER"

    environment_variable {
      "name"  = "AWS_ACCOUNT_ID"
      "value" = "${var.amazon_account}"
    }

    environment_variable {
      "name" = "GIT_TOKEN"
      "value" = "${var.build_git_token}"
    }

    environment_variable {
      "name"  = "IMAGE_REPO_NAME"
      "value" = "${var.build_image_repo_name}"
    }

    environment_variable {
      "name"  = "NPM_TOKEN"
      "value" = "${var.build_npm_token}"
    }
  }

  source {
    type     = "GITHUB"
    location = "${var.build_git_url}"
  }
}