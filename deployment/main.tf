resource "aws_ecs_task_definition" "demo_container_application_task_definition" {

  family                   = var.aws_ecs_task_def_fam
  execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions = jsonencode([
    {
      name   = var.aws_ecr_repository
      image  = "${local.account_id}.dkr.ecr.${local.region_name}.amazonaws.com/demo_ecs_repository:latest" // parametrizar essa informacao
      cpu    = var.fargate_cpu
      memory = var.fargate_memory
      portMappings = [
        {
          containerPort = var.app_port
          hostPort      = var.app_port
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "main" {
  name            = var.service_name
  cluster         = data.aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.demo_container_application_task_definition.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = "subnet-029716d74513844c3"
    assign_public_ip = false
  }

  depends_on = [
    aws_ecs_task_definition.demo_container_application_task_definition,
  ]

}