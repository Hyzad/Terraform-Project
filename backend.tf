terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "terraform-project-remote-nc"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-project-db-nc"
    encrypt        = true
  }
}
