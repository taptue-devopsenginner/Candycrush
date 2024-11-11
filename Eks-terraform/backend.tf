terraform {
  backend "s3" {
    bucket = "tekua-bucket" # Replace with your actual S3 Name
    key    = "EKS/terraform.tfstate"
    region = "ap-south-1"
  }
}
