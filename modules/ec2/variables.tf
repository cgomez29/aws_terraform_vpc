
variable "key_name" {
  description = "key name ec2"
}

variable "instance_ami" {
  description = "AMI for aws EC2 instance"
}


variable "instance_type" {
  description = "type for aws EC2 instance"
}

variable "instance_count" {
  description = "Count for aws EC2 instance"
}

variable "environment" {
  description = "Deployment Environment"
}

variable "availability_zone_a" {
    description = "Availability zone A"
    type        = string
}

variable "availability_zone_b" {
    description = "Availability zone B"
    type        = string
}

variable "private_subnets_a2_id" {
  description = "private subnet a2 id"
}

variable "private_subnets_a3_id" {
  description = "private subnet a3 id"
}

variable "vpc_id" {
  description = "vpc"
}