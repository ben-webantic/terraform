/**
 * ECS Task Definition Resource
 */

data "template_file" "task_definition_template" {
	template = "${file("taskdefs/task-definition.tpl")}"
	vars {
  	amazon_account = "${var.amazon_account}"
		docker_name = "${var.docker_name}"
		docker_version = "${var.docker_version}"
		oauthkey = "${var.deploy_env_oauthkey}"
		mongo_url = "${var.deploy_env_mongo_url}"
		port = "${var.deploy_env_port}"
		root_url = "${var.deploy_env_root_url}"
  }
}

resource "aws_ecs_task_definition" "task-definition" {
  family = "${var.task_definition_family}"
	container_definitions = "${data.template_file.task_definition_template.rendered}"
	volume {
		name = "mongo-data"
	}
}