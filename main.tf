resource "aws_s3_bucket" "new-bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_tag
  }
}

resource "aws_s3_bucket_acl" "new-bucket-acl" {
  bucket = aws_s3_bucket.new-bucket.id
  acl    = "private"
}

resource "aws_iam_policy" "new_bucket_access_policy" {
  name        = "${var.bucket_tag}_access_policy"
  description = "IAM policy providing access to the S3 bucket: \"${var.bucket_name}\"."

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {

        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        "Resource" : [
          "${aws_s3_bucket.new-bucket.arn}/*"
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetBucketLocation",
          "s3:ListBucket"
        ],
        "Resource" : [
          "${aws_s3_bucket.new-bucket.arn}"
        ]
      }
    ]
  })
}