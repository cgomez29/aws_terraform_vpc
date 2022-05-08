# VPC

resource "aws_vpc" "vpc" {
    cidr_block      = var.vpc_cidr

    tags = { 
        Name        = "${var.environment}-vpc" 
        Environment = var.environment
    }
}


# IG
resource "aws_internet_gateway" "redes2_igw" {
    vpc_id = aws_vpc.vpc.id

    tags = { 
        Name        = "${var.environment}-igw" 
        Environment = var.environment
    }
}

# Create Custom Route Table public and private  
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.redes2_igw.id
    }

    route {
        ipv6_cidr_block = "::/0"
        gateway_id       = aws_internet_gateway.redes2_igw.id
    }

    tags = {
        Name        = "${var.environment}-public-rt"
        Environment = "${var.environment}"
    }
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.redes2_igw.id
    }

    route {
        ipv6_cidr_block  = "::/0"
        gateway_id       = aws_internet_gateway.redes2_igw.id
    }

    tags = {
        Name        = "${var.environment}-private-rt"
        Environment = "${var.environment}"
    }
}

# Subnets  
resource "aws_subnet" "public_subnet_a1" {
    vpc_id            = aws_vpc.vpc.id
    cidr_block        = var.public_subnets_cidr_a1
    availability_zone = var.availability_zone_a

    tags = { 
        Name        = "${var.environment}-public-subnet-a1" 
        Environment = var.environment
    }
}

resource "aws_subnet" "private_subnet_a2" {
    vpc_id            = aws_vpc.vpc.id
    cidr_block        = var.private_subnets_cidr_a2
    availability_zone = var.availability_zone_b

    tags = { 
        Name        = "${var.environment}-private-subnet-a2" 
        Environment = var.environment
    }
}

resource "aws_subnet" "private_subnet_a3" {
    vpc_id            = aws_vpc.vpc.id
    cidr_block        = var.private_subnets_cidr_a3
    availability_zone = var.availability_zone_b

    tags = { 
        Name        = "${var.environment}-private-subnet-a3" 
        Environment = var.environment
    }
}

# Associate subnet with route tables
# public 
resource "aws_route_table_association" "public_rt_a1" {
    subnet_id = aws_subnet.public_subnet_a1.id
    route_table_id = aws_route_table.public_rt.id 
}

# private
resource "aws_route_table_association" "private_rt_a2" {
    subnet_id = aws_subnet.private_subnet_a2.id
    route_table_id = aws_route_table.private_rt.id 
}

resource "aws_route_table_association" "private_rt_a3" {
    subnet_id = aws_subnet.private_subnet_a3.id
    route_table_id = aws_route_table.private_rt.id 
}