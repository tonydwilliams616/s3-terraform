terraform {
  backend "s3" {
    bucket  = "cloudscaler-terraform"
    key     = "s3-project-modules/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}