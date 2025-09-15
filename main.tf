# -------------------------
# Provider Configuration
# -------------------------
provider "aws" {
  region = "ap-south-1"   # Change to your preferred AWS region
}

# -------------------------
# Key Pair (for SSH access)
# -------------------------
resource "aws_key_pair" "example" {
  key_name   = "my-key"
  public_key = file("~/.ssh/id_rsa.pub") # path to your public key
}

# -------------------------
# Security Group (allow SSH + HTTP)
# -------------------------
resource "aws_security_group" "example" {
  name        = "ec2-sg"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # open to all (not recommended for prod)
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# -------------------------
# EC2 Instance
# -------------------------
resource "aws_instance" "example" {
  ami           = "ami-0c1a7f89451184c8b" # Amazon Linux 2 AMI (ap-south-1 region, change as needed)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.example.key_name
  vpc_security_group_ids = [aws_security_group.example.id]

  tags = {
    Name = "MyFirstEC2"
  }
}
