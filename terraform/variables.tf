# AWS provider region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

# EC2 instance
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Name of the existing AWS key pair"
  type        = string
}

# Docker image
variable "docker_image" {
  description = "Docker image to run on EC2"
  type        = string
}
