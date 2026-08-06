terraform {
  backend "s3" {
    bucket         = "kishor-terraform-state-2026-848647692414-ap-south-1-an"
    key            = "terraform-lab24/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
