provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "test" {
  ami           = "ami-043339ea831b48099" # Amazon Linux 2 (ap-south-1, update for your region)
  instance_type = "t3.micro"

  tags = {
    Name = "Octopus-Test-EC2"
  }
}
