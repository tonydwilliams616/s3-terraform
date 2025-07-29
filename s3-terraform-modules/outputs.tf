output "bucket_name" {
  value = module.s3_logs.bucket_name
}

output "bucket_arn" {
  value = module.s3_logs.bucket_arn
}

output "iam_policy_arn" {
  value = aws_iam_policy.s3_rw_access.arn
}
