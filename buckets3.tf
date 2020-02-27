#resource "aws_s3_bucket" "s3" {
  #bucket = "gunama1"
  #acl    = "private"

  #tags = {
  #  Name        = "Terraform"
    #Environment = "tfstate"
  #}
#}

terraform {
  backend "s3" {
    bucket = "gunama1"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
