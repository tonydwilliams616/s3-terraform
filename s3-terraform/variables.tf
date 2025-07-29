variable "bucket_name" {
  type = string
}

variable "aws_region" {
  default = "eu-west-2"
}

variable "environment" {
  default = "Dev"
  type    = string
}

variable "team" {
  default = "engineering"
  type    = string
}

variable "bucket_access" {
  default = true
  type    = bool
}

variable "versioning" {
  type    = string
  default = "Disabled"
}

variable "owner" {
  type = string
}

variable "project" {
  type = string
}

variable "external_account_id" {
  default = "304783065639" 
}