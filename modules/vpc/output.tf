  
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnets_a1_id" {
  value = aws_subnet.public_subnet_a1.id
}

output "private_subnets_a2_id" {
  value = aws_subnet.private_subnet_a2.id
}

output "private_subnets_a3_id" {
  value = aws_subnet.private_subnet_a3.id
}
