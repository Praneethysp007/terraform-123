resource "aws_s3_bucket" "forbackend" {
    bucket = "divya-demo-xyz"
    force_destroy = true
  
}
resource "aws_s3_bucket_versioning" "new" {
    bucket = aws_s3_bucket.forbackend.id
    versioning_configuration {
      status = "Enabled"
    }
  
}

resource "aws_instance" "ec2" {
   ami = "ami-05fb0b8c1424f266b"
   instance_type = "t2.micro"
   key_name = "ysp"
}

