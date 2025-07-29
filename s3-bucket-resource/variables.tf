variable "bucket_name" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

variable "environment" {
  type = string
}
variable "enable_versioning" {
  type = bool
}

variable "enable_encryption" {
  type = bool
}

variable "block_bucket_access" {}

variable "expiration_days" {
  type = number
}

variable "allowed_account_id" {
  description = "AWS Account ID allowed to access the bucket"
  type        = string
}