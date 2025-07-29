module "s3_logs" {
  source              = "./modules/s3"
  bucket_name         = var.bucket_name
  environment         = var.environment
  enable_versioning   = var.enable_versioning
  enable_encryption   = var.enable_encryption
  block_bucket_access = var.block_bucket_access
  expiration_days     = var.expiration_days
  allowed_account_id  = var.allowed_account_id
}