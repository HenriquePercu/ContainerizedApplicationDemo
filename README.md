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


// TODO quando executar PR também executar o build e testes unitários