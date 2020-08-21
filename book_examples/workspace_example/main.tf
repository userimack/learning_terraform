terraform {
  backend "s3" {
    key = "workspace-example/terraform.tfstate"
  }
}

provider "aws" {
  region  = "us-east-2"
  version = "~> 3.3"
}


resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
