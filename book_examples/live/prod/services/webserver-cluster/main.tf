terraform {
  backend "s3" {
    key = "prod/services/webserver-cluster/terraform.tfstate"
  }
}

provider "aws" {
  region  = "us-east-2"
  version = "~> 3.3"
}

module "webserver_cluster" {
  # source = "git::https://github.com/userimack/learning_terraform.git//book_examples/modules/services/webserver-cluster?ref = v0.1.1"
  source = "../../../../modules/services/webserver-cluster"


  ami                    = "ami-0c55b159cbfafe1f0"
  server_text            = "New Server Text"
  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "terraform-up-and-running-mahendra"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate" # intentionaly using the same RDS

  instance_type      = "t2.micro"
  min_size           = 2
  max_size           = 4
  enable_autoscaling = true

  custom_tags = {
    Owner      = "team-foo"
    DeployedBy = "terraform"
  }
}
