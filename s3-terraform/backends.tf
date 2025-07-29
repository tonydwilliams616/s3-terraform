terraform {
  backend "s3" {
    bucket = "cloudscaler-terraform"
    key    = "s3-project/terraform.tfstate"
    region = "eu-west-2"
  }
}