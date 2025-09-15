provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "test" {
  ami           = "ami-0c1a7f89451184c8b" # Amazon Linux 2 (ap-south-1, update for your region)
  instance_type = "t2.micro"

  tags = {
    Name = "Octopus-Test-EC2"
  }
}
