resource "aws_s3_bucket" "logs" {
  bucket = "${var.bucket_name}-${var.environment}"
}

resource "aws_s3_bucket_versioning" "logs" {
  bucket = aws_s3_bucket.logs.id
  versioning_configuration {
    status = var.versioning
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "logs" {
  bucket = aws_s3_bucket.logs.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "logs" {
  bucket                  = aws_s3_bucket.logs.id
  block_public_acls       = var.bucket_access
  block_public_policy     = var.bucket_access
  ignore_public_acls      = var.bucket_access
  restrict_public_buckets = var.bucket_access
}

resource "aws_s3_bucket_lifecycle_configuration" "app_logs" {
  bucket = aws_s3_bucket.logs.id

  rule {
    id = "Allow small object transitions"

    filter {}

    status = "Enabled"

    transition {
      days          = 365
      storage_class = "GLACIER_IR"
    }
  }
}