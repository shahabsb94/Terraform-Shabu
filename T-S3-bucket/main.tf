resource "aws_s3_bucket" "ssshabuss" {
    bucket = "ssshabuss"
    # acl = "private"
}

# resource "aws_s3_bucket_acl" "example" {
#     bucket = aws_s3_bucket.ssshabuss.id
#     acl = "private"
# }