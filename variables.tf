variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "region" {
  description = "Region"
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment tag"
  default     = "redes2"
}

# VPC 
variable "vpc_cidr" {
  description = "CIDR block for the VPC A"
  default     = "192.168.0.0/16"
}

variable "public_subnets_cidr_a1" {
  description = "CIDR block for the public subnet A.1"
  type        = string
  default     = "192.168.1.0/24"
}

variable "private_subnets_cidr_a2" {
  description = "CIDR block for the private subnet A.2"
  type        = string
  default     = "192.168.2.0/24"
}

variable "private_subnets_cidr_a3" {
  description = "CIDR block for the private subnet A.3"
  type        = string
  default     = "192.168.3.0/24"
}

# EC2
variable "key_name" {
  description = "key name ec2"
  default     = "main-key"
}

variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default     = "ami-09d56f8956ab235b3"
}

variable "instance_type" {
  description = "type for aws EC2 instance"
  default     = "t2.micro"
}

variable "instance_count" {
  description = "Count for aws EC2 instance"
  default     = "2"
}