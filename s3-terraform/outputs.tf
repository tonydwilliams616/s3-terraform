output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.logs.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.logs.arn
}