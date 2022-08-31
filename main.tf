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