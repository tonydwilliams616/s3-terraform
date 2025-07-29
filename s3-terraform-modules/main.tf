provider "aws" {
  region = var.aws_region
}

module "s3_logs" {
  source           = "./modules/s3_bucket"
  bucket_name      = var.bucket_name
  environment      = var.environment
  owner            = var.owner
  enable_lifecycle = true
}

resource "aws_iam_policy" "s3_rw_access" {
  name        = "S3ReadWriteAccess-${var.environment}"
  description = "Allow full access to the S3 logs bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Effect = "Allow"
        Resource = [
          module.s3_logs.bucket_arn,
          "${module.s3_logs.bucket_arn}/*"
        ]
      }
    ]
  })
}
