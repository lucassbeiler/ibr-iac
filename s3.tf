resource "aws_s3_bucket" "ibr_bucket" {
  bucket        = "ibr-data-aws-demo"
  provider      = aws.sa-east-1
  force_destroy = false

  # acl = "private"

  tags = {
    Name = "ibr-data-aws"
  }
}
