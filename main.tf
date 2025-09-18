provider "aws" {
  region = us-east-1
}

resource "aws_instance" "test" {
  ami           = "ami-08982f1c5bf93d976" # Amazon Linux 2 (ap-south-1, update for your region)
  instance_type = "t3.micro"

  tags = {
    Name = "Octopus-Test-EC2"
  }
}
