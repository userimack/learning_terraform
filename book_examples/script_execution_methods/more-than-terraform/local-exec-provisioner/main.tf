terraform {
  required_version = ">= 0.13, < 0.14"
}

provider "aws" {
  region = "us-east-2"

  # Allow any 3.x version of the AWS provider
  version = "~> 3.3"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo \"Hello, World from $(uname -smp)\""
  }
}
