variable "environment" {
  description = "Deployment Environment"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC A"
}

variable "public_subnets_cidr_a1" {
  description = "CIDR block for the public subnet A.1"
  type        = string
}

variable "private_subnets_cidr_a2" {
  description = "CIDR block for the private subnet A.2"
  type        = string
}

variable "private_subnets_cidr_a3" {
  description = "CIDR block for the private subnet A.3"
  type        = string
}

variable "availability_zone_a" {
    description = "Availability zone A"
    type        = string
}

variable "availability_zone_b" {
    description = "Availability zone B"
    type        = string
}