data "aws_iam_policy_document" "read_access_policy" {
  statement {
    sid = "AllowReadAccessFromOtherAccount"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.external_account_id}:root"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.logs.arn}/*"
    ]

    effect = "Allow"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.logs.id
  policy = data.aws_iam_policy_document.read_access_policy.json
}