resource "aws_s3_bucket" "example" {
  bucket = "${var.name_prefix}-${var.env}-s3-${var.suffix}"

  tags = {
    Name        = "${var.name_prefix}-${var.env}-s3-${var.suffix}"
    Environment = var.env
    Project     = var.project
  }
}