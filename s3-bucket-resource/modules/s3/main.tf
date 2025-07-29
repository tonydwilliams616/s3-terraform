# Create S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  force_destroy = var.force_destroy

  tags = merge(
    {
      Name        = var.bucket_name
      Environment = var.environment
    },
    var.additional_tags
  )
}

# Bucket Versioning
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Disabled"
  }
}

# Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id
  count = var.enable_encryption ? 1 : 0

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.kms_key_id != "" ? "aws:kms" : "AES256"
      kms_master_key_id = var.kms_key_id != "" ? var.kms_key_id : null
    }
  }
}

# Public Access block
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = var.block_bucket_access
  ignore_public_acls      = var.block_bucket_access
  block_public_policy     = var.block_bucket_access
  restrict_public_buckets = var.block_bucket_access
}

# Lifeycle
resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id = "expire-objects"

    filter {}
    expiration {
      days = var.expiration_days
    }

    status = "Enabled"
  }
}

# Bucket Policy
resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowGetPutFromSpecificAccount"
        Effect    = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.allowed_account_id}:root"
        }
        Action    = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource  = "${aws_s3_bucket.this.arn}/*"
      }
    ]
  })
}