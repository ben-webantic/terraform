/*
 * Variables storage
 */

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

variable cluster_name {
  description = "The name of the ECS cluster"
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

variable repository_name {
  description = "The name of the repository to put the built docker image into"
}

variable service_name {
  description = "The name of the ECS Service to use"
}

variable amazon_account {
  description = "The Amazon numeric account ID"
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

variable elb_name {
  description = "The name of the ELB account"
}

variable iam_role_name {
  description = "The name of the IAM role"
}

variable task_definition_family {
  description = "The name of the ECS Task Definition"
}