locals {
  account_id  = data.aws_caller_identity.current.account_id
  region_name = data.aws_region.current.name
}

data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
}

data "aws_ecs_cluster" "ecs_cluster" {
  cluster_name = "demo_ecs_cluster"
}

variable "aws_ecs_task_def_fam" {
  type        = string
  description = "Task definition family description"
  default     = "demo_container_application_family"
}

variable "fargate_cpu" {
  type        = number
  description = "enter required number of cpus"
  default     = 512
}

variable "fargate_memory" {
  type        = number
  description = "Enter required memory"
  default     = 1024
}

variable "aws_container_definition_name" {
  type        = string
  description = "Container Definition Name"
  default     = "demo_containerized_app"
}

variable "app_port" {
  type        = number
  description = "Port number of the application container"
  default     = 80
}

// Service name

variable "service_name" {
  type        = string
  description = "The name of the service"
  default     = "demo_containerized_app"
}

variable "desired_count" {
  type        = number
  description = "Desired quantity of containers"
  default     = 1
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
