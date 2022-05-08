# ========================================================
# SUBNET A.2 
# ========================================================
# Security Group to allow port 22, 80, 443
resource "aws_security_group" "api_sg" {
  name        = "api_sg"
  description = "api_sg"
  vpc_id      = var.vpc_id

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
        Name        = "${var.environment}-sg"
        Environment = "${var.environment}"
    }
}

# ========================================================
# API 1
# ========================================================

resource "aws_network_interface" "api1_nic" {
    subnet_id       = var.private_subnets_a2_id
    private_ips     = ["192.168.2.10"]
    security_groups = [aws_security_group.api_sg.id]
}

resource "aws_instance" "api1_instance" {
    ami               = var.instance_ami
    instance_type     = var.instance_type
    key_name          = var.key_name

    network_interface {
      network_interface_id = aws_network_interface.api1_nic.id
      device_index         = 0
    }
    
    tags = { 
        Name        = "${var.environment}-api1-instance" 
        Environment = var.environment
    }
}

# ========================================================
# API 2
# ========================================================

resource "aws_network_interface" "api2_nic" {
    subnet_id       = var.private_subnets_a2_id
    private_ips     = ["192.168.2.20"]
    security_groups = [aws_security_group.api_sg.id]
}

resource "aws_instance" "api2_instance" {
    ami               = var.instance_ami
    instance_type     = var.instance_type
    key_name          = var.key_name

    network_interface {
      network_interface_id = aws_network_interface.api2_nic.id
      device_index         = 0
    }
    
    tags = { 
        Name        = "${var.environment}-api2-instance" 
        Environment = var.environment
    }
}

# ========================================================
# SUBNET A.3
# ========================================================

# Security Group to allow port 22, 80, 443
resource "aws_security_group" "server_sg" {
  name        = "server_sg"
  description = "server_sg"
  vpc_id      = var.vpc_id

  ingress {
    description      = "TCP"
    from_port        = 4000
    to_port          = 4000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
        Name        = "${var.environment}-sg"
        Environment = "${var.environment}"
    }
}


# ========================================================
# SERVER 1
# ========================================================

resource "aws_network_interface" "server1_nic" {
    subnet_id       = var.private_subnets_a3_id
    private_ips     = ["192.168.3.10"]
    security_groups = [aws_security_group.server_sg.id]
}

resource "aws_instance" "server1_instance" {
    ami               = var.instance_ami
    instance_type     = var.instance_type
    key_name          = var.key_name

    network_interface {
      network_interface_id = aws_network_interface.server1_nic.id
      device_index         = 0
    }

    tags = { 
        Name        = "${var.environment}-server1-instance" 
        Environment = var.environment
    }
}

# ========================================================
# SERVER 2
# ========================================================

resource "aws_network_interface" "server2_nic" {
    subnet_id       = var.private_subnets_a3_id
    private_ips     = ["192.168.3.20"]
    security_groups = [aws_security_group.server_sg.id]
}

resource "aws_instance" "server2_instance" {
    ami               = var.instance_ami
    instance_type     = var.instance_type
    key_name          = var.key_name

    network_interface {
      network_interface_id = aws_network_interface.server2_nic.id
      device_index         = 0
    }

    tags = { 
        Name        = "${var.environment}-server1-instance" 
        Environment = var.environment
    }
}

# ========================================================
# SERVER 2
# ========================================================

resource "aws_network_interface" "database_nic" {
    subnet_id       = var.private_subnets_a3_id
    private_ips     = ["192.168.3.30"]
    security_groups = [aws_security_group.server_sg.id]
}

resource "aws_instance" "database_instance" {
    ami               = var.instance_ami
    instance_type     = var.instance_type
    key_name          = var.key_name

    network_interface {
      network_interface_id = aws_network_interface.database_nic.id
      device_index         = 0
    }

    tags = { 
        Name        = "${var.environment}-database-instance" 
        Environment = var.environment
    }
}
