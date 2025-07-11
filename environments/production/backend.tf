terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket-name"  # Replace with your S3 bucket name
    key            = "terraform/production/terraform.tfstate"
    region         = "us-east-1"  # Replace with your preferred region
    encrypt        = true
    dynamodb_table = "terraform-lock"  # Optional: For state locking
  }
}
