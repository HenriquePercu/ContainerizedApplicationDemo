## About the project

This project is a simple demo for a container application with a pipeline to be deployed in AWS 

## Stack

Java

Sprint Boot

Terraform

## Pipeline

In order to deploy, the pipeline used follow this workflow: GitHub Actions -> Terraform Cloud -> AWS.

These actions are executed when PR is open:
- Terraform plan

These actions are executed when PR merge:
- Terraform apply
- Maven Build
- Create and Push Image to ECR
- Deploy Image on ECS

TODO

- Auto scaling group
- Adicionar testes unitarios.
- Fix: Set assign_public_ip to false...actually is true because otherwise cannot download image from ECR : https://stackoverflow.com/questions/61265108/aws-ecs-fargate-resourceinitializationerror-unable-to-pull-secrets-or-registry
- Put result of unit tests on github actions