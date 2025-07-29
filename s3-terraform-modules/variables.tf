variable "aws_region" {
  default = "eu-west-2"
}

variable "bucket_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "owner" {
  default = "devops"
  type    = string
}

variable "external_account_id" {
  default = "123456789012"  # Replace with the actual external AWS account ID
}
