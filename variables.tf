/*
 * Variables storage
 *
 * Will pull from TF_VAR_variable_name in the environment
 */

variable amazon_account {
  description = "The Amazon numeric account ID"
}

variable build_git_token {
  description = "The token used to access private repos"
}

variable build_git_url {
  description = "Where to pull the source code from originally"
}

variable build_image_repo_name {
  description = "Where to place the built docker image"
}

variable build_npm_token {
  description = "The token used to access private NPM modules"
}

variable codebuild_project_description {
  description = "The description for the build project"
}

variable codebuild_project_name {
  description = "The name of the built project"
}

variable container_name {
  description = "The name of the container to build"
}

variable container_port {
  default = 80
  description = "The port the container should use"
}

variable deploy_env_mongo_url {
  default = "mongodb://mongo/meteor"
  description = "The Mongo URL to pass to the Docker image"
}

variable deploy_env_oauthkey {
  description = "The oauth key to pass to the Docker image"
}

variable deploy_env_port {
  default = 80
  description = "The port use when deploying"
}

variable deploy_env_root_url {
  description = "The root URL the server should be listening on"
}

variable docker_name {
  description = "The name of the docker image to create"
}

variable docker_version {
  default = "latest"
  description = "The version tag of the docker image to deploy (Usually latest)"
}

variable ecs_autoscaling_desired_capacity {
  default = 2
  description = "The desired capacity of the autoscaling group"
}

variable ecs_autoscaling_max_size {
  default = 2
  description = "The maximum size of the autoscaling group"
}

variable ecs_autoscaling_min_size {
  default = 1
  description = "The minimum size of the autoscaling group"
}

variable ecs_autoscaling_name {
  description = "The ECS Autoscaling Group name"
}

variable ecs_cluster_name {
  description = "The name of the ECS cluster"
}

variable ecs_key_pair_name {
  description = "The ECS key/pair filename"
}

variable ecs_launch_configuration_image_id {
  description = "The ECS Launch Configuration Image ID (ABI)"
}

variable ecs_launch_configuration_instance_type {
  default = "t2.micro"
  description = "The ECS Launch Configuration Instance Type"
}

variable ecs_launch_configuration_name {
  description = "The ECS Launch Configuration name"
}

variable ecs_service_desired_count {
  default = 1
  description = "The desired count of ECS services"
}

variable elb_name {
  description = "The name of the ELB account"
}

variable elb_zones {
  description = "The zones for the ELB to be in"
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable iam_role_name {
  description = "The name of the IAM role"
}

variable repository_name {
  description = "The name of the repository to put the built docker image into"
}

variable service_name {
  description = "The name of the ECS Service to use"
}

variable task_definition_family {
  description = "The name of the ECS Task Definition"
}

variable vpc_availability_zone {
  default = "eu-west-1"
  description = "The availability zone for VPC "
}

variable vpc_cidr {
  description = "The IPV4 CIDR for the VPC subnet"
}

variable vpc_gateway_name {
  description = "The VPC Gateway name"
}

variable vpc_name {
  description = "The VPC name"
}

variable vpc_routes_name {
  description = "The VPC Routes name"
}

variable vpc_security_group_name {
  description = "The VPC Security Group name"
}

variable vpc_subnet_name {
  description = "The VPC subnet name"
}
