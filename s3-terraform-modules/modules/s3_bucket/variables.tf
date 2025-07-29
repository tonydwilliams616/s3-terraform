variable "bucket_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "owner" {
  type = string
}

variable "enable_lifecycle" {
  type    = bool
  default = false
}