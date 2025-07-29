variable "bucket_name" {
  type = string
}

variable "force_destroy" {
  type = bool
  default = true
}

variable "environment" {
  type = string
}

variable "additional_tags" {
  type        = map(string)
  default     = {}
}

variable "enable_versioning" {
  type        = bool
}

variable "enable_encryption" {
  type        = bool
  default     = true
}

variable "kms_key_id" {
  type        = string
  default     = ""
}

variable "block_bucket_access" {
  type = bool
}

variable "expiration_days" {
  type = number
}

variable "allowed_account_id" {
  description = "AWS Account ID allowed to access the bucket"
  type        = string
}