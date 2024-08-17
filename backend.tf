terraform {
  backend "s3" {
    bucket = "ec2-bucket"
    key    = "ec2-new/terraform.tfstate"
    region = "ap-south-1"
  }
}
