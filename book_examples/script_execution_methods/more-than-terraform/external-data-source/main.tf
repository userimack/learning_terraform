terraform {
  required_version = ">= 0.13, < 0.14"
}

provider "aws" {
  region = "us-east-2"

  # Allow any 3.x version of the AWS provider
  version = "~> 3.3"
}

data "external" "echo" {
  program = ["bash", "-c", "cat /dev/stdin"]

  query = {
    foo = "bar"
  }
}

output "echo" {
  value = data.external.echo.result
}

output "echo_foo" {
  value = data.external.echo.result.foo
}
